local debug = require("thebeard.lazyload.debug")
local util = require("thebeard.lazyload.util")

local M = {}

---@param import string
---@return string[]
local function scan(import)
	local dir = vim.fn.stdpath("config") .. "/lua/" .. import:gsub("%.", "/")
	local specs = {}

	for _, file in ipairs(vim.fn.glob(dir .. "/*.lua", false, true)) do
		table.insert(specs, vim.fn.fnamemodify(file, ":t:r"))
	end

	table.sort(specs)

	return specs
end

---@param spec TheBeardLazyloadPluginSpec
---@return boolean
local function is_enabled(spec)
	return spec.enabled ~= false
end

---@param manifest TheBeardLazyloadManifest
---@param spec TheBeardLazyloadPluginSpec
---@param source TheBeardLazyloadPluginSpecSource
local function index_source(manifest, spec, source)
	local plugin_name = util.plugin_name(source)
	local existing = manifest.by_name[plugin_name]

	assert(
		not existing or existing == spec,
		string.format("Duplicate plugin '%s' in spec '%s'", plugin_name, spec.spec_name)
	)

	manifest.by_name[plugin_name] = spec
end

---@param manifest TheBeardLazyloadManifest
---@param spec TheBeardLazyloadPluginSpec
local function index_disabled_sources(manifest, spec)
	for _, source in ipairs(spec.sources) do
		manifest.disabled_sources[util.plugin_name(source)] = spec
	end
end

---@param opts? { import?: string }
---@return TheBeardLazyloadManifest
function M.build(opts)
	opts = opts or {}

	local import = opts.import or "plugins"

	return debug.measure("manifest.build", function()
		local manifest = {
			specs = {},
			disabled_specs = {},
			disabled_sources = {},
			by_name = {},
			by_spec_name = {},
		}

		for _, spec_name in
			ipairs(debug.measure("manifest.scan", function()
				return scan(import)
			end))
		do
			---@type TheBeardLazyloadPluginSpec
			local spec = debug.measure("spec.require:" .. spec_name, function()
				return require(import .. "." .. spec_name)
			end)

			spec.plugin_name = util.plugin_name(spec.sources[1])
			spec.spec_name = spec_name

			spec.on_cmd = util.as_list(spec.on_cmd)
			spec.on_event = util.as_list(spec.on_event)
			spec.on_filetype = util.as_list(spec.on_filetype)

			spec.before_load = spec.before_load or function() end

			assert(not manifest.by_spec_name[spec_name], string.format("Duplicate spec '%s'", spec_name))

			for _, source in ipairs(spec.sources) do
				index_source(manifest, spec, source)
			end

			manifest.by_spec_name[spec_name] = spec

			if is_enabled(spec) then
				table.insert(manifest.specs, spec)
			else
				table.insert(manifest.disabled_specs, spec)
				index_disabled_sources(manifest, spec)
				debug.log("Disabled spec", spec_name)
			end
		end

		return manifest
	end)
end

return M

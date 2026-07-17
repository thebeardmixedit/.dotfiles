local debug = require("thebeard.lazyload.debug")
local manifest = require("thebeard.lazyload.manifest")
local loader = require("thebeard.lazyload.loader")

local M = {
	---@type TheBeardLazyloadManifest?
	manifest = nil,
}

local initialized = false

local function get_manifest()
	assert(M.manifest, "thebeard.lazyload has not been setup yet")
	return M.manifest
end

---@param opts? TheBeardLazyloadSetupOptions
function M.setup(opts)
	if initialized then
		return
	end

	opts = opts or {}

	if opts.debug then
		debug.enable()
	end

	debug.measure("setup.total", function()
		M.manifest = manifest.build({
			import = opts.import or "plugins",
		})

		loader.set_manifest(M.manifest)

		for _, spec in ipairs(M.manifest.specs) do
			loader.setup_spec(spec)
		end
	end)

	initialized = true
end

M.enable_debug = debug.enable
M.disable_debug = debug.disable
M.clear_timings = debug.clear_timings

---@param opts? TheBeardLazyloadPrintOptions
function M.print_specs(opts)
	debug.print_specs(get_manifest(), opts)
end

---@param opts? TheBeardLazyloadPrintOptions
function M.print_plugins(opts)
	debug.print_plugins(get_manifest(), opts)
end

---@param opts? TheBeardLazyloadPrintOptions
function M.print_spec_names(opts)
	debug.print_spec_names(get_manifest(), opts)
end

---@param opts? TheBeardLazyloadPrintOptions
function M.print_loaded(opts)
	debug.print_loaded(opts)
end

---@param opts? TheBeardLazyloadPrintOptions
function M.print_registered_keymaps(opts)
	debug.print_registered_keymaps(opts)
end

---@param opts? TheBeardLazyloadPrintOptions
function M.print_timings(opts)
	debug.print_timings(opts)
end

---@param opts? TheBeardLazyloadPrintOptions
function M.print_timeline(opts)
	debug.print_timeline(opts)
end

---@param opts? TheBeardLazyloadPrintOptions
function M.print_load_reasons(opts)
	debug.print_load_reasons(opts)
end

---@param opts? TheBeardLazyloadPrintOptions
function M.print_load_events(opts)
	debug.print_load_events(opts)
end

---@param opts? TheBeardLazyloadPrintOptions
function M.print_load_attempts(opts)
	debug.print_load_attempts(opts)
end

return M

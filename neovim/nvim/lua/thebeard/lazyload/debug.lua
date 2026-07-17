local state = require("thebeard.lazyload.state")
local util = require("thebeard.lazyload.util")

local M = {}

local enabled = false

---@type table<string, number>
local timings = {}

function M.enable()
	enabled = true
end

function M.disable()
	enabled = false
end

---@return boolean
function M.is_enabled()
	return enabled
end

local function join(...)
	return table.concat(vim.tbl_map(tostring, { ... }), " ")
end

---@param tbl table
---@return string[]
local function sorted_keys(tbl)
	local keys = vim.tbl_keys(tbl)
	table.sort(keys)

	return keys
end

function M.log(...)
	if enabled then
		vim.notify(join(...), vim.log.levels.INFO)
	end
end

function M.warn(...)
	vim.notify(join(...), vim.log.levels.WARN)
end

function M.error(...)
	vim.notify(join(...), vim.log.levels.ERROR)
end

---@param name string
---@param fn function
---@return any
function M.measure(name, fn)
	local start = vim.uv.hrtime()
	local ok, result = pcall(fn)
	local elapsed = (vim.uv.hrtime() - start) / 1e6

	timings[name] = (timings[name] or 0) + elapsed

	if not ok then
		error(result)
	end

	return result
end

function M.clear_timings()
	timings = {}
end

---@return table[]
function M.get_timings()
	local rows = {}

	for name, ms in pairs(timings) do
		table.insert(rows, {
			name = name,
			ms = math.floor(ms * 1000 + 0.5) / 1000,
			inclusive = true,
		})
	end

	table.sort(rows, function(a, b)
		return a.ms > b.ms
	end)

	return rows
end

---Timings are inclusive and may contain nested measurements.
---@param opts? TheBeardLazyloadPrintOptions
function M.print_timings(opts)
	util.dump(M.get_timings(), opts)
end

---@param opts? TheBeardLazyloadPrintOptions
function M.print_timeline(opts)
	local events = vim.deepcopy(state.load_events())

	table.sort(events, function(a, b)
		return a.time_ms < b.time_ms
	end)

	util.dump(events, opts)
end

---@param manifest TheBeardLazyloadManifest
---@param opts? TheBeardLazyloadPrintOptions
function M.print_specs(manifest, opts)
	local specs = {}

	for _, spec in ipairs(manifest.specs) do
		table.insert(specs, util.serialize(spec))
	end

	util.dump(specs, opts)
end

---@param manifest TheBeardLazyloadManifest
---@param opts? TheBeardLazyloadPrintOptions
function M.print_plugins(manifest, opts)
	util.dump(sorted_keys(manifest.by_name), opts)
end

---@param manifest TheBeardLazyloadManifest
---@param opts? TheBeardLazyloadPrintOptions
function M.print_spec_names(manifest, opts)
	util.dump(sorted_keys(manifest.by_spec_name), opts)
end

---@param opts? TheBeardLazyloadPrintOptions
function M.print_loaded(opts)
	util.dump(state.loaded_specs(), opts)
end

---@param opts? TheBeardLazyloadPrintOptions
function M.print_registered_keymaps(opts)
	util.dump(state.registered_keymaps(), opts)
end

---@param opts? TheBeardLazyloadPrintOptions
function M.print_load_reasons(opts)
	util.dump(state.load_reasons(), opts)
end

---@param opts? TheBeardLazyloadPrintOptions
function M.print_load_events(opts)
	util.dump(state.load_events(), opts)
end

---@param opts? TheBeardLazyloadPrintOptions
function M.print_load_attempts(opts)
	util.dump(state.load_attempts(), opts)
end

return M

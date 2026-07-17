local M = {}

local MAX_LOAD_ATTEMPTS = 500

local state = {
	loaded_specs = {},
	registered_keymaps = {},
	load_reasons = {},
	load_events = {},
	load_attempts = {},
	started_at = vim.uv.hrtime(),
}

local function now_ms()
	return math.floor(((vim.uv.hrtime() - state.started_at) / 1e6) * 1000 + 0.5) / 1000
end

function M.is_loaded(spec)
	return state.loaded_specs[spec.spec_name] == true
end

function M.mark_loaded(spec)
	state.loaded_specs[spec.spec_name] = true
end

function M.keymaps_registered(spec)
	return state.registered_keymaps[spec.spec_name] == true
end

function M.mark_keymaps_registered(spec)
	state.registered_keymaps[spec.spec_name] = true
end

function M.record_load_attempt(spec, reason, loaded_now)
	table.insert(state.load_attempts, {
		spec_name = spec.spec_name,
		plugin_name = spec.plugin_name,
		reason = reason,
		loaded_now = loaded_now,
		time_ms = now_ms(),
	})

	if #state.load_attempts > MAX_LOAD_ATTEMPTS then
		table.remove(state.load_attempts, 1)
	end
end

function M.record_load_reason(spec, reason)
	if not state.load_reasons[spec.spec_name] then
		state.load_reasons[spec.spec_name] = reason
	end

	table.insert(state.load_events, {
		spec_name = spec.spec_name,
		plugin_name = spec.plugin_name,
		reason = reason,
		time_ms = now_ms(),
	})
end

function M.loaded_specs()
	return state.loaded_specs
end

function M.registered_keymaps()
	return state.registered_keymaps
end

function M.load_reasons()
	return state.load_reasons
end

function M.load_events()
	return state.load_events
end

function M.load_attempts()
	return state.load_attempts
end

function M.reset()
	state.loaded_specs = {}
	state.registered_keymaps = {}
	state.load_reasons = {}
	state.load_events = {}
	state.load_attempts = {}
	state.started_at = vim.uv.hrtime()
end

return M

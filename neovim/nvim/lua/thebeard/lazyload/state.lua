local M = {}

local MAX_LOAD_ATTEMPTS = 500

local state = {
	spec_states = {},
	spec_errors = {},
	registered_keymaps = {},
	load_reasons = {},
	load_events = {},
	load_attempts = {},
	started_at = vim.uv.hrtime(),
}

local function now_ms()
	return math.floor(((vim.uv.hrtime() - state.started_at) / 1e6) * 1000 + 0.5) / 1000
end

---@param spec TheBeardLazyloadPluginSpec
---@return TheBeardLazyloadSpecState
function M.spec_state(spec)
	return state.spec_states[spec.spec_name] or "unloaded"
end

---@param spec TheBeardLazyloadPluginSpec
---@param spec_state TheBeardLazyloadSpecState
function M.set_spec_state(spec, spec_state)
	state.spec_states[spec.spec_name] = spec_state
end

---@param spec TheBeardLazyloadPluginSpec
---@return boolean
function M.is_loaded(spec)
	return M.spec_state(spec) == "loaded"
end

---@param spec TheBeardLazyloadPluginSpec
---@return boolean
function M.is_loading(spec)
	return M.spec_state(spec) == "loading"
end

---@param spec TheBeardLazyloadPluginSpec
---@return boolean
function M.has_failed(spec)
	return M.spec_state(spec) == "failed"
end

---@param spec TheBeardLazyloadPluginSpec
---@param message string
---@param reason string
function M.mark_failed(spec, message, reason)
	state.spec_states[spec.spec_name] = "failed"
	state.spec_errors[spec.spec_name] = {
		message = message,
		reason = reason,
	}
end

---@param spec TheBeardLazyloadPluginSpec
---@return TheBeardLazyloadKeymapState
function M.keymap_state(spec)
	return state.registered_keymaps[spec.spec_name] or "none"
end

---@param spec TheBeardLazyloadPluginSpec
---@param keymap_state TheBeardLazyloadKeymapState
function M.set_keymap_state(spec, keymap_state)
	state.registered_keymaps[spec.spec_name] = keymap_state
end

---@param spec TheBeardLazyloadPluginSpec
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

---@param spec TheBeardLazyloadPluginSpec
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

---@return table<string, TheBeardLazyloadSpecState>
function M.spec_states()
	return state.spec_states
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

---@return table<string, TheBeardLazyloadSpecError>
function M.spec_errors()
	return state.spec_errors
end

function M.reset()
	state.spec_states = {}
	state.spec_errors = {}
	state.registered_keymaps = {}
	state.load_reasons = {}
	state.load_events = {}
	state.load_attempts = {}
	state.started_at = vim.uv.hrtime()
end

return M

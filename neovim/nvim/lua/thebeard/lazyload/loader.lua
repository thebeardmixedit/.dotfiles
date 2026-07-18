local debug = require("thebeard.lazyload.debug")
local state = require("thebeard.lazyload.state")
local util = require("thebeard.lazyload.util")

local M = {}

---@type TheBeardLazyloadManifest
local manifest

---@type fun(plugin_spec: TheBeardLazyloadPluginSpec, reason?: string)
local activate

---@param m TheBeardLazyloadManifest
function M.set_manifest(m)
	manifest = m
end

---@param plugin_spec TheBeardLazyloadPluginSpec
---@return boolean
local function is_enabled(plugin_spec)
	return plugin_spec.enabled ~= false
end

---@param plugin_spec TheBeardLazyloadPluginSpec
---@return boolean
local function has_keymaps(plugin_spec)
	return plugin_spec.keymaps ~= nil and #plugin_spec.keymaps > 0
end

---@param plugin_spec TheBeardLazyloadPluginSpec
---@return boolean
local function has_command_triggers(plugin_spec)
	return #util.as_list(plugin_spec.on_cmd) > 0
end

---@param plugin_spec TheBeardLazyloadPluginSpec
---@return boolean
local function has_event_triggers(plugin_spec)
	return #util.as_list(plugin_spec.on_event) > 0
end

---@param plugin_spec TheBeardLazyloadPluginSpec
---@return boolean
local function has_filetype_triggers(plugin_spec)
	return #util.as_list(plugin_spec.on_filetype) > 0
end

---@param plugin_spec TheBeardLazyloadPluginSpec
---@return boolean
local function has_triggers(plugin_spec)
	return has_command_triggers(plugin_spec) or has_event_triggers(plugin_spec) or has_filetype_triggers(plugin_spec)
end

---@param source TheBeardLazyloadPluginSpecSource
---@return TheBeardLazyloadPluginSpec?
local function disabled_source_owner(source)
	return manifest.disabled_sources[util.plugin_name(source)]
end

---@param source TheBeardLazyloadPluginSpecSource
---@return boolean
local function source_is_disabled(source)
	return disabled_source_owner(source) ~= nil
end

---@param plugin_spec TheBeardLazyloadPluginSpec
---@param reason string
---@param session_specs table<string, boolean>
local function load_dependencies(plugin_spec, reason, session_specs)
	if not plugin_spec.deps then
		return
	end

	debug.measure("pack.add.deps:" .. plugin_spec.spec_name, function()
		local raw_deps = {}

		for _, dep in ipairs(plugin_spec.deps) do
			if source_is_disabled(dep) then
				local owner = disabled_source_owner(dep) or { spec_name = "unknown" }

				debug.log(
					"Skipped disabled dependency",
					util.plugin_name(dep),
					"owned by",
					owner.spec_name,
					"required by",
					plugin_spec.spec_name
				)
			else
				local dep_spec = manifest.by_name[util.plugin_name(dep)]

				if dep_spec then
					M.load_spec(dep_spec, "dependency:" .. plugin_spec.spec_name .. " via " .. reason, session_specs)
				else
					table.insert(raw_deps, dep)
				end
			end
		end

		if #raw_deps > 0 then
			vim.pack.add(raw_deps)
		end
	end)
end

---@param plugin_spec TheBeardLazyloadPluginSpec
---@param reason? string
---@param session_specs? table<string, boolean>
---@return boolean loaded_now
function M.load_spec(plugin_spec, reason, session_specs)
	return debug.measure("load:" .. plugin_spec.spec_name, function()
		session_specs = session_specs or {}
		reason = reason or "manual"

		if not is_enabled(plugin_spec) then
			state.record_load_attempt(plugin_spec, reason, false)
			debug.log("Skipped disabled spec", plugin_spec.spec_name, "via", reason)
			return false
		end

		if session_specs[plugin_spec.spec_name] then
			return false
		end

		session_specs[plugin_spec.spec_name] = true

		if state.is_loaded(plugin_spec) then
			state.record_load_attempt(plugin_spec, reason, false)
			return false
		end

		state.record_load_attempt(plugin_spec, reason, true)
		state.record_load_reason(plugin_spec, reason)

		load_dependencies(plugin_spec, reason, session_specs)

		debug.measure("pack.add:" .. plugin_spec.spec_name, function()
			vim.pack.add(plugin_spec.sources)
		end)

		if plugin_spec.config then
			debug.measure("config:" .. plugin_spec.spec_name, plugin_spec.config)
		end

		state.mark_loaded(plugin_spec)
		debug.log("Loaded", plugin_spec.spec_name, "via", reason)

		return true
	end)
end

---@param rhs string
---@return string?
local function parse_ex_keymap(rhs)
	local cmd = vim.trim(rhs)

	if cmd:match("^<[cC][mM][dD]>") then
		cmd = cmd:gsub("^<[cC][mM][dD]>", "")
	elseif cmd:sub(1, 1) == ":" then
		cmd = cmd:sub(2)
	else
		return nil
	end

	cmd = cmd:gsub("<[cC][rR]>$", "")

	return vim.trim(cmd)
end

---@param plugin_spec TheBeardLazyloadPluginSpec
---@param keymap TheBeardLazyloadKeymap
---@param fn function
---@return function
local function wrap_lazy(plugin_spec, keymap, fn)
	return function(...)
		local reason = "keymap:" .. keymap.keys

		if not state.is_loaded(plugin_spec) then
			activate(plugin_spec, reason)
		else
			state.record_load_attempt(plugin_spec, reason, false)
		end

		return fn(...)
	end
end

---@param plugin_spec TheBeardLazyloadPluginSpec
---@param keymap TheBeardLazyloadKeymap
---@param rhs string
---@return function?
local function maybe_wrap_string_keymap(plugin_spec, keymap, rhs)
	local cmd = parse_ex_keymap(rhs)

	if not cmd then
		return nil
	end

	return wrap_lazy(plugin_spec, keymap, function()
		vim.cmd(cmd)
	end)
end

---@param plugin_spec TheBeardLazyloadPluginSpec
local function load_keymaps(plugin_spec)
	if state.keymaps_registered(plugin_spec) then
		return
	end

	if not has_keymaps(plugin_spec) then
		return
	end

	debug.measure("keymaps:" .. plugin_spec.spec_name, function()
		for _, keymap in ipairs(plugin_spec.keymaps) do
			local map = vim.deepcopy(keymap)
			local cmd = map.cmd

			if type(cmd) == "function" then
				map.cmd = wrap_lazy(plugin_spec, map, cmd)
			elseif type(cmd) == "string" then
				local wrapped = maybe_wrap_string_keymap(plugin_spec, map, cmd)

				assert(
					type(wrapped) == "function",
					string.format(
						"Lazy keymap '%s' in spec '%s' must use a function or an Ex command",
						map.keys,
						plugin_spec.spec_name
					)
				)

				map.cmd = wrapped
			end

			util.keymap(map)
		end
	end)

	state.mark_keymaps_registered(plugin_spec)
end

---@param plugin_spec TheBeardLazyloadPluginSpec
local function remove_command_triggers(plugin_spec)
	for _, cmd in ipairs(util.as_list(plugin_spec.on_cmd)) do
		pcall(vim.api.nvim_del_user_command, cmd)
	end
end

---@param plugin_spec TheBeardLazyloadPluginSpec
local function cleanup_triggers(plugin_spec)
	remove_command_triggers(plugin_spec)
end

activate = function(plugin_spec, reason)
	reason = reason or "manual"

	debug.measure("activate:" .. plugin_spec.spec_name, function()
		-- Remove command stubs before loading so the plugin can define the real commands.
		cleanup_triggers(plugin_spec)

		local loaded_now = M.load_spec(plugin_spec, reason)

		load_keymaps(plugin_spec)

		debug.log("Activated", plugin_spec.spec_name, "loaded_now=" .. tostring(loaded_now), "reason=" .. reason)
	end)
end

---@param prefix string
---@param plugin_spec TheBeardLazyloadPluginSpec
---@return integer
local function augroup(prefix, plugin_spec)
	return vim.api.nvim_create_augroup(prefix .. plugin_spec.spec_name, { clear = true })
end

---@param plugin_spec TheBeardLazyloadPluginSpec
local function register_event_trigger(plugin_spec)
	if not has_event_triggers(plugin_spec) then
		return
	end

	debug.measure("trigger.event:" .. plugin_spec.spec_name, function()
		vim.api.nvim_create_autocmd(util.as_list(plugin_spec.on_event), {
			group = augroup("thebeard-defer-", plugin_spec),
			once = true,
			callback = function(event)
				activate(plugin_spec, "event:" .. event.event)
			end,
		})
	end)
end

---@param plugin_spec TheBeardLazyloadPluginSpec
local function register_filetype_trigger(plugin_spec)
	if not has_filetype_triggers(plugin_spec) then
		return
	end

	debug.measure("trigger.filetype:" .. plugin_spec.spec_name, function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = util.as_list(plugin_spec.on_filetype),
			group = augroup("thebeard-defer-ft-", plugin_spec),
			once = true,
			callback = function(event)
				activate(plugin_spec, "filetype:" .. event.match)
			end,
		})
	end)
end

---@param args vim.api.keyset.create_user_command.command_args
---@return integer[]?
local function command_range(args)
	if args.range == 2 then
		return { args.line1, args.line2 }
	end

	if args.range == 1 then
		return { args.line1 }
	end

	return nil
end

---@param cmd string
---@param args vim.api.keyset.create_user_command.command_args
local function replay_command(cmd, args)
	local ex = {
		cmd = cmd,
		args = args.fargs,
		bang = args.bang,
		mods = args.smods,
		range = command_range(args),
	}

	if args.count and args.count > 0 then
		ex.count = args.count
	end

	if args.reg and args.reg ~= "" then
		ex.reg = args.reg
	end

	vim.api.nvim_cmd(ex, {})
end

---@param plugin_spec TheBeardLazyloadPluginSpec
local function register_command_trigger(plugin_spec)
	if not has_command_triggers(plugin_spec) then
		return
	end

	debug.measure("trigger.command:" .. plugin_spec.spec_name, function()
		for _, cmd in ipairs(util.as_list(plugin_spec.on_cmd)) do
			vim.api.nvim_create_user_command(cmd, function(args)
				activate(plugin_spec, "cmd:" .. cmd)
				replay_command(cmd, args)
			end, {
				nargs = "*",
				bang = true,
				range = true,
				desc = string.format("Lazy load %s and run %s", plugin_spec.spec_name, cmd),
			})
		end
	end)
end

---@param plugin_spec TheBeardLazyloadPluginSpec
local function register_default_trigger(plugin_spec)
	debug.measure("trigger.default:" .. plugin_spec.spec_name, function()
		vim.api.nvim_create_autocmd("VimEnter", {
			group = augroup("thebeard-defer-vimenter-", plugin_spec),
			once = true,
			callback = function()
				activate(plugin_spec, "event:VimEnter")
			end,
		})
	end)
end

---@param plugin_spec TheBeardLazyloadPluginSpec
local function register_triggers(plugin_spec)
	register_event_trigger(plugin_spec)
	register_filetype_trigger(plugin_spec)
	register_command_trigger(plugin_spec)

	if not has_triggers(plugin_spec) and not has_keymaps(plugin_spec) then
		register_default_trigger(plugin_spec)
	end
end

---@param plugin_spec TheBeardLazyloadPluginSpec
function M.setup_spec(plugin_spec)
	debug.measure("setup:" .. plugin_spec.spec_name, function()
		plugin_spec.before_load()

		if plugin_spec.eager then
			M.load_spec(plugin_spec, "startup:eager")
			load_keymaps(plugin_spec)
			return
		end

		load_keymaps(plugin_spec)
		register_triggers(plugin_spec)
	end)
end

return M

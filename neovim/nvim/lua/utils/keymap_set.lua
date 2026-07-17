---@class KeymapSetArgs
---@field keys string
---@field cmd string|function
---@field opts? vim.api.keyset.keymap
---@field modes? string|string[]

---@param args KeymapSetArgs
return function(args)
	local keys = assert(args.keys, "keymap requires keys")
	local cmd = assert(args.cmd, "keymap requires cmd")
	local modes = args.modes or "n"
	local opts = args.opts or {}

	local mapopts = vim.tbl_extend("force", {
		silent = true,
	}, opts)

	vim.keymap.set(modes, keys, cmd, mapopts)
end

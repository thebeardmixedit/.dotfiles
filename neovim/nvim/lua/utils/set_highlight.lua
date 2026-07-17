---@param args {groups:table,prefix:string|nil,add_inverted:boolean|nil}
return function(args)
	local prefix = args.prefix or ""
	local add_inverted = args.add_inverted or false
	local groups = args.groups

	for group, opts in pairs(groups) do
		group = prefix .. group
		vim.api.nvim_set_hl(0, group, opts)

		if add_inverted == true then
			local inv_opts = { bg = opts.fg, fg = opts.bg }
			vim.api.nvim_set_hl(0, group .. "Inverted", inv_opts)
		end
	end
end

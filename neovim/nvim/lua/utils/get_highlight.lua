-- get colors from a highlight group
---@param group string
---@return vim.api.keyset.get_hl_info
return function(group)
	return vim.api.nvim_get_hl(0, {
		name = group,
		link = false,
		create = false,
	})
end

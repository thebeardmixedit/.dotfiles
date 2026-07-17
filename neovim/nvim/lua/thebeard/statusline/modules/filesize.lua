local utils = require("thebeard.statusline.utils")

return {
	---@param opts? {bufnr?:integer}
	render = function(opts)
		opts = opts or {}
		local bufnr = opts.bufnr or 0

		if utils.should_hide_module(bufnr) then
			return ""
		end

		local size = vim.fn.getfsize(vim.api.nvim_buf_get_name(bufnr))

		if size <= 0 then
			return ""
		end

		local size_str

		if size < 1024 then
			size_str = size .. "B"
		elseif size < 1024 * 1024 then
			size_str = string.format("%.1fK", size / 1024)
		else
			size_str = string.format("%.1fM", size / 1024 / 1024)
		end

		return utils.buffer_hl(bufnr) .. "(" .. size_str .. ")" .. "%*"
	end,
}

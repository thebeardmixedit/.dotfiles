local utils = require("thebeard.statusline.utils")

return {
	---@param opts? {win?:integer,bufnr?:integer}
	render = function(opts)
		opts = opts or {}
		local win = opts.win or 0
		local bufnr = opts.bufnr or 0

		if utils.should_hide_module(bufnr) then
			return ""
		end

		local icon_hl = "%#Structure#"
		local pos_hl = "%#StatusLine#"
		local pos = vim.api.nvim_win_get_cursor(win)
		local position = pos[1] .. ":" .. pos[2]

		return icon_hl .. " " .. pos_hl .. position .. "%*"
	end,
}

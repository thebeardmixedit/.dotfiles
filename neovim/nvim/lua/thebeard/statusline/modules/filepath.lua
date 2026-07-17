local state = require("thebeard.statusline.state")
local utils = require("thebeard.statusline.utils")

return {
	---@param target_value? "enable"|"disable"|"toggle"
	toggle_path = function(target_value)
		state.toggle_path(target_value)
	end,

	---@param opts? {bufnr?:integer}
	render = function(opts)
		opts = opts or {}
		local bufnr = opts.bufnr or 0

		local name = vim.api.nvim_buf_get_name(bufnr)
		local filename = vim.fn.fnamemodify(name, ":t")
		local relativepath = vim.fn.fnamemodify(name, ":.")
		local cwd = vim.fn.getcwd()
		local basename = vim.fn.fnamemodify(cwd, ":t")
		local workingpath = basename .. "/" .. relativepath

		if filename == "" or relativepath == "" or vim.fn.fnamemodify(relativepath, ":t") == basename then
			workingpath = basename
		end

		local filetype = utils.filetype(bufnr)
		local hl = utils.buffer_hl(bufnr)

		if filetype == "netrw" then
			return "%#StatusLineNetrw#" .. workingpath .. "%*"
		end

		if filetype == "toggleterm" then
			local shell = vim.fn.fnamemodify(name, ":t"):gsub(";#toggleterm#", "")

			return "%#StatusLine# " .. shell .. "%*"
		end

		if filetype == "NeogitStatus" then
			if state.git_branch_modified() then
				hl = "%#StatusLineGitBranchModified#"
			else
				hl = "%#StatusLineGitBranchUpToDate#"
			end

			return hl .. filetype .. "%*"
		end

		if state.show_path() then
			return hl .. workingpath .. "%*"
		end

		return hl .. filename .. "%*"
	end,
}

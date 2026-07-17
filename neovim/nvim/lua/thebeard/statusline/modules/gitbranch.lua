local state = require("thebeard.statusline.state")
local utils = require("thebeard.statusline.utils")

vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("thebeard-statusline-gitbranchupdate", { clear = true }),
	desc = "Update statusline git branch state after writing to file",
	callback = function()
		state.refresh_git_branch_modified()
		vim.cmd("redrawstatus")
	end,
})

return {
	---@param opts? {bufnr?:integer}
	render = function(opts)
		opts = opts or {}
		local bufnr = opts.bufnr or 0

		if utils.should_hide_module(bufnr) then
			return ""
		end

		local gitsigns_status = vim.b[bufnr].gitsigns_status_dict

		if not gitsigns_status or gitsigns_status.head == "" then
			return ""
		end

		local hl = state.git_branch_modified() and "%#StatusLineGitBranchModified#" or "%#StatusLineGitBranchUpToDate#"

		return hl .. " " .. gitsigns_status.head .. "%*"
	end,
}

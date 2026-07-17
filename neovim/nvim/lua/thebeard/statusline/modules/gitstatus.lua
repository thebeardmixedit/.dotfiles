local utils = require("thebeard.statusline.utils")

vim.api.nvim_create_autocmd("User", {
	group = vim.api.nvim_create_augroup("thebeard-statusline-gitsignsupdate", { clear = true }),
	desc = "Update statusline when gitsigns updates",
	pattern = "GitSignsUpdate",
	command = "redrawstatus",
})

return {
	---@param opts? {bufnr:integer,reverse:boolean}
	render = function(opts)
		opts = opts or {}
		local bufnr = opts.bufnr or 0
		local reverse = opts.reverse or false

		if utils.should_hide_module(bufnr) then
			return ""
		end

		local gitsigns_status = vim.b[bufnr].gitsigns_status_dict

		if not gitsigns_status or gitsigns_status.head == "" then
			return ""
		end

		local added_hl = "%#StatusLineNC#"
		local changed_hl = "%#StatusLineNC#"
		local removed_hl = "%#StatusLineNC#"

		local added_count = gitsigns_status.added or 0
		local changed_count = gitsigns_status.changed or 0
		local removed_count = gitsigns_status.removed or 0

		if added_count > 0 then
			added_hl = "%#StatusLineGitStatusAdded#"
		end

		if changed_count > 0 then
			changed_hl = "%#StatusLineGitStatusChanged#"
		end

		if removed_count > 0 then
			removed_hl = "%#StatusLineGitStatusRemoved#"
		end

		local added = added_hl .. " " .. added_count .. "%*"
		local changed = changed_hl .. " " .. changed_count .. "%*"
		local removed = removed_hl .. " " .. removed_count .. "%*"

		if reverse == true then
			return removed .. " " .. changed .. " " .. added
		end

		return added .. " " .. changed .. " " .. removed
	end,
}

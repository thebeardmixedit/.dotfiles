local M = {}

local show_path = false
local git_branch_modified = false

function M.show_path()
	return show_path
end

---@param target_value "enable"|"disable"|"toggle"|nil
function M.toggle_path(target_value)
	if target_value == "enable" then
		show_path = true
	elseif target_value == "disable" then
		show_path = false
	else
		show_path = not show_path
	end

	vim.cmd("redrawstatus")
end

function M.git_branch_modified()
	return git_branch_modified
end

---@param value boolean
function M.set_git_branch_modified(value)
	git_branch_modified = value == true
end

function M.refresh_git_branch_modified()
	git_branch_modified = vim.fn.system("git status --porcelain 2>/dev/null") ~= ""

	return git_branch_modified
end

return M

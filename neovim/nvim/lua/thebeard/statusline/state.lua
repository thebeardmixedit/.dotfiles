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

---@param bufnr? integer
function M.refresh_git_branch_modified(bufnr)
	bufnr = bufnr or vim.api.nvim_get_current_buf()
	local name = vim.api.nvim_buf_get_name(bufnr)
	local directory = name ~= "" and vim.bo[bufnr].buftype == "" and vim.fn.fnamemodify(name, ":h") or vim.fn.getcwd()
	local output = vim.fn.system({ "git", "-C", directory, "status", "--porcelain" })
	git_branch_modified = vim.v.shell_error == 0 and output ~= ""

	return git_branch_modified
end

return M

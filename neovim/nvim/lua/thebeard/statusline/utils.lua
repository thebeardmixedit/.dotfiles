local M = {}

local hidden_filetypes = {
	netrw = true,
	toggleterm = true,
	scratch = true,
	NeogitStatus = true,
}

local empty_statusline_filetypes = {
	fzf = true,
	harpoon = true,
}

---@param bufnr integer
---@return string
function M.filetype(bufnr)
	return vim.bo[bufnr].filetype
end

---@param filetype string
---@return boolean
function M.is_hidden_filetype(filetype)
	return hidden_filetypes[filetype] == true
end

---@param filetype string
---@return boolean
function M.is_empty_statusline_filetype(filetype)
	return empty_statusline_filetypes[filetype] == true
end

---@param bufnr integer
---@return boolean
function M.should_hide_module(bufnr)
	return M.is_hidden_filetype(M.filetype(bufnr))
end

---@param bufnr integer
---@return string
function M.buffer_hl(bufnr)
	if vim.bo[bufnr].readonly then
		return "%#StatusLineBufferReadOnly#"
	end

	if vim.bo[bufnr].modified then
		return "%#StatusLineBufferModified#"
	end

	return "%#StatusLine#"
end

return M

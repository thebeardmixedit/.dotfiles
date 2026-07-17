local state = require("thebeard.statusline.state")

local types = {
	default = { icon = "󰈔 ", hl = "%#StatusLine#" },
	lua = { icon = "󰢱 ", hl = "%#Directory#" },
	python = { icon = " ", hl = "%#Structure#" },
	javascript = { icon = " ", hl = "%#Structure#" },
	typescript = { icon = " ", hl = "%#Directory#" },
	javascriptreact = { icon = " ", hl = "%#Structure#" },
	typescriptreact = { icon = " ", hl = "%#Directory#" },
	html = { icon = " ", hl = "%#Removed#" },
	css = { icon = " ", hl = "%#Directory#" },
	scss = { icon = " ", hl = "%#Directory#" },
	json = { icon = " ", hl = "%#Structure#" },
	markdown = { icon = " ", hl = "%#Directory#" },
	vim = { icon = " ", hl = "%#Conditional#" },
	sh = { icon = "  ", hl = "%#Number#" },
	bash = { icon = "  ", hl = "%#Number#" },
	zsh = { icon = "  ", hl = "%#Number#" },
	rust = { icon = " ", hl = "%#Removed#" },
	go = { icon = " ", hl = "%#Directory#" },
	c = { icon = " ", hl = "%#Directory#" },
	cpp = { icon = "󰙲 ", hl = "%#Directory#" },
	cs = { icon = " ", hl = "%#Conditional#" },
	java = { icon = "󰬷 ", hl = "%#Number#" },
	php = { icon = " ", hl = "%#Conditional#" },
	ruby = { icon = " ", hl = "%#Removed#" },
	swift = { icon = "󰛥 ", hl = "%#Directory#" },
	kotlin = { icon = " ", hl = "%#Number#" },
	dart = { icon = " ", hl = "%#Directory#" },
	elixir = { icon = " ", hl = "%#Directory#" },
	haskell = { icon = " ", hl = "%#Conditional#" },
	sql = { icon = " ", hl = "%#Directory#" },
	yaml = { icon = " ", hl = "%#Conditional#" },
	toml = { icon = " ", hl = "%#Number#" },
	xml = { icon = "󰗀 ", hl = "%#DiffAdded#" },
	dockerfile = { icon = "󰡨 ", hl = "%#Directory#" },
	gitcommit = { icon = " ", hl = "%#Number#" },
	gitconfig = { icon = " ", hl = "%#Number#" },
	vue = { icon = " ", hl = "%#DiffAdded#" },
	svelte = { icon = " ", hl = "%#Removed#" },
	astro = { icon = " ", hl = "%#Number#" },
	netrw = { icon = "  ", hl = "%#StatusLine#" },
	toggleterm = { icon = " ", hl = "%#StatusLine#" },
	fzf = { icon = "", hl = "%#StatusLine#" },
}

local function neogit_status()
	local hl = state.git_branch_modified() and "%#StatusLineGitBranchModified#" or "%#StatusLineGitBranchUpToDate#"

	return {
		icon = " ",
		hl = hl,
	}
end

return {
	---@param opts {bufnr:integer|nil}|nil
	render = function(opts)
		opts = opts or {}
		local bufnr = opts.bufnr or 0

		local filetype = vim.bo[bufnr].filetype

		if filetype == "" then
			return ""
		end

		local type = filetype == "NeogitStatus" and neogit_status() or types[filetype] or types.default

		return type.hl .. type.icon .. "%*"
	end,
}

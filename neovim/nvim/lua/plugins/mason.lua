local u = require("utils")

---@type TheBeardLazyloadPluginSpec
return {
	sources = {
		"https://github.com/mason-org/mason.nvim.git",
		"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim.git",
	},
	on_cmd = { "Mason" },
	on_filetype = u.filetypes.lsp,
	config = function()
		local ensure_installed = {
			-- LSP servers
			"lua-language-server",
			"bash-language-server",
			"typescript-language-server",
			"html-lsp",
			"css-lsp",
			"tailwindcss-language-server",
			"pyright",
			"json-lsp",
			"emmet-ls",

			-- Formatters and linters
			"stylua",
			"shellcheck",
			"shfmt",
			"prettier",
			"eslint_d",
			"black",
		}

		require("mason").setup({})

		require("mason-tool-installer").setup({
			ensure_installed = ensure_installed,
		})
	end,
	load_keymaps_eagerly = true,
	keymaps = {
		{ keys = "<leader>lm", cmd = "<cmd>Mason<CR>", opts = { desc = "[m]ason" } },
	},
}

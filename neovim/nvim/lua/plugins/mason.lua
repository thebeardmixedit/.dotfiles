---@type TheBeardLazyloadPluginSpec
return {
	sources = {
		"https://github.com/mason-org/mason.nvim.git",
		"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim.git",
	},
	eager = true,
	config = function()
		local ensure_installed = {
			-- LSP servers
			"lua-language-server",
			"bash-language-server",
			"typescript-language-server",
			"html-lsp",
			"css-lsp",
			"tailwindcss-language-server",
			"json-lsp",
			"emmet-ls",
			"yaml-language-server",
			"taplo",

			-- Formatters and linters
			"stylua",
			"shellcheck",
			"shfmt",
			"prettier",
			"eslint_d",
			"yamllint",
		}

		require("mason").setup({})

		require("mason-tool-installer").setup({
			ensure_installed = ensure_installed,
			run_on_start = true,
		})
	end,
	keymaps = {
		{ keys = "<leader>lm", cmd = "<cmd>Mason<CR>", opts = { desc = "[m]ason" } },
	},
}

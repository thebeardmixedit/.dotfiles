---@type TheBeardLazyloadPluginSpec
return {
	sources = {
		{ src = "https://github.com/L3MON4D3/LuaSnip.git", version = vim.version.range("2.*") },
		"https://github.com/chrisgrieser/nvim-scissors",
		"https://github.com/rafamadriz/friendly-snippets.git",
	},
	on_event = "InsertEnter",
	config = function()
		local luasnip = require("luasnip")
		local vscode_loader = require("luasnip.loaders.from_vscode")

		luasnip.setup({})

		require("scissors").setup({
			snippetDir = vim.fn.stdpath("config") .. "/snippets",
		})

		vscode_loader.lazy_load()
		vscode_loader.lazy_load({
			paths = {
				vim.fn.stdpath("config") .. "/snippets",
			},
		})

		luasnip.filetype_extend("javascriptreact", { "javascript", "html" })
		luasnip.filetype_extend("typescriptreact", { "typescript", "javascript", "html" })
		luasnip.filetype_extend("svelte", { "html", "javascript", "typescript", "css" })
	end,
	keymaps = {
		{
			modes = { "n", "i", "v" },
			keys = "<C-s>e",
			cmd = function()
				require("scissors").editSnippet()
			end,
			opts = { desc = "[e]dit snippet" },
		},
		{
			modes = { "n", "i", "v" },
			keys = "<C-s>a",
			cmd = function()
				require("scissors").addNewSnippet()
			end,
			opts = { desc = "[a]dd snippet" },
		},
	},
}

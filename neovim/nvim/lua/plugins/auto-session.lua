---@type TheBeardLazyloadPluginSpec
return {
	sources = { "https://github.com/rmagatti/auto-session.git" },
	config = function()
		---@type AutoSession.Config
		require("auto-session").setup({
			auto_restore = false,
			session_lens = {
				picker = "fzf",
				mappings = {
					delete_session = { { "n", "i" }, "<C-d>" },
					alternate_session = { { "n", "i" }, "<C-s>" },
					copy_session = { { "n", "i" }, "<C-y>" },
				},
				picker_opts = {
					title = " Sessions ",
					height = 0.50,
					width = 0.50,
				},
			},
		})
	end,
	keymaps = {
		{ keys = "<leader>as", cmd = "<cmd>AutoSession save<CR>", opts = { desc = "[s]ave session" } },
		{ keys = "<leader>ar", cmd = "<cmd>AutoSession restore<CR>", opts = { desc = "[r]estore session" } },
		{ keys = "<leader>af", cmd = "<cmd>AutoSession search<CR>", opts = { desc = "[f]ind session" } },
		{ keys = "<leader>at", cmd = "<cmd>AutoSession toggle<CR>", opts = { desc = "[t]oggle auto-save" } },
	},
}

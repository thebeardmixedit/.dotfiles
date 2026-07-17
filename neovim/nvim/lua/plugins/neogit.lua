---@type TheBeardLazyloadPluginSpec
return {
	sources = { "https://github.com/NeogitOrg/neogit.git" },
	deps = {
		"https://github.com/esmuellert/codediff.nvim.git",
		"https://github.com/ibhagwan/fzf-lua.git",
		"https://github.com/nvim-lua/plenary.nvim.git",
	},
	on_cmd = { "Neogit" },
	config = function()
		require("neogit").setup({
			filewatcher = {
				interval = 30000,
				enabled = true,
			},
			auto_refresh = false,
			kind = "split_below",
			integrations = {
				fzf_lua = true,
			},
		})
	end,
	keymaps = {
		{
			keys = "<leader>gs",
			cmd = function()
				require("neogit").open()
			end,
			opts = { desc = "[s]tatus" },
		},
	},
}

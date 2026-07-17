---@type TheBeardLazyloadPluginSpec
return {
	sources = { "https://github.com/johnseth97/codex.nvim.git" },
	on_cmd = { "Codex", "CodexToggle" },
	keymaps = {
		{
			keys = "<leader>cc",
			cmd = function()
				require("codex").toggle()
			end,
			modes = { "n", "t" },
			opts = { desc = "[c]odex" },
		},
	},
	config = function()
		require("codex").setup({
			panel = true,
			width = 0.4,
		})
	end,
}

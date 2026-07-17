---@type TheBeardLazyloadPluginSpec
return {
	sources = { "https://github.com/MeanderingProgrammer/render-markdown.nvim.git" },
	deps = {
		"https://github.com/thebeardmixedit/nvim-treesitter.git",
		"https://github.com/nvim-mini/mini.nvim.git",
	},
	on_filetype = {
		"markdown",
	},
	on_cmd = {
		"RenderMarkdown",
	},
	config = function()
		require("render-markdown").setup({})
	end,
	keymaps = {
		{
			keys = "<leader>r",
			cmd = "<cmd>RenderMarkdown toggle<CR>",
			opts = { desc = "[r]ender markdown toggle" },
		},
	},
}

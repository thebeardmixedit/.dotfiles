---@type TheBeardLazyloadPluginSpec
return {
	sources = { "https://github.com/folke/noice.nvim.git" },
	deps = {
		"https://github.com/MunifTanjim/nui.nvim.git",
		"https://github.com/rcarriga/nvim-notify.git",
		"https://github.com/ibhagwan/fzf-lua.git",
	},
	on_event = "VimEnter",
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("notify").setup({
			background_colour = "#000000",
			stages = "slide",
			render = "compact",
			timeout = 500,
		})

		require("noice").setup({
			cmdline = {
				enabled = true,
				view = "cmdline_popup",
			},
			lsp = {
				progress = {
					enabled = false,
				},
			},
		})
	end,
	keymaps = {
		{
			keys = "<leader>n",
			cmd = function()
				require("noice").cmd("fzf")
			end,
			opts = { desc = "[n]otification history" },
		},
	},
}

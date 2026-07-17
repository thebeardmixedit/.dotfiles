---@type TheBeardLazyloadPluginSpec
return {
	sources = { "https://github.com/akinsho/toggleterm.nvim.git" },
	on_cmd = { "ToggleTerm" },
	config = function()
		require("toggleterm").setup({
			-- open_mapping = [[<C-esc>]],
			highlights = {
				Normal = {
					link = "Normal",
				},
				NormalFloat = {
					link = "Normal",
				},
				StatusLine = {
					link = "Normal",
				},
				StatusLineNC = {
					link = "Normal",
				},
			},
		})
	end,
	keymaps = {
		{ keys = "<C-t>", cmd = ":ToggleTerm size=40 direction=horizontal<CR>" },
		{
			modes = "t",
			keys = "<C-t>",
			cmd = function()
				vim.cmd("stopinsert")
				vim.cmd("ToggleTerm size=40 direction=horizontal")
			end,
		},
		{ modes = "t", keys = "<Esc>", cmd = [[<C-\><C-n>]] },
		{ modes = "t", keys = "<C-h>", cmd = "<C-w><C-h>" },
		{ modes = "t", keys = "<C-j>", cmd = "<C-w><C-j>" },
		{ modes = "t", keys = "<C-k>", cmd = "<C-w><C-k>" },
		{ modes = "t", keys = "<C-l>", cmd = "<C-w><C-l>" },
	},
}

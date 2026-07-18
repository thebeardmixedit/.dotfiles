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
		{
			keys = "<C-t>",
			cmd = ":ToggleTerm size=40 direction=horizontal<CR>",
			desc = "Toggle terminal",
		},
		{
			modes = "t",
			keys = "<C-t>",
			cmd = function()
				vim.cmd("stopinsert")
				vim.cmd("ToggleTerm size=40 direction=horizontal")
			end,
			desc = "Close terminal",
		},
	},
}

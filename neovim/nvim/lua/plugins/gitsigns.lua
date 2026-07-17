---@type TheBeardLazyloadPluginSpec
return {
	sources = { "https://github.com/lewis6991/gitsigns.nvim.git" },
	eager = true,
	config = function()
		local set_hl = require("utils.set_highlight")
		local palette = require("catppuccin.palettes").get_palette("mocha")

		require("gitsigns").setup({
			signs = {
				add = { text = " " },
				change = { text = " " },
				delete = { text = " " },
				topdelete = { text = " " },
				changedelete = { text = " " },
				untracked = { text = " " },
			},
			signcolumn = true,
			current_line_blame = true,
			attach_to_untracked = true,
		})

		set_hl({
			prefix = "GitSigns",
			groups = {
				Untracked = { fg = palette.blue },
				UntrackedNr = { fg = palette.blue },
				UntrackedCul = { fg = palette.blue },
			},
		})
	end,
	keymaps = {
		{
			keys = "<leader>gp",
			cmd = "<cmd>Gitsigns preview_hunk_inline<CR>",
			opts = { desc = "[p]review hunk inline" },
		},
		{ keys = "<leader>gP", cmd = "<cmd>Gitsigns preview_hunk<CR>", opts = { desc = "[P]review hunk" } },
		{
			keys = "<leader>gl",
			cmd = "<cmd>Gitsigns toggle_linehl<CR>",
			opts = { desc = "[l]ine highlight toggle" },
		},
	},
}

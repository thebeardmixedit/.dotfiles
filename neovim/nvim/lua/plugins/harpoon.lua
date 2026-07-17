---@type TheBeardLazyloadPluginSpec
return {
	sources = { { src = "https://github.com/ThePrimeagen/harpoon.git", version = "harpoon2" } },
	deps = { "https://github.com/nvim-lua/plenary.nvim.git" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()
	end,
	keymaps = {
		{
			keys = "<leader>ha",
			cmd = function()
				local harpoon = require("harpoon")
				harpoon:list():add()
			end,
			opts = { desc = "[a]dd current buffer" },
		},
		{
			keys = "<leader>hl",
			cmd = function()
				local harpoon = require("harpoon")
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			opts = { desc = "show [l]ist" },
		},
		{
			keys = "<leader>h1",
			cmd = function()
				local harpoon = require("harpoon")
				harpoon:list():select(1)
			end,
			opts = { desc = "harpoon [1]" },
		},
		{
			keys = "<leader>h2",
			cmd = function()
				local harpoon = require("harpoon")
				harpoon:list():select(2)
			end,
			opts = { desc = "harpoon [2]" },
		},
		{
			keys = "<leader>h3",
			cmd = function()
				local harpoon = require("harpoon")
				harpoon:list():select(3)
			end,
			opts = { desc = "harpoon [3]" },
		},
		{
			keys = "<leader>h4",
			cmd = function()
				local harpoon = require("harpoon")
				harpoon:list():select(4)
			end,
			opts = { desc = "harpoon [4]" },
		},
		{
			keys = "<leader>h5",
			cmd = function()
				local harpoon = require("harpoon")
				harpoon:list():select(5)
			end,
			opts = { desc = "harpoon [5]" },
		},
		{
			keys = "<leader>hn",
			cmd = function()
				local harpoon = require("harpoon")
				harpoon:list():next()
			end,
			opts = { desc = "[n]ext harpoon" },
		},
		{
			keys = "<leader>hp",
			cmd = function()
				local harpoon = require("harpoon")
				harpoon:list():prev()
			end,
			opts = { desc = "[p]revious harpoon" },
		},
	},
}

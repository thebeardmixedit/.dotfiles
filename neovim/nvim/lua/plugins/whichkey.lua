---@type TheBeardLazyloadPluginSpec
return {
	sources = { "https://github.com/folke/which-key.nvim.git" },
	deps = { "https://github.com/nvim-mini/mini.nvim.git" },
	eager = true,
	config = function()
		local whichkey = require("which-key")

		whichkey.setup({
			delay = 0,
			icons = {
				mappings = true,
				group = "",
				separator = "",
			},
			preset = "helix",
			win = { title_pos = "right" },
		})

		whichkey.add({
			{ "<leader>e", icon = { icon = "󱧶 ", color = "azure" } },
			{ "<leader>m", icon = { icon = " ", color = "yellow" } },
			{ "<leader>n", icon = { icon = "󰎟 ", color = "cyan" } },
			{ "<leader>r", icon = { icon = " ", color = "blue" } },
			{ "<leader>y", icon = { icon = "󱔗 ", color = "orange" } },
			{ "<leader>?", icon = { icon = "󰌌 ", color = "purple" } },
			{ "<leader><leader>", icon = { icon = "󰱼 ", color = "green" } },
			{ "<leader>a", group = "[a]uto-session", icon = { icon = "󰆓 ", color = "yellow" } },
			{ "<leader>af", icon = { icon = " ", color = "yellow" } },
			{ "<leader>ar", icon = { icon = " ", color = "yellow" } },
			{ "<leader>as", icon = { icon = " ", color = "yellow" } },
			{ "<leader>c", group = "[c]ode", icon = { icon = " ", color = "azure" } },
			{ "<leader>cc", icon = { icon = " ", color = "azure" } },
			{ "<leader>d", group = "[d]iagnostics", icon = { icon = "󰝖 ", color = "red" } },
			{ "<leader>f", group = "[f]ile/find", icon = { icon = "󰈔 ", color = "blue" } },
			{ "<leader>g", group = "[g]it", icon = { icon = "󰊢 ", color = "orange" } },
			{ "<leader>h", group = "[h]arpoon", icon = { icon = "󱠿 ", color = "purple" } },
			{ "<leader>i", group = "[i]nsert", icon = { icon = " ", color = "yellow" } },
			{ "<leader>l", group = "[l]sp", icon = { icon = "󱪙 ", color = "grey" } },
			{ "<leader>s", group = "[s]earch", icon = { icon = " ", color = "green" } },
		})
	end,
	keymaps = {
		{
			keys = "<leader>?",
			cmd = function()
				require("which-key").show({ global = false })
			end,
			opts = { desc = "[?]buffer local keymaps" },
		},
	},
}

---@type TheBeardLazyloadPluginSpec
return {
	sources = { "https://github.com/uga-rosa/ccc.nvim.git" },
	on_cmd = { "CccPick", "CccConvert" },
	config = function()
		local ccc = require("ccc")
		local cmd = ccc.mapping

		ccc.setup({
			highlighter = {
				auto_enable = true,
				lsp = true,
			},
			mappings = {
				l = cmd.increase1,
				L = cmd.increase5,
				K = cmd.increase10,
				m = cmd.set100,
				h = cmd.decrease1,
				H = cmd.decrease5,
				J = cmd.decrease10,
				[","] = cmd.set0,
			},
		})
	end,
	keymaps = {
		{
			modes = { "n", "v" },
			keys = "<C-c>",
			cmd = "<cmd>CccPick<CR>",
			opts = { desc = "Open CCC color picker" },
		},
	},
}

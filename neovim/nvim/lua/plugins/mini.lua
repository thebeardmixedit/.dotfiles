---@type TheBeardLazyloadPluginSpec
return {
	sources = { "https://github.com/nvim-mini/mini.nvim.git" },
	config = function()
		require("mini.ai").setup({ n_lines = 500 })

		require("mini.surround").setup()

		require("mini.pairs").setup()

		require("mini.icons").setup()

		require("mini.files").setup({
			options = {
				use_as_default_explorer = false,
			},
			windows = {
				preview = true,
				width_preview = 75,
			},
			content = {
				filter = function(f)
					if f.name == ".DS_Store" then -- because macOS...
						return false
					end

					return true
				end,
			},
		})
	end,
	keymaps = {
		{
			keys = "<leader>m",
			cmd = function()
				if not MiniFiles.close() then
					MiniFiles.open(vim.api.nvim_buf_get_name(0))
				end
			end,
			opts = { desc = "[m]ini explorer" },
		},
	},
}

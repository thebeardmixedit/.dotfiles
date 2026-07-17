---@type TheBeardLazyloadPluginSpec
return {
	sources = { "https://github.com/folke/todo-comments.nvim.git" },
	on_filetype = { "lua", "javascript", "typescript", "python", "bash", "sh" },
	config = function()
		require("todo-comments").setup({})
	end,
	keymaps = {
		{
			keys = "<leader>st",
			cmd = "<cmd>TodoFzfLua<CR>",
			opts = { desc = "[t]odo" },
		},
	},
}

---@type TheBeardLazyloadPluginSpec
return {
	sources = { "https://github.com/windwp/nvim-ts-autotag.git" },
	deps = { "https://github.com/thebeardmixedit/nvim-treesitter.git" },
	on_filetype = { "html", "jsx", "tsx", "xml", "javascript", "typescript", "markdown" },
	config = function()
		require("nvim-ts-autotag").setup({})
	end,
}

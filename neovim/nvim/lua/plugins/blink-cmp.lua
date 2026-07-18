---@type TheBeardLazyloadPluginSpec
return {
	sources = {
		{ src = "https://github.com/saghen/blink.cmp.git", version = vim.version.range("1.*") },
	},
	deps = {
		"https://github.com/L3MON4D3/LuaSnip.git",
	},
	on_event = "InsertEnter",
	config = function()
		require("blink.cmp").setup({
			keymap = {
				preset = "enter",
			},
			appearance = {
				nerd_font_variant = "mono",
			},
			completion = {
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 500,
				},
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			snippets = {
				preset = "luasnip",
			},
			signature = {
				enabled = false,
			},
		})
	end,
}

pcall(function()
	require("vim._core.ui2").enable({})
end)

require("remap")
require("options")
require("autocmds")
require("usercmds")
require("colorscheme")
require("lsp_onattach")
require("diagnostics")

require("thebeard.statusline")

require("thebeard.lazyload").setup({
	debug = false,
})

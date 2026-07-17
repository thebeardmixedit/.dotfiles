local u = require("utils")

vim.pack.add({ "https://github.com/catppuccin/nvim.git" })

require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	color_overrides = {
		mocha = {
			base = "#000000",
		},
	},
})

vim.cmd.colorscheme("catppuccin-nvim")
vim.cmd("hi EndOfBuffer guibg=bg guifg=bg")

local palette = require("catppuccin.palettes").get_palette("mocha")

u.set_hl({ groups = { Normal = vim.tbl_extend("force", u.get_hl("Normal"), { bg = "none" }) } })
local normal = u.get_hl("Normal")

u.set_hl({
	groups = {
		NormalNC = { bg = normal.bg, fg = u.get_hl("NormalNC").fg },
		NormalFloat = { bg = normal.bg, fg = u.get_hl("NormalFloat").fg },
		FloatBorder = { bg = normal.bg, fg = u.get_hl("FloatBorder").fg },
		FloatTitle = { bg = normal.bg, fg = u.get_hl("FloatTitle").fg },
		SignColumn = { bg = normal.bg, fg = u.get_hl("SignColumn").fg },
		StatusLine = { bg = normal.bg, fg = u.get_hl("StatusLine").fg },
		StatusLineNC = { bg = normal.bg, fg = u.get_hl("StatusLineNC").fg },
		TabLine = { bg = normal.bg, fg = u.get_hl("TabLine").fg },
		TabLineFill = { bg = normal.bg, fg = u.get_hl("TabLineFill").fg },
		TabLineSel = { bg = normal.bg, fg = u.get_hl("TabLineSel").fg },
		ColorColumn = { bg = normal.bg, fg = u.get_hl("ColorColumn").fg },
		WinSeparator = { fg = palette.surface1 },
		VertSplit = { bg = u.get_hl("VertSplit").bg, fg = u.get_hl("FoldColumn").fg },
		["@property"] = { fg = palette.mauve },
		String = { fg = palette.yellow },
		Function = { fg = palette.green },
		Keyword = { fg = palette.blue },
		Type = { fg = palette.blue },
		Typedef = { link = "Type" },
		["@keyword.return"] = { link = "Keyword" },
		zshFunction = { link = "Function" },
	},
})

u.set_hl({
	prefix = "Diagnostic",
	groups = {
		Error = { bg = normal.bg, fg = u.get_hl("DiagnosticError").fg },
		Warn = { bg = normal.bg, fg = u.get_hl("DiagnosticWarn").fg },
		Hint = { bg = normal.bg, fg = u.get_hl("DiagnosticHint").fg },
		Info = { bg = normal.bg, fg = u.get_hl("DiagnosticInfo").fg },
		UnderlineError = { cterm = { strikethrough = true }, sp = palette.red, strikethrough = true },
		UnderlineWarning = { cterm = { strikethrough = true }, sp = palette.yellow, strikethrough = true },
	},
})

u.set_hl({
	prefix = "Noice",
	groups = {
		CmdlinePopupBorder = { bg = normal.bg, fg = palette.sapphire },
		CmdlineIcon = { bg = normal.bg, fg = palette.sapphire },
		CmdlinePopupBorderLua = { bg = normal.bg, fg = palette.mauve },
		CmdlineIconLua = { bg = normal.bg, fg = palette.mauve },
		CmdlinePopupBorderHelp = { bg = normal.bg, fg = palette.peach },
		CmdlineIconHelp = { bg = normal.bg, fg = palette.peach },
	},
})

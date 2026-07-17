local u = require("utils")
local state = require("thebeard.statusline.state")

local separator = require("thebeard.statusline.modules.separator")
local spacer = require("thebeard.statusline.modules.spacer")
local mode = require("thebeard.statusline.modules.mode")
local filepath = require("thebeard.statusline.modules.filepath")
local filetype = require("thebeard.statusline.modules.filetype")
local filesize = require("thebeard.statusline.modules.filesize")
local cursor = require("thebeard.statusline.modules.cursor")
local gitbranch = require("thebeard.statusline.modules.gitbranch")
local gitstatus = require("thebeard.statusline.modules.gitstatus")
local lspinfo = require("thebeard.statusline.modules.lspinfo")
local diagnostics = require("thebeard.statusline.modules.diagnostics")

local palette = require("catppuccin.palettes").get_palette("mocha")
local statuslinebase = u.get_hl("StatusLine")

state.refresh_git_branch_modified()

u.set_hl({
	prefix = "StatusLine",
	groups = {
		Netrw = { bg = statuslinebase.bg, fg = statuslinebase.fg, italic = true },
		ModeNormal = { bg = statuslinebase.bg, fg = palette.blue, bold = true },
		ModePending = { bg = statuslinebase.bg, fg = palette.overlay2, bold = true },
		ModeVisual = { bg = statuslinebase.bg, fg = palette.mauve, bold = true },
		ModeInsert = { bg = statuslinebase.bg, fg = palette.green, bold = true },
		ModeCommand = { bg = statuslinebase.bg, fg = palette.peach, bold = true },
		ModeReplace = { bg = statuslinebase.bg, fg = palette.yellow, bold = true },
		BufferModified = { bg = statuslinebase.bg, fg = palette.rosewater, italic = true },
		BufferReadOnly = { bg = statuslinebase.bg, fg = palette.maroon, italic = true },
		DiagnosticError = { link = "DiagnosticError" },
		DiagnosticWarning = { link = "DiagnosticWarn" },
		DiagnosticHint = { link = "DiagnosticHint" },
		DiagnosticInfo = { link = "DiagnosticInfo" },
		GitBranchUpToDate = { bg = statuslinebase.bg, fg = palette.green },
		GitBranchModified = { bg = statuslinebase.bg, fg = palette.yellow, italic = true },
		GitStatusAdded = { link = "GitSignsAdd" },
		GitStatusChanged = { link = "GitSignsChange" },
		GitStatusRemoved = { link = "GitSignsDelete" },
	},
})

u.keymap({
	keys = "<A-p>",
	cmd = function()
		filepath.toggle_path()
	end,
	opts = { desc = "Toggle full file path in the statusline" },
})

StatuslineAi = {}

function StatuslineAi.render()
	local statusline_winid = vim.g.statusline_winid
	local bufnr = vim.fn.winbufnr(statusline_winid)
	local ft = vim.bo[bufnr].filetype

	if ft == "fzf" or ft == "harpoon" then
		return ""
	end

	local statusline = {}

	table.insert(statusline, mode.render())
	table.insert(statusline, spacer.render())
	table.insert(statusline, gitbranch.render({ bufnr = bufnr }))
	table.insert(statusline, spacer.render(2))
	table.insert(statusline, gitstatus.render({ bufnr = bufnr }))

	table.insert(statusline, separator.render())

	table.insert(statusline, filetype.render({ bufnr = bufnr }))
	table.insert(statusline, filepath.render({ bufnr = bufnr }))
	table.insert(statusline, spacer.render())
	table.insert(statusline, filesize.render({ bufnr = bufnr }))

	table.insert(statusline, separator.render())

	table.insert(statusline, diagnostics.render({ bufnr = bufnr }))
	table.insert(statusline, spacer.render(2))
	table.insert(statusline, lspinfo.render({ bufnr = bufnr }))
	table.insert(statusline, spacer.render(2))
	table.insert(statusline, cursor.render({ win = statusline_winid, bufnr = bufnr }))

	return table.concat(statusline)
end

vim.o.statusline = "%!v:lua.StatuslineAi.render()"

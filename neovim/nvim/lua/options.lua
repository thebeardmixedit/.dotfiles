local opt = vim.opt
local g = vim.g

local undodirectory = vim.fn.stdpath("state") .. "/undo"
vim.fn.mkdir(undodirectory, "p")

-- Globals
g.have_nerd_font = true -- enable nerd font support

-- Netrw
g.netrw_list_hide = "^\\.DS_Store$" -- hide .DS_Store files in netrw
g.netrw_banner = 0 -- hide top help banner in netrw
-- g.netrw_liststyle = 3 -- use tree view in netrw
-- g.netrw_winsize = 25 -- set netrw window size
-- g.netrw_browse_split = 4 -- open files in previous window

-- UI
opt.termguicolors = true -- enable terminal GUI colors
opt.laststatus = 3 -- use one global statusline at the bottom
opt.cmdheight = 1 -- keep command line height to one line
opt.number = true -- show absolute line number on current line
opt.relativenumber = true -- show relative line numbers
opt.cursorline = true -- highlight the current cursor line
opt.scrolloff = 10 -- keep 10 lines above/below cursor
opt.sidescrolloff = 10 -- keep 10 columns left/right of cursor
opt.signcolumn = "yes" -- always show the sign column
opt.showmatch = true -- briefly jump/highlight matching bracket
opt.showmode = false -- hide mode text because statusline shows it
opt.wrap = false -- do not visually wrap long lines
opt.fillchars:append({ eob = " " }) -- hide ~ on empty buffer lines

-- Completion
opt.completeopt = { "menuone", "noinsert", "noselect", "popup" } -- configure completion menu behavior

-- Indentation
opt.tabstop = 4 -- number of spaces a tab displays as
opt.softtabstop = 4 -- number of spaces inserted/deleted with tab/backspace
opt.shiftwidth = 4 -- number of spaces used for autoindent
opt.expandtab = true -- use spaces instead of tab characters
opt.autoindent = true -- copy indent from current line
opt.smartindent = true -- add basic smart indentation
opt.backspace = { "indent", "eol", "start" } -- allow backspace through indent, EOL, and insert start

-- Files
opt.swapfile = false -- do not create swap files
opt.backup = false -- do not create backup files
opt.writebackup = false -- do not create temporary backup before writing
opt.undodir = undodirectory -- set persistent undo directory
opt.undofile = true -- enable persistent undo
opt.autowrite = false -- do not automatically save before certain commands

-- Search
opt.incsearch = true -- show search matches while typing
opt.ignorecase = true -- ignore case in search patterns
opt.smartcase = true -- make search case-sensitive if uppercase is used

-- Splits
opt.splitright = true -- open vertical splits to the right
opt.splitbelow = true -- open horizontal splits below

-- Sessions
opt.sessionoptions = {
	"blank", -- save empty windows
	"buffers", -- save listed buffers
	"curdir", -- save current directory
	"folds", -- save folds
	"help", -- save help windows
	"tabpages", -- save tab pages
	"winsize", -- save window sizes
	"winpos", -- save window position
	"terminal", -- save terminal windows
	"localoptions", -- save local window/buffer options
}

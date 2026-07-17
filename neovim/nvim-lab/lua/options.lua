local undodirectory = vim.fn.stdpath("state") .. "/undo"

vim.fn.mkdir(undodirectory, "p")

vim.g.mapleader = " "
vim.g.have_nerd_font = true

vim.o.termguicolors = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.signcolumn = "yes"

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.wrap = false

vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.undodir = undodirectory
vim.o.undofile = true

vim.opt.backspace = { "indent", "eol", "start" }

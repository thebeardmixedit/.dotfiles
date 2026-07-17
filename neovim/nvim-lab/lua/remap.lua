vim.g.mapleader = " "

vim.keymap.set("n", "<A-r>", "<cmd>e<CR>", { desc = "Reload the current buffer" })
vim.keymap.set("n", "<A-s>", "<cmd>w<CR>", { desc = "Write current buffer" })
vim.keymap.set("n", "<C-A-s>", "<cmd>wa<CR>", { desc = "Write all buffers" })
vim.keymap.set("n", "<A-q>", "<cmd>q<CR>", { desc = "Quit Neovim" })

vim.keymap.set("n", "<leader>e", "<cmd>Explore<CR>", { desc = "[e]xplorer [netrw]" })
vim.keymap.set("n", "<leader>dq", "<cmd>copen<CR>", { desc = "[q]uickfix list" })
vim.keymap.set("n", "<leader>dL", "<cmd>lopen<CR>", { desc = "[L]oc list" })

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "[y]ank to system clipboard" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Window left" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Window right" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Window down" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Window up" })

vim.keymap.set("v", "J", "<cmd>m '>+1<CR>gv=gv", { desc = "Move selected lines down one line" })
vim.keymap.set("v", "K", "<cmd>m '<-2<CR>gv=gv", { desc = "Move selected lines up one line" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move half page down centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move half page up centered" })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "<A-i>", "<cmd>Inspect<CR>", { desc = "Inspect element under cursor" })

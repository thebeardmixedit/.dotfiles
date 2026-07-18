local u = require("utils")

local function restart_nvim()
	vim.ui.select({ "Yes", "No" }, {
		prompt = "Restart Neovim?",
	}, function(choice)
		if choice == "Yes" then
			vim.cmd("restart")
		end
	end)
end

local function save_as()
	vim.ui.input({
		prompt = "Save as...",
		default = vim.fn.expand("%:p"),
	}, function(input)
		if input ~= nil and input ~= "" then
			vim.cmd("saveas " .. vim.fn.fnameescape(input))
		end
	end)
end

local function new_file()
	vim.ui.input({
		prompt = "New file",
		default = vim.fn.expand("%:h") .. "/",
	}, function(input)
		if input ~= nil and input ~= "" then
			vim.cmd("edit " .. vim.fn.fnameescape(input))
		end
	end)
end

local function make_executable()
	local file = vim.fn.expand("%:p")

	if file == "" then
		return
	end

	vim.cmd("silent !chmod +x " .. vim.fn.shellescape(file))
	vim.cmd("redraw!")
end

-- Files
u.keymap({ keys = "<A-r>", cmd = "<cmd>confirm edit<CR>", opts = { desc = "Reload the current buffer" } })
u.keymap({ keys = "<A-s>", cmd = "<cmd>write<CR>", opts = { desc = "Write (save) the current buffer" } })
u.keymap({ keys = "<C-A-s>", cmd = "<cmd>wall<CR>", opts = { desc = "Write (save) all open buffers" } })
u.keymap({ keys = "<A-S-s>", cmd = save_as, opts = { desc = "Save file copy as" } })
u.keymap({ keys = "<A-n>", cmd = new_file, opts = { desc = "New file" } })
u.keymap({ keys = "<A-S-w>", cmd = "<cmd>confirm bdelete<CR>", opts = { desc = "Close the current buffer" } })

-- Neovim
u.keymap({ keys = "<A-Esc>", cmd = restart_nvim, opts = { desc = "Restart Neovim" } })
u.keymap({ keys = "<A-q>", cmd = "<cmd>confirm qall<CR>", opts = { desc = "Quit Neovim" } })
u.keymap({ keys = "<A-S-q>", cmd = "<cmd>qall!<CR>", opts = { desc = "Force quit Neovim" } })
u.keymap({ keys = "<A-i>", cmd = "<cmd>Inspect<CR>", opts = { desc = "Inspect element under the cursor" } })

-- Selection and clipboard
u.keymap({ keys = "<A-a>", cmd = "gg0vG$", opts = { desc = "Select all" } })
u.keymap({ modes = { "n", "v" }, keys = "<leader>y", cmd = '"+y', opts = { desc = "[y]ank to system clipboard" } })

-- Explorer and lists
u.keymap({ keys = "<leader>e", cmd = "<cmd>Explore<CR>", opts = { desc = "[e]xplorer [netrw]" } })
u.keymap({ keys = "<leader>dq", cmd = "<cmd>copen<CR>", opts = { desc = "[q]uickfix list" } })
u.keymap({ keys = "<leader>dL", cmd = "<cmd>lopen<CR>", opts = { desc = "[L]ocation list" } })

-- Windows and splits
u.keymap({ keys = "<C-w><C-h>", cmd = "<cmd>split<CR>", opts = { desc = "Horizontal split" } })
u.keymap({ keys = "<C-w><C-v>", cmd = "<cmd>vsplit<CR>", opts = { desc = "Vertical split" } })
u.keymap({ keys = "<C-w><C-e>", cmd = "<C-w>=", opts = { desc = "Equalize splits" } })
u.keymap({ keys = "<C-w><C-w>", cmd = "<cmd>close<CR>", opts = { desc = "Close window" } })

-- Window resizing
u.keymap({ keys = "<C-Up>", cmd = "<cmd>resize +2<CR>", opts = { desc = "Increase height" } })
u.keymap({ keys = "<C-Down>", cmd = "<cmd>resize -2<CR>", opts = { desc = "Decrease height" } })
u.keymap({ keys = "<C-Right>", cmd = "<cmd>vertical resize +2<CR>", opts = { desc = "Increase width" } })
u.keymap({ keys = "<C-Left>", cmd = "<cmd>vertical resize -2<CR>", opts = { desc = "Decrease width" } })

u.keymap({ keys = "<C-S-Up>", cmd = "<cmd>resize +5<CR>", opts = { desc = "Increase height faster" } })
u.keymap({ keys = "<C-S-Down>", cmd = "<cmd>resize -5<CR>", opts = { desc = "Decrease height faster" } })
u.keymap({ keys = "<C-S-Right>", cmd = "<cmd>vertical resize +5<CR>", opts = { desc = "Increase width faster" } })
u.keymap({ keys = "<C-S-Left>", cmd = "<cmd>vertical resize -5<CR>", opts = { desc = "Decrease width faster" } })

-- Window navigation
u.keymap({ keys = "<C-h>", cmd = "<C-w><C-h>", opts = { desc = "Window left" } })
u.keymap({ keys = "<C-l>", cmd = "<C-w><C-l>", opts = { desc = "Window right" } })
u.keymap({ keys = "<C-j>", cmd = "<C-w><C-j>", opts = { desc = "Window down" } })
u.keymap({ keys = "<C-k>", cmd = "<C-w><C-k>", opts = { desc = "Window up" } })

-- Visual mode line movement
u.keymap({ modes = "v", keys = "J", cmd = ":m '>+1<CR>gv=gv", opts = { desc = "Move selected lines down one line" } })
u.keymap({ modes = "v", keys = "K", cmd = ":m '<-2<CR>gv=gv", opts = { desc = "Move selected lines up one line" } })

-- Disabled defaults
u.keymap({ modes = { "n", "v", "i" }, keys = "<C-z>", cmd = "<Nop>", opts = { desc = "Disable suspend" } })

-- Insert mode editing
u.keymap({ modes = "i", keys = "<A-bs>", cmd = "<C-w>", opts = { desc = "Delete previous word" } })
u.keymap({ modes = "i", keys = "<D-bs>", cmd = "<C-u>", opts = { desc = "Delete to beginning of line" } })

-- Line insertion
u.keymap({ keys = "<leader>ia", cmd = "m`O<Esc>``", opts = { desc = "Insert line [a]bove" } })
u.keymap({ keys = "<leader>ib", cmd = "m`o<Esc>``", opts = { desc = "Insert line [b]elow" } })

-- Movement
u.keymap({ keys = "<C-d>", cmd = "<C-d>zz", opts = { desc = "Move a half page down and center cursor" } })
u.keymap({ keys = "<C-u>", cmd = "<C-u>zz", opts = { desc = "Move a half page up and center cursor" } })

-- Search
u.keymap({ keys = "<Esc>", cmd = "<cmd>nohlsearch<CR>", opts = { desc = "Clear search highlights" } })

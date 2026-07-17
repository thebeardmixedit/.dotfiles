local u = require("utils")

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("thebeard-lsp-attach", { clear = true }),
	callback = function(event)
		local bufnr = event.buf

		u.keymap({
			keys = "<leader>lR",
			cmd = vim.lsp.buf.rename,
			opts = { buffer = bufnr, desc = "[R]ename all references" },
		})

		u.keymap({
			keys = "<leader>df",
			cmd = function()
				vim.diagnostic.open_float({ scope = "cursor" })
			end,
			opts = { buffer = bufnr, desc = "[f]loating under cursor" },
		})

		u.keymap({
			keys = "<leader>dF",
			cmd = function()
				vim.diagnostic.open_float({ scope = "line" })
			end,
			opts = { buffer = bufnr, desc = "[F]loating line" },
		})

		u.keymap({
			keys = "<leader>dp",
			cmd = function()
				vim.diagnostic.jump({ count = -1 })
			end,
			opts = { buffer = bufnr, desc = "[p]revious" },
		})

		u.keymap({
			keys = "<leader>dn",
			cmd = function()
				vim.diagnostic.jump({ count = 1 })
			end,
			opts = { buffer = bufnr, desc = "[n]ext" },
		})

		u.keymap({ keys = "<C-A-h>", cmd = vim.lsp.buf.hover, opts = { buffer = bufnr, desc = "Open hover" } })
	end,
})

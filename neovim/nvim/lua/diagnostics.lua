local u = require("utils")

local diagnostic_signs = {
	Error = " ",
	Warn = " ",
	Hint = " ",
	Info = " ",
}

vim.diagnostic.config({
	virtual_text = { prefix = "", spacing = 4 },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = diagnostic_signs.Error,
			[vim.diagnostic.severity.WARN] = diagnostic_signs.Warn,
			[vim.diagnostic.severity.INFO] = diagnostic_signs.Info,
			[vim.diagnostic.severity.HINT] = diagnostic_signs.Hint,
		},
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "if_many",
		header = "",
		prefix = "",
		focusable = false,
		style = "minimal",
	},
})

do
	local orig = vim.lsp.util.open_floating_preview

	---@diagnostic disable-next-line: duplicate-set-field
	function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
		opts = opts or {}
		opts.border = opts.border or "rounded"
		return orig(contents, syntax, opts, ...)
	end
end

u.keymap({
	keys = "<leader>dt",
	cmd = function()
		vim.diagnostic.enable(not vim.diagnostic.is_enabled())
	end,
	opts = { desc = "[t]oggle inline" },
})

u.keymap({
	keys = "<leader>dl",
	cmd = function()
		vim.diagnostic.setloclist({ open = true })
	end,
	opts = { desc = "[l]ist" },
})

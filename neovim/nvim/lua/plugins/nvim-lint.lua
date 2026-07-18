local u = require("utils")

---@type TheBeardLazyloadPluginSpec
return {
	sources = { "https://github.com/mfussenegger/nvim-lint.git" },
	on_filetype = u.filetypes.lint,
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },

			python = { "pylint" },

			bash = { "shellcheck" },
			sh = { "shellcheck" },
		}

		vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
			group = vim.api.nvim_create_augroup("thebeard-lint", { clear = true }),
			callback = function(event)
				local ft = vim.bo[event.buf].filetype

				if not lint.linters_by_ft[ft] then
					return
				end

				vim.api.nvim_buf_call(event.buf, function()
					lint.try_lint()
				end)
			end,
		})
	end,
	keymaps = {
		{
			keys = "<leader>ll",
			cmd = function()
				require("lint").try_lint()
			end,
			opts = { desc = "[l]int the current buffer" },
		},
	},
}

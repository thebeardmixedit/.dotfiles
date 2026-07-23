local u = require("utils")

---@type TheBeardLazyloadPluginSpec
return {
	sources = { "https://github.com/stevearc/conform.nvim.git" },
	on_cmd = { "ConformInfo" },
	on_filetype = u.filetypes.format,
	config = function()
		local conform = require("conform")

		local formatters_by_ft = {
			lua = { "stylua" },

			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },

			html = { "prettier" },
			css = { "prettier" },
			scss = { "prettier" },
			json = { "prettier" },
			markdown = { "prettier" },

			bash = { "shfmt" },
			sh = { "shfmt" },
			zsh = { "shfmt" },

			python = { "black" },
		}

		conform.setup({
			notify_on_error = false,
			notify_no_formatters = false,

			default_format_opts = {
				lsp_format = "fallback",
			},

			format_on_save = function(bufnr)
				local ft = vim.bo[bufnr].filetype

				if formatters_by_ft[ft] then
					return {
						timeout_ms = 500,
					}
				end

				return nil
			end,

			formatters_by_ft = formatters_by_ft,
		})
	end,
	keymaps = {
		{
			modes = { "n", "v" },
			keys = "<S-A-f>",
			cmd = function()
				require("conform").format({ async = true })
			end,
			opts = { desc = "[F]ormat buffer" },
		},
	},
}

local parsers = {
	"lua",
	"vim",
	"bash",
	"gitignore",
	"javascript",
	"typescript",
	"tsx",
	"css",
	"json",
	"html",
	"markdown",
	"python",
	"yaml",
	"c",
}

local filetypes = {
	"lua",
	"vim",
	"bash",
	"sh",
	"zsh",
	"gitignore",
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact",
	"css",
	"json",
	"html",
	"markdown",
	"python",
	"yaml",
	"c",
}

---@type TheBeardLazyloadPluginSpec
return {
	sources = {
		"https://github.com/thebeardmixedit/nvim-treesitter.git",
	},
	config = function()
		local treesitter = require("nvim-treesitter")

		local function start_treesitter(bufnr)
			bufnr = bufnr or vim.api.nvim_get_current_buf()

			pcall(vim.treesitter.start, bufnr)

			vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
			vim.wo.foldmethod = "expr"
			vim.wo.foldlevel = 99

			vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end

		treesitter.setup({})

		vim.api.nvim_create_user_command("TSInstallConfigured", function()
			treesitter.install(parsers)
		end, {
			desc = "Install configured Treesitter parsers",
		})

		vim.api.nvim_create_user_command("TSUpdateConfigured", function()
			treesitter.update(parsers)
		end, {
			desc = "Update configured Treesitter parsers",
		})

		vim.treesitter.language.register("bash", { "zsh", "sh" })

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("thebeard-treesitter", { clear = true }),
			pattern = filetypes,
			callback = function(event)
				start_treesitter(event.buf)
			end,
		})
	end,
}

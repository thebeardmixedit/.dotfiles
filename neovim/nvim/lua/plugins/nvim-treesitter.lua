local languages = {
	"lua",
	"vim",
	"bash",
	"gitignore",
	"javascript",
	"typescript",
	"css",
	"go",
	"json",
	"html",
	"markdown",
	"python",
	"sql",
	"yaml",
	"c",
}

---@type TheBeardLazyloadPluginSpec
return {
	sources = {
		"https://github.com/thebeardmixedit/nvim-treesitter.git",
		"https://github.com/thebeardmixedit/nvim-treesitter-textobjects.git",
	},
	on_cmd = {
		"TSInstallConfigured",
		"TSUpdateConfigured",
	},
	on_filetype = languages,
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
			treesitter.install(languages)
		end, {
			desc = "Install configured Treesitter parsers",
		})

		vim.api.nvim_create_user_command("TSUpdateConfigured", function()
			treesitter.update(languages)
		end, {
			desc = "Update configured Treesitter parsers",
		})

		vim.treesitter.language.register("bash", { "zsh", "sh" })

		require("nvim-treesitter-textobjects").setup({})

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("thebeard-treesitter", { clear = true }),
			pattern = languages,
			callback = function(event)
				start_treesitter(event.buf)
			end,
		})

		start_treesitter()
	end,
}

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
	"yaml",
	"toml",
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
	"yaml",
	"toml",
	"c",
}

---@type TheBeardLazyloadPluginSpec
return {
	sources = {
		"https://github.com/thebeardmixedit/nvim-treesitter.git",
	},
	config = function()
		local treesitter = require("nvim-treesitter")

		local function configure_buffer(bufnr)
			local started = pcall(vim.treesitter.start, bufnr)

			if not started then
				return
			end

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

		vim.treesitter.language.register("bash", { "sh", "zsh" })

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("thebeard-treesitter", { clear = true }),
			pattern = filetypes,
			callback = function(event)
				configure_buffer(event.buf)
			end,
		})
	end,
}

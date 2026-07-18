local u = require("utils")

---@type TheBeardLazyloadPluginSpec
return {
	sources = {
		"https://github.com/neovim/nvim-lspconfig.git",
		"https://github.com/mason-org/mason.nvim.git",
		"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim.git",
	},
	on_cmd = { "Mason" },
	on_filetype = u.filetypes.lsp,
	config = function()
		local ensure_installed = {
			-- LSP servers
			"lua-language-server",
			"bash-language-server",
			"typescript-language-server",
			"html-lsp",
			"css-lsp",
			"tailwindcss-language-server",
			"pyright",
			"json-lsp",
			"emmet-ls",

			-- Formatters and linters
			"stylua",
			"shellcheck",
			"shfmt",
			"prettier",
			"eslint_d",
			"black",
		}

		---@type table<string, vim.lsp.Config>
		local servers = {
			lua_ls = {
				on_init = function(client)
					client.server_capabilities.documentFormattingProvider = false -- Disable formatting (formatting is done by stylua)

					if client.workspace_folders then
						local path = client.workspace_folders[1].name

						if
							path ~= vim.fn.stdpath("config")
							and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
						then
							return
						end
					end

					local function realpath(path)
						return path and vim.uv.fs_realpath(path) or path
					end

					local function same_or_child(path, root)
						if not path or not root then
							return false
						end

						return path == root or vim.startswith(path, root .. "/")
					end

					local function lua_library()
						local workspace = client.workspace_folders
							and client.workspace_folders[1]
							and client.workspace_folders[1].name
						local workspace_realpath = realpath(workspace)
						local config_realpath = realpath(vim.fn.stdpath("config"))

						local library = vim.tbl_filter(function(path)
							local path_realpath = realpath(path)

							return not same_or_child(path_realpath, workspace_realpath)
								and not same_or_child(path_realpath, config_realpath)
						end, vim.api.nvim_get_runtime_file("", true))

						vim.list_extend(library, {
							"${3rd}/luv/library",
							"${3rd}/busted/library",
						})

						return library
					end

					---@diagnostic disable-next-line
					client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
						runtime = {
							version = "LuaJIT",
							path = { "lua/?.lua", "lua/?/init.lua" },
						},
						workspace = {
							checkThirdParty = false,
							library = lua_library(),
						},
					})
				end,
				---@type lspconfig.settings.lua_ls
				settings = {
					Lua = {
						format = { enable = false },
						diagnostics = {
							disable = { "unused-function" },
						},
					},
				},
			},
			bashls = {
				filetypes = { "sh", "zsh", "bash" },
			},
			ts_ls = {},
			html = {},
			cssls = {},
			pyright = {},
			jsonls = {},
			tailwindcss = {
				filetypes = {
					"html",
					"javascriptreact",
					"typescriptreact",
				},
			},
			emmet_ls = {
				filetypes = {
					"html",
					"css",
					"scss",
					"javascriptreact",
					"typescriptreact",
				},
			},
		}

		require("mason").setup({})

		require("mason-tool-installer").setup({
			ensure_installed = ensure_installed,
		})

		for name, server in pairs(servers) do
			vim.lsp.config(name, server)
			vim.lsp.enable(name)
		end
	end,
	load_keymaps_eagerly = true,
	keymaps = {
		{ keys = "<leader>lm", cmd = "<cmd>Mason<CR>", opts = { desc = "[m]ason" } },
	},
}

local u = require("utils")

---@type TheBeardLazyloadPluginSpec
return {
	sources = {
		"https://github.com/neovim/nvim-lspconfig.git",
	},
	on_filetype = u.filetypes.lsp,
	config = function()
		---@type table<string, vim.lsp.Config>
		local servers = {
			lua_ls = {
				on_init = function(client)
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

		for name, server in pairs(servers) do
			vim.lsp.config(name, server)
			vim.lsp.enable(name)
		end
	end,
}

---@type TheBeardLazyloadPluginSpec
return {
	sources = { "https://github.com/ibhagwan/fzf-lua.git" },
	on_cmd = { "FzfLua" },
	deps = { "https://github.com/nvim-mini/mini.nvim.git" },
	config = function()
		local u = require("utils")

		local actions = require("fzf-lua").actions

		require("fzf-lua").setup({
			winopts = {
				backdrop = 100,
				title_flags = false,
				---@diagnostic disable-next-line: missing-fields
				preview = {
					scrollbar = false,
				},
				on_create = function()
					u.keymap({ modes = "t", keys = "<C-Esc>", cmd = "<C-\\><C-n>", opts = { desc = "Normal mode" } })
				end,
				on_close = function()
					vim.keymap.del("t", "<C-Esc>")
				end,
			},
			actions = {
				files = {
					["enter"] = actions.file_edit,
					["ctrl-h"] = actions.file_split,
					["ctrl-v"] = actions.file_vsplit,
					["ctrl-q"] = { fn = actions.file_sel_to_qf, prefix = "select-all" },
				},
			},
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("fzf-lsp-attach", { clear = true }),
			callback = function(event)
				local client = vim.lsp.get_client_by_id(event.data.client_id)

				if not client then
					return
				end

				local bufnr = event.buf

				u.keymap({
					keys = "<leader>ld",
					cmd = FzfLua.lsp_definitions,
					opts = { buffer = bufnr, desc = "go to [d]efinition" },
				})

				u.keymap({
					keys = "<leader>lD",
					cmd = function()
						vim.cmd("split")
						FzfLua.lsp_definitions()
					end,
					opts = { buffer = bufnr, desc = "go to [D]efinition in a split" },
				})

				u.keymap({
					keys = "<leader>lr",
					cmd = FzfLua.lsp_references,
					opts = { buffer = bufnr, desc = "go to [r]eferences" },
				})

				u.keymap({
					keys = "<leader>lt",
					cmd = FzfLua.lsp_typedefs,
					opts = { buffer = bufnr, desc = "go to [t]ype definition" },
				})

				u.keymap({
					keys = "<leader>li",
					cmd = FzfLua.lsp_implementations,
					opts = { buffer = bufnr, desc = "go to [i]mplementation" },
				})

				u.keymap({
					keys = "<leader>ls",
					cmd = FzfLua.lsp_document_symbols,
					opts = { buffer = bufnr, desc = "[s]ymbols (document)" },
				})

				u.keymap({
					keys = "<leader>lw",
					cmd = FzfLua.lsp_workspace_symbols,
					opts = { buffer = bufnr, desc = "[s]ymbols (workspace)" },
				})

				if client:supports_method("textDocument/codeAction", bufnr) then
					u.keymap({
						keys = "<C-o>",
						cmd = function()
							vim.lsp.buf.code_action({
								context = { only = { "source.organizeImports" }, diagnostics = {} },
								apply = true,
								bufnr = bufnr,
							})

							vim.defer_fn(function()
								vim.lsp.buf.format({ bufnr = bufnr })
							end, 50)
						end,
						opts = { buffer = bufnr, desc = "[o]rganize imports" },
					})
				end
			end,
		})
	end,
	keymaps = {
		{
			keys = "<leader>/",
			cmd = function()
				FzfLua.blines({
					["winopts.preview.hidden"] = true,
					["winopts.title"] = " Grep buffer ",
					["winopts.height"] = 0.80,
					["winopts.width"] = 0.70,
				})
			end,
			opts = { desc = "[/]grep buffer" },
		},
		{
			keys = "<leader><leader>",
			cmd = function()
				FzfLua.files({
					["winopts.title"] = " Files (root dir) ",
				})
			end,
			opts = { desc = "[␣]find files (root dir)" },
		},
		{
			keys = "<leader>ff",
			cmd = function()
				FzfLua.files({
					["winopts.title"] = " Files (root dir) ",
				})
			end,
			opts = { desc = "[f]iles (root dir)" },
		},
		{
			keys = "<leader>fF",
			cmd = function()
				local parent_dir = vim.fn.expand("%:p:h")
				FzfLua.files({
					["winopts.title"] = " Files (current dir) ",
					cwd = parent_dir,
				})
			end,
			opts = { desc = "[F]iles (current dir)" },
		},
		{
			keys = "<leader>fr",
			cmd = function()
				FzfLua.oldfiles({
					["winopts.title"] = " Recent files (root dir) ",
				})
			end,
			opts = { desc = "[r]ecent files (root dir)" },
		},
		{
			keys = "<leader>fR",
			cmd = function()
				local parent_dir = vim.fn.expand("%:p:h")
				FzfLua.oldfiles({
					["winopts.title"] = " Recent files (current dir) ",
					cwd = parent_dir,
				})
			end,
			opts = { desc = "[R]ecent files (current dir)" },
		},
		-- {
		-- 	keys = "<C-p>",
		-- 	cmd = function()
		-- 		FzfLua.fzf_exec(
		-- 			"find $HOME/Code -maxdepth 2 -type d -not -path $HOME/Code -not -path $HOME/Code/neovim -not -path $HOME/Code/personal -not -path '*/noe_modules/*' -not -path '*/.git/*'",
		-- 			{
		-- 				prompt = ">",
		-- 				["winopts.title"] = " Projects ",
		-- 				["winopts.height"] = 0.80,
		-- 				["winopts.width"] = 0.40,
		-- 				actions = {
		-- 					["default"] = function(selected)
		-- 						vim.cmd("cd " .. selected[1])
		-- 						vim.cmd("Ex")
		-- 					end,
		-- 				},
		-- 			}
		-- 		)
		-- 	end,
		-- 	opts = { desc = "[p]rojects" },
		-- },
		{
			keys = "<leader>fb",
			cmd = function()
				FzfLua.buffers()
			end,
			opts = { desc = "[b]uffers" },
		},
		{
			keys = "<leader>fg",
			cmd = function()
				FzfLua.git_files({ ["winopts.title"] = "Git files" })
			end,
			opts = { desc = "[g]it files" },
		},
		{
			keys = "<leader>fc",
			cmd = function()
				FzfLua.files({
					["winopts.title"] = " Recent files (root dir) ",
					cwd = "~/.dotfiles/neovim/nvim",
				})
			end,
			opts = { desc = "[c]onfig files (nvim)" },
		},
		{
			keys = "<leader>sa",
			cmd = function()
				FzfLua.autocmds()
			end,
			opts = { desc = "[a]uto-commands" },
		},
		{
			keys = "<leader>sb",
			cmd = function()
				FzfLua.live_grep_native()
			end,
			opts = { desc = "[b]uffers (grep)" },
		},
		{
			keys = "<leader>sc",
			cmd = function()
				FzfLua.command_history()
			end,
			opts = { desc = "[c]ommand history" },
		},
		{
			keys = "<leader>sC",
			cmd = function()
				FzfLua.commands()
			end,
			opts = { desc = "[c]ommands" },
		},
		{
			keys = "<leader>sd",
			cmd = function()
				FzfLua.diagnostics_document()
			end,
			opts = { desc = "[d]iagnostics document" },
		},
		{
			keys = "<leader>sD",
			cmd = function()
				FzfLua.diagnostics_workspace()
			end,
			opts = { desc = "[D]iagnostics workspace" },
		},
		{
			keys = "<leader>sF",
			cmd = function()
				FzfLua.builtin()
			end,
			opts = { desc = "[F]zf-lua builtin pickers" },
		},
		{
			keys = "<leader>sg",
			cmd = function()
				FzfLua.live_grep()
			end,
			opts = { desc = "[g]rep" },
		},
		{
			keys = "<leader>sh",
			cmd = function()
				FzfLua.help_tags()
			end,
			opts = { desc = "[h]elp tags" },
		},
		{
			keys = "<leader>sH",
			cmd = function()
				FzfLua.highlights()
			end,
			opts = { desc = "[H]ighlights" },
		},
		{
			keys = "<leader>sk",
			cmd = function()
				FzfLua.keymaps()
			end,
			opts = { desc = "[k]eymaps" },
		},
		{
			keys = "<leader>sl",
			cmd = function()
				FzfLua.loclist()
			end,
			opts = { desc = "[l]ocation list" },
		},
		{
			keys = "<leader>sL",
			cmd = function()
				FzfLua.grep_loclist()
			end,
			opts = { desc = "[L]ocation list (grep)" },
		},
		{
			keys = "<leader>sm",
			cmd = function()
				FzfLua.marks()
			end,
			opts = { desc = "[m]arks" },
		},
		{
			keys = "<leader>sM",
			cmd = function()
				FzfLua.man_pages()
			end,
			opts = { desc = "[M]an pages" },
		},
		{
			keys = "<leader>sp",
			cmd = function()
				FzfLua.files({
					["winopts.title"] = " Plugins ",
					cwd = "~/.dotfiles/neovim/nvim/lua/plugins",
				})
			end,
			opts = { desc = "[p]lugins (neovim)" },
		},
		{
			keys = "<leader>sq",
			cmd = function()
				FzfLua.quickfix()
			end,
			opts = { desc = "[q]uickfix list" },
		},
		{
			keys = "<leader>sr",
			cmd = function()
				FzfLua.resume()
			end,
			opts = { desc = "[r]esume" },
		},
		{
			keys = "<leader>su",
			cmd = function()
				FzfLua.undotree()
			end,
			opts = { desc = "[u]ndo tree" },
		},
		{
			keys = "<leader>s/",
			cmd = function()
				FzfLua.search_history()
			end,
			opts = { desc = "[s]earch history" },
		},
		{
			keys = "<leader>gb",
			cmd = function()
				FzfLua.git_branches()
			end,
			opts = { desc = "[b]ranches" },
		},
		{
			keys = "<leader>gc",
			cmd = function()
				FzfLua.git_commits()
			end,
			opts = { desc = "[c]ommits" },
		},
		{
			keys = "<leader>gd",
			cmd = function()
				FzfLua.git_diff()
			end,
			opts = { desc = "[d]iffs" },
		},
		{
			keys = "<leader>lf",
			cmd = function()
				FzfLua.lsp_finder()
			end,
			opts = { desc = "[f]inder" },
		},
	},
}

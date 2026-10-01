# Neovim Architecture

## Purpose

The production configuration lives in `neovim/nvim`. `neovim/nvim-lab` is a separate environment for local plugin development.

## Startup

`init.lua` loads options, mappings, autocmds, user commands, colors, LSP attachment mappings, diagnostics, and the statusline before setting up the plugin loader. `colorscheme.lua` loads Catppuccin directly because the statusline uses its palette during startup.

The loader discovers plugin specs from `lua/plugins/*.lua` in filename order. Mason installs tools; LSP, Conform, nvim-lint, and Treesitter own language-server configuration, formatting, linting, and syntax/folds/indentation respectively. `utils/filetypes.lua` holds shared filetype coverage.

## Plugin Loading

Plugin specs declare sources, dependencies, activation triggers, mappings, and configuration. Dependencies are loaded first when possible, but a failed dependency does not automatically prevent its dependent from loading.

Managed specs move from `unloaded` to `loading`, then to `loaded` or `failed`. Failed specs are not retried automatically. Lazy mappings become the spec's actual mappings after successful activation and do not run their actions after a failed activation. Temporary command and autocmd triggers are removed when a spec activates.

## C# Editing

The `cs` filetype activates `csharp_ls`, Conform, and Treesitter. Blink provides LSP completion, and LuaSnip loads the C# snippets supplied by friendly-snippets. `TSInstallConfigured` includes the `c_sharp` parser. Mason installs `csharp-language-server` at startup once `dotnet` is available.

C# formatting is manual through the existing Conform mapping, using LSP formatting when available. No C# formatter or linter is configured. Put C# style rules in the audio engine project's `.editorconfig` when that project exists. Revisit a dedicated formatter and format-on-save only after editing real C# code. The language server needs the .NET SDK, which is outside this Neovim configuration.

## Statusline

The global statusline shows mode, Git information, file information, diagnostics, attached language servers, and cursor position. It follows the active buffer. `<A-p>` switches between the filename and the working path. Fzf and Harpoon use an empty statusline; selected tool buffers use simplified content.

## Lab Boundary

`neovim/nvim-lab` has its own startup files and loads enabled local development plugins from `~/Code/neovim`. Its plugin list and paths are experimental; they are not production dependencies.

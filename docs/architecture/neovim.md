# Neovim Architecture

## Purpose

The production configuration lives in `neovim/nvim`. `neovim/nvim-lab` is a separate environment for local plugin development.

## Startup

`init.lua` loads options, mappings, autocmds, user commands, colors, LSP attachment mappings, diagnostics, and the statusline before setting up the plugin loader. `colorscheme.lua` loads Catppuccin directly because the statusline uses its palette during startup.

The loader discovers plugin specs from `lua/plugins/*.lua` in filename order. Mason installs tools; LSP, Conform, nvim-lint, and Treesitter own language-server configuration, formatting, linting, and syntax/folds/indentation respectively. `utils/filetypes.lua` holds shared filetype coverage.

## Plugin Loading

Plugin specs declare sources, dependencies, activation triggers, mappings, and configuration. Dependencies are loaded first when possible, but a failed dependency does not automatically prevent its dependent from loading.

Managed specs move from `unloaded` to `loading`, then to `loaded` or `failed`. Failed specs are not retried automatically. Lazy mappings become the spec's actual mappings after successful activation and do not run their actions after a failed activation. Temporary command and autocmd triggers are removed when activation begins; encounters with an already loading or failed spec return without repeating activation cleanup.

### Trigger Semantics

`keymaps` declares mappings. It is not, by itself, an instruction to lazy-load a spec on the first keypress.

| Spec declaration | Activation behavior |
| --- | --- |
| `eager = true` | Activates during setup, before deferred triggers are registered |
| No effective triggers, including keymaps alone | Activates on `VimEnter` |
| `on_cmd`, `on_event`, or `on_filetype` | Activates on the declared command, event, or filetype |
| Declared triggers plus keymaps, with `on_keymap` unset | Mappings also activate the spec |
| `on_keymap = true` with mappings | Mappings explicitly activate the spec |
| `on_keymap = false` | Mappings do not activate it; other triggers or the default `VimEnter` path remain |

`eager` takes precedence over deferred loading. The supported setup options are `import` and `debug`; `load_keymaps_eagerly` is not a current option.

### Lifecycle Ownership

- `manifest.lua` discovers, normalizes, and indexes specs and sources, including disabled-source ownership.
- `loader.lua` owns activation, dependencies, temporary triggers, command replay, and mapping installation.
- `state.lua` owns spec lifecycle, root failures, mapping registration state, and load records.
- `session_specs` is a traversal-local dependency-cycle guard, not the lifecycle authority.
- `debug.lua` formats observations and records inclusive timings.

Mapping state is `none -> lazy -> spec` or `none -> spec`. A dependency cycle skips re-entry without marking a failure or installing the outer spec's final mappings prematurely. A failed dependency retains its root diagnosis and is not retried by its dependents. A dependent may continue; if its own configuration fails, it owns that separate failure.

## C# Editing

The `cs` filetype activates `csharp_ls`, Conform, and Treesitter. Blink provides LSP completion, and LuaSnip loads the C# snippets supplied by friendly-snippets. `TSInstallConfigured` includes the `c_sharp` parser. Mason installs `csharp-language-server` at startup once `dotnet` is available.

C# formatting is manual through the existing Conform mapping (`<S-A-f>`), using LSP formatting when available. No dedicated C# formatter or linter is configured, and C# has no configured format-on-save path. SDK selection and style rules belong to each application's `global.json` and `.editorconfig`. The language server needs the .NET SDK, which is outside this Neovim configuration.

## Statusline

The global statusline shows mode, Git information, file information, diagnostics, attached language servers, and cursor position. It follows the active buffer. `<A-p>` switches between the filename and the working path. Fzf and Harpoon use an empty statusline; selected tool buffers use simplified content.

## Lab Boundary

`neovim/nvim-lab` has its own startup files and loads enabled local development plugins from `~/Code/neovim`. Its plugin list and paths are experimental; they are not production dependencies.

The lab currently loads local `jawline.nvim`. That project's architecture, implementation, releases, and backlog belong to its separate repository. Dotfiles owns the lab integration and the production configuration; the production statusline remains in `lua/thebeard/statusline`.

## Loader Debugging and Troubleshooting

The public facade is `require("thebeard.lazyload")`. It exposes these inspection functions, callable through `:lua`:

| Function | Observation |
| --- | --- |
| `print_specs()`, `print_spec_names()`, `print_plugins()` | Discovered specs and source metadata |
| `print_loaded()`, `print_spec_states()` | Loaded specs and lifecycle state |
| `print_spec_errors()` | Root spec errors and activation reasons |
| `print_registered_keymaps()` | Mapping registration state |
| `print_load_reasons()`, `print_load_events()`, `print_load_attempts()` | Reasons, events, and attempts, including skipped attempts |
| `print_timeline()`, `print_timings()` | Chronological events and inclusive timings |

For example:

```vim
:lua require("thebeard.lazyload").print_spec_states()
:lua require("thebeard.lazyload").print_spec_errors({ format = "json_pretty" })
:lua require("thebeard.lazyload").print_registered_keymaps()
```

Print functions accept `format = "lua"`, `"json"`, or `"json_pretty"`. `enable_debug()` and `disable_debug()` control verbose notifications; timing and state collection do not depend on that toggle. Enabling debug after startup does not replay earlier notifications. `clear_timings()` clears measurements, not lifecycle, failures, or load records. Nested timings are inclusive; do not add them together as total startup time.

When a spec does not activate, first confirm it was discovered and enabled, then inspect its effective triggers and mapping state. Check `print_spec_errors()` before diagnosing a dependent. A failed spec does not retry automatically in the same session: fix its source or prerequisite and use a fresh isolated session. A missing external executable, server, or parser is a tooling prerequisite problem, not evidence of a loader defect.

## Validation

Choose checks for the changed behavior rather than repeating an entire editor audit:

- Parse changed Lua files and inspect affected spec discovery, source ownership, and dependencies.
- For loader changes, use temporary fixture specs with distinct local sources in an isolated configuration. A soft-failure case should leave the dependency failed once, its dependent loaded when possible, and the failed mapping action unexecuted. A cycle case should end with both specs loaded, final mappings installed only after activation, and no repeated loading from subsequent mapping calls.
- Cover the affected trigger or replay path. For default keymap semantics, distinguish startup loading from explicit `on_keymap` activation. Remove fixtures and check production discovery afterward.
- For editor/tooling changes, exercise the relevant filetype, server attachment, completion, snippets, parsing, and formatting as applicable. Configuration declaration alone does not prove an external tool is installed or functioning.
- For statusline changes, use active/background buffers, multiple repositories, special buffers, and literal `%` in dynamic text when relevant.

The workstation links `~/.config/nvim` and `~/.config/nvim-lab` into this checkout. An isolated worktree alone does not redirect those links. Startup can install tools through Mason and add packages through `vim.pack`; use isolated data/cache/config locations and controlled dependencies for tests. Disable automatic installation for a test when needed and report that limitation. Do not update packages, install parsers, or switch the active configuration merely to validate documentation.

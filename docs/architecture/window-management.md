# Keyboard and Window Management Architecture

## Ownership

| Surface | Responsibility |
| --- | --- |
| `karabiner/karabiner-config-builder/default/` | Workstation keyboard/device rules, layers, application-specific bindings, and integration calls |
| `aerospace/aerospace.toml` | Workspace model, detected-window routing, layouts, gaps, monitor assignment, and AeroSpace-native bindings |
| `bin/focus-appspace` | Application activation/launch and application-workspace navigation |
| `bin/focus-sfspace` | SoundFlow workspace/launcher integration |
| `borders/bordersrc` | Active/inactive window-border appearance |
| Separate Karabiner Config Builder repository | Builder implementation, generation semantics, diagnostics, releases, and product backlog |
| Applications and separate automation projects | Native commands and product behavior invoked by workstation bindings |

Dotfiles owns configuration and integration with those systems, not their product roadmaps.

## Keyboard Source and Output

`config.ts` assembles the `Main` profile from Moonlander and non-Moonlander groups, Finder utilities, and global modifier/tap bindings. `moonlander.ts` and `internal.ts` distinguish device conditions and layer triggers. Here `internal.ts` means the non-Moonlander keyboard group; it is unrelated to the private planning submodule.

Shared binding arrays own AeroSpace commands, app navigation, Finder utilities, and Pro Tools commands/markers. Keyboard layers route shortcuts to these commands; application-specific groups constrain native actions to their target applications. The exact shortcut definitions and declaration order remain in the source files.

The profile's `package.json` provides `build` (`kcb build`) and `deploy` (`kcb deploy`). Its tracked builder dependency is a symlink to `/opt/homebrew/lib/node_modules/karabiner-config-builder`, so the workstation's global builder installation is a prerequisite. That dependency is separate from the profile configuration.

Karabiner consumes generated configuration. The workstation's `~/.config/karabiner/karabiner.json` is a regular output file, not a source symlink. Editing TypeScript does not by itself prove that the active JSON matches it. Verify builder output and deployment destination before claiming a configuration change is live; do not infer output equivalence from file dates.

## Workspace and Application Routing

AeroSpace defines persistent workspaces `0` through `9` and `ex`, with `ex` assigned to the secondary monitor. Detected applications route to named application workspaces such as `fd` (Finder), `pt` (Pro Tools), `tm` (Ghostty), and `ai` (OpenAI applications). Other rules assign floating layouts to selected utility windows.

Karabiner's AeroSpace bindings invoke focus, move, resize, layout, fullscreen, workspace, and monitor commands. App bindings pair focus/launch actions with move-window actions. The helper `focus-appspace` accepts an application bundle ID, workspace, and optional new-window command. If the app is not running, it either selects an occupied target workspace or launches the app; if running, it selects the workspace and activates the app, optionally requesting a window when none exist.

`focus-sfspace` selects the `sf` workspace and invokes its configured SoundFlow launcher when no windows are present. The script owns that workstation entry point; SoundFlow owns the invoked automation's behavior and development.

AeroSpace also owns native `Alt-Tab` workspace switching and its service-mode bindings. Ghostty, shell, and Neovim shortcuts retain their own scopes; see [terminal architecture](terminal.md). A shortcut's owner should be determined from the applicable device, layer, application condition, and command target rather than assumed from its key alone.

## Deployment and Validation

The workstation links AeroSpace and Borders configuration files into this checkout. Reloads can change active layouts and window behavior. Keyboard deployment changes global input behavior. Focus helpers can switch workspaces, launch applications, or run automation.

For an authorized configuration change:

1. Inspect the affected source, dependency, active destination, and relevant shortcut conditions.
2. Use the installed subsystem's supported static/build checks in isolation where possible. Inspect generated output and build destinations before deployment.
3. Exercise only the affected device/layer/application/workspace path when runtime validation is authorized. Check the intended action and relevant native-shortcut interaction.
4. Report separately whether source was validated, output generated, configuration deployed/reloaded, and runtime behavior verified.

Do not run `deploy`, window-routing helpers, or SoundFlow launchers merely to validate documentation. Builder feature changes belong in the builder repository; dotfiles changes should address the workstation configuration or integration.

Public configuration and this ownership map do not depend on the private planning submodule.

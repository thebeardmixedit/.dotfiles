---@alias TheBeardLazyloadPluginSpecSource string|vim.pack.Spec
---@alias TheBeardLazyloadPluginSpecSources TheBeardLazyloadPluginSpecSource[]

---@alias TheBeardLazyloadOutputFormat "lua"|"json"|"json_pretty"

---@class TheBeardLazyloadPrintOptions
---@field format? TheBeardLazyloadOutputFormat

---@class TheBeardLazyloadSetupOptions
---@field import? string
---@field debug? boolean

---@class TheBeardLazyloadKeymap
---@field keys string
---@field cmd string|function
---@field opts? vim.api.keyset.keymap
---@field modes? string|string[]

---@class TheBeardLazyloadPluginSpec
---@field sources TheBeardLazyloadPluginSpecSources
---@field spec_name? string
---@field plugin_name? string
---@field deps? TheBeardLazyloadPluginSpecSources
---@field eager? boolean
---@field enabled? boolean
---@field on_event? vim.api.keyset.events|vim.api.keyset.events[]
---@field on_filetype? string|string[]
---@field on_cmd? string|string[]
---@field config? function
---@field keymaps? TheBeardLazyloadKeymap[]
---@field before_load? function

---@class TheBeardLazyloadManifest
---@field specs TheBeardLazyloadPluginSpec[]
---@field disabled_specs TheBeardLazyloadPluginSpec[]
---@field disabled_sources table<string, TheBeardLazyloadPluginSpec>
---@field by_name table<string, TheBeardLazyloadPluginSpec>
---@field by_spec_name table<string, TheBeardLazyloadPluginSpec>

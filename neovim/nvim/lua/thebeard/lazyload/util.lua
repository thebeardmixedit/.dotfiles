local M = {}

---@param value nil|string|string[]
---@return string[]
function M.as_list(value)
	if value == nil then
		return {}
	end

	if type(value) == "table" then
		return value
	end

	return { value }
end

---@param source TheBeardLazyloadPluginSpecSource
---@return string
function M.plugin_name(source)
	if type(source) == "string" then
		source = source:gsub("/+$", ""):gsub("%.git$", "")
		return source:match("[:/]([^/:]+)$")
	end

	if type(source) ~= "table" or type(source.src) ~= "string" then
		error("Invalid plugin source. Expected string or vim.pack.Spec with string .src field")
	end

	local src = source.src
	src = src:gsub("/+$", ""):gsub("%.git$", "")

	local name = src:match("[:/]([^/:]+)$")

	if not name then
		error("Could not derive plugin name from source: " .. src)
	end

	return name
end

---@param value any
---@param seen? table<table, boolean>
---@return any
function M.serialize(value, seen)
	if type(value) == "function" then
		return "function"
	end

	if type(value) ~= "table" then
		return value
	end

	seen = seen or {}

	if seen[value] then
		return "<cycle>"
	end

	seen[value] = true

	local out = {}

	for k, v in pairs(value) do
		out[k] = M.serialize(v, seen)
	end

	seen[value] = nil

	return out
end

---@param value any
---@param opts? TheBeardLazyloadPrintOptions
---@return string
function M.format(value, opts)
	opts = opts or {}

	local format = opts.format or "lua"

	if format == "json" then
		return vim.json.encode(value)
	end

	if format == "json_pretty" then
		local ok, encoded = pcall(vim.json.encode, value, {
			indent = "  ",
		})

		if ok then
			return encoded
		end

		return vim.json.encode(value)
	end

	return vim.inspect(value)
end

---@param value any
---@param opts? TheBeardLazyloadPrintOptions
function M.dump(value, opts)
	print(M.format(value, opts))
end

---@param args TheBeardLazyloadKeymap
function M.keymap(args)
	local keys = args.keys
	local cmd = args.cmd
	local mopts = args.opts or {}
	local mapopts = vim.tbl_deep_extend("force", { silent = true }, mopts)
	local modes = args.modes or "n"

	vim.keymap.set(modes, keys, cmd, mapopts)
end

return M

local utils = require("thebeard.statusline.utils")

return {
	---@param opts {bufnr:integer|nil}|nil
	render = function(opts)
		opts = opts or {}
		local bufnr = opts.bufnr or 0

		if utils.should_hide_module(bufnr) then
			return ""
		end

		local clients = vim.lsp.get_clients({ bufnr = bufnr })

		if next(clients) == nil then
			return "            "
		end

		local names = {}

		for _, client in pairs(clients) do
			-- if client.name ~= "GitHub Copilot" and client.name ~= "Copilot" then
			if client.name ~= "copilot" then
				table.insert(names, client.name)
			end
		end

		if #names == 0 then
			return "            "
		end

		return " " .. table.concat(names, "|")
	end,
}

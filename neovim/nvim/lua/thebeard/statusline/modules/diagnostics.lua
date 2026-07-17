local utils = require("thebeard.statusline.utils")

return {
	---@param opts? {bufnr?:integer,reverse?:boolean}
	render = function(opts)
		opts = opts or {}
		local bufnr = opts.bufnr or 0
		local reverse = opts.reverse or false

		if utils.should_hide_module(bufnr) then
			return ""
		end

		local num_errors = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.ERROR })
		local num_warnings = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.WARN })
		local num_hints = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.HINT })
		local num_infos = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.INFO })

		local error_hl = num_errors > 0 and "%#StatusLineDiagnosticError#" or "%#StatusLineNC#"
		local warning_hl = num_warnings > 0 and "%#StatusLineDiagnosticWarning#" or "%#StatusLineNC#"
		local info_hl = num_hints + num_infos > 0 and "%#StatusLineDiagnosticInfo#" or "%#StatusLineNC#"

		local errors = error_hl .. " " .. num_errors .. "%*"
		local warnings = warning_hl .. " " .. num_warnings .. "%*"
		local infos = info_hl .. " " .. num_infos + num_hints .. "%*"

		if reverse == true then
			return infos .. " " .. warnings .. " " .. errors
		end

		return errors .. " " .. warnings .. " " .. infos
	end,
}

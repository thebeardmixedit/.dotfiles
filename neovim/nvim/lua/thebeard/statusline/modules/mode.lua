local utils = require("thebeard.statusline.utils")

local modes = {
	["n"] = { icon = "N ", hl = "Normal" },
	["no"] = { icon = "N ", hl = "Pending" },
	["nov"] = { icon = "N ", hl = "Pending" },
	["noV"] = { icon = "N ", hl = "Pending" },
	["no\22"] = { icon = "N ", hl = "Pending" },
	["niI"] = { icon = "N ", hl = "Normal" },
	["niR"] = { icon = "N ", hl = "Normal" },
	["niV"] = { icon = "N ", hl = "Normal" },
	["nt"] = { icon = "N ", hl = "Normal" },
	["ntT"] = { icon = "N ", hl = "Normal" },
	["v"] = { icon = "V ", hl = "Visual" },
	["vs"] = { icon = "V ", hl = "Visual" },
	["V"] = { icon = "VL ", hl = "Visual" },
	["Vs"] = { icon = "VL ", hl = "Visual" },
	["\22"] = { icon = "VB ", hl = "Visual" },
	["\22s"] = { icon = "VB ", hl = "Visual" },
	["s"] = { icon = "S ", hl = "Insert" },
	["S"] = { icon = "SL ", hl = "Normal" },
	["\19"] = { icon = "SB ", hl = "Normal" },
	["i"] = { icon = "I ", hl = "Insert" },
	["ic"] = { icon = "I ", hl = "Insert" },
	["ix"] = { icon = "I ", hl = "Insert" },
	["R"] = { icon = "R ", hl = "Replace" },
	["Rc"] = { icon = "R ", hl = "Replace" },
	["Rx"] = { icon = "R ", hl = "Replace" },
	["Rv"] = { icon = "R ", hl = "Replace" },
	["Rvc"] = { icon = "R ", hl = "Replace" },
	["Rvx"] = { icon = "R ", hl = "Replace" },
	["r"] = { icon = "R ", hl = "Normal" },
	["rm"] = { icon = "R ", hl = "Normal" },
	["r?"] = { icon = "R ", hl = "Normal" },
	["c"] = { icon = "󰘳 ", hl = "Command" },
	["cv"] = { icon = "󰘳 ", hl = "Command" },
	["ce"] = { icon = "󰘳 ", hl = "Command" },
	["!"] = { icon = " ", hl = "Insert" },
	["t"] = { icon = " ", hl = "Insert" },
}

return {
	---@param opts {bufnr:integer|nil}|nil
	render = function(opts)
		opts = opts or {}
		local bufnr = opts.bufnr or 0

		local filetype = utils.filetype(bufnr)

		if filetype == "netrw" or filetype == "NeogitStatus" then
			return ""
		end

		local current_mode = modes[vim.fn.mode()] or modes.n
		local hl = "%#StatusLineMode" .. current_mode.hl .. "#"

		return hl .. current_mode.icon .. "%*"
	end,
}

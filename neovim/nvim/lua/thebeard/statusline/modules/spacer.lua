return {
	---@param num_spaces? integer
	render = function(num_spaces)
		return string.rep(" ", num_spaces or 1)
	end,
}

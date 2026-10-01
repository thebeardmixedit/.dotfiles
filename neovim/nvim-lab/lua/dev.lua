local dev = vim.fn.expand("~/Code/neovim")

local plugins = {
	jawline = {
		path = dev .. "/jawline.nvim",
		module = "jawline",
		enabled = true,
		opts = {
			debug = true,
		},
	},
}

for _, plugin in pairs(plugins) do
	if plugin.enabled then
		vim.opt.runtimepath:prepend(plugin.path)
	end
end

for _, plugin in pairs(plugins) do
	if plugin.enabled then
		require(plugin.module).setup(plugin.opts)
	end
end

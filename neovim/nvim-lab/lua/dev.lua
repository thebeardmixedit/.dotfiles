local dev = vim.fn.expand("~/Code/neovim")

local plugins = {
	groom = {
		path = dev .. "/groom.nvim",
		module = "groom",
		enabled = false,
		opts = {
			debug = true,
		},
	},

	jawline = {
		path = dev .. "/jawline.nvim",
		module = "jawline",
		enabled = true,
		opts = {
			debug = true,
		},
	},

	mirror = {
		path = dev .. "/mirror.nvim",
		module = "mirror",
		enabled = false,
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

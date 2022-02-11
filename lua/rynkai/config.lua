local M = {}

local default_options = {
	theme = "catppuccin",
	config_file = "lua/colorscheme.lua",
	rynkai_dir = "/site/pack/packer/start/rynkai.nvim/lua/rynkai/colors/",
	italic = {},
	bold = {},
	term_colors = true,
}

M.options = {}

M.setup = function(options)
	M.options = vim.tbl_deep_extend("force", {}, default_options, options or {})
end

M.setup()

return M

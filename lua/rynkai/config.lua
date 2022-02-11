local M = {}

local default_options = {
	config_file = "lua/ryn/plugins/colorscheme.lua",
	rynkai_dir = vim.fn.stdpath("data") .. "/site/pack/packer/opt/rynkai.nvim/lua/rynkai/colors/",
	theme = "catppuccin",
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

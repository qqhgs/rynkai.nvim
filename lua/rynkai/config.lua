local M = {}

local default_options = {
	theme = "catppuccin",
	config_file = vim.fn.stdpath("config") .. "/" .. "lua/colorscheme.lua",
	rynkai_dir = vim.fn.stdpath("data") .. "/site/pack/packer/start/rynkai.nvim/lua/rynkai/colors/",
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

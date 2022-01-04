local colors = require("rynkai.colors.default")

local M = {}

M.normal = {
	a = { fg = colors.bg5, bg = colors.accent6, gui = "bold" },
	b = { fg = colors.fg1, bg = colors.fg5 },
	c = { fg = colors.accent2, bg = colors.bg3 },
	-- z = { fg = colors.accent6, bg = colors.bg2 },
}

M.insert = {
	a = { fg = colors.bg3, bg = colors.fello3, gui = "bold" },
	-- b = {fg = colors.title, bg = colors.bg_alt},
}

M.visual = {
	a = {fg = colors.bg5, bg = colors.sam3, gui = 'bold'},
}

M.replace = {
	a = {fg = colors.bg5, bg = colors.karl3, gui = 'bold'},
}

M.command = {
	a = {fg = colors.bg5, bg = colors.mark3, gui = 'bold'},
}

M.inactive = {
	-- a = {fg = colors.disabled, bg = colors.bg, gui = 'bold'},
	-- b = {fg = colors.disabled, bg = colors.bg},
	c = { fg = colors.fg3, bg = colors.bg4 },
}

return M

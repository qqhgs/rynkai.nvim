local defaults = require("rynkai.config").options
local colors = require("rynkai.colors." .. defaults.theme)
local C = require("rynkai.fn").set_schemes(colors)

local M = {}

M.normal = {
	a = { bg = C.base0A, fg = C.base00, gui = "bold" },
	b = { bg = C.base00, fg = C.base0A },
	c = { bg = C.base02, fg = C.base07 },
}

M.insert = {
	a = { bg = C.base0E, fg = C.base01, gui = "bold" },
	b = { bg = C.base00, fg = C.base0E },
}

M.command = {
	a = { bg = C.base0C, fg = C.base01, gui = "bold" },
	b = { bg = C.base00, fg = C.base0C },
}

M.visual = {
	a = { bg = C.base0F, fg = C.base01, gui = "bold" },
	b = { bg = C.base00, fg = C.base0F },
}

M.replace = {
	a = { bg = C.base0B, fg = C.base01, gui = "bold" },
	b = { bg = C.base00, fg = C.base0B },
}

M.inactive = {
	a = { bg = C.base00, fg = C.base0A },
	b = { bg = C.base00, fg = C.base03, gui = "bold" },
	c = { bg = C.base00, fg = C.base04 },
}

return M


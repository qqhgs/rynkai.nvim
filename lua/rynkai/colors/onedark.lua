local fn = require("rynkai.fn")

local palette = {
	bg 			= "#282c34",
	accent 	= "#c2c7d0",
	blue 		= "#61afef",
	red 		= "#e06c75",
	orange 	= "#d19a66",
	yellow 	= "#e5c07b",
	green 	= "#98c379",
	purple 	= "#c678dd",
}

local schemes = fn.set_schemes(palette)

local custom = {
	CursorLineBg = fn.brighten(schemes.base01, .04),
}

return vim.tbl_deep_extend("keep", custom, palette)

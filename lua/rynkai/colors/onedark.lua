local fn = require("rynkai.fn")

local palette = {
	bg 			= "#1a212e",
	accent 	= "#81A1C1",
	blue 		= "#61a3de",
	red 		= "#f65866",
	orange 	= "#ea8912",
	yellow 	= "#ebc275",
	green 	= "#8bcd5b",
	purple 	= "#c678dd",

}

local schemes = fn.set_schemes(palette)

local custom = {
	CursorLineBg = fn.brighten(schemes.base01, .04),
}

return vim.tbl_deep_extend("keep", custom, palette)

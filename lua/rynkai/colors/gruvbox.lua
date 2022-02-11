local fn = require("rynkai.fn")

local palette = {
	bg 			= "#1e2122",
	accent 	= "#e0c080",
	blue 		= "#7daea3",
	red 		= "#ec6b64",
	orange 	= "#d65d0e",
	yellow 	= "#e78a4e",
	green 	= "#a9b665",
	purple 	= "#d3869b",

}

local schemes = fn.set_schemes(palette)

local custom = {
	CursorLineBg = fn.brighten(schemes.base01, .04),
}

return vim.tbl_deep_extend("keep", custom, palette)

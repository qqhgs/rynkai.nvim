local fn = require("rynkai.fn")

local palette = {
	bg 			= "#24283b",
	accent 	= "#a9b1d6",
	blue 		= "#7aa2f7",
	red 		= "#f7768e",
	orange 	= "#ff9e64",
	yellow 	= "#eoaf68",
	green 	= "#9ece6a",
	purple 	= "#9d7cd8",

}

local schemes = fn.set_schemes(palette)

local custom = {
	CursorLineBg = fn.brighten(schemes.base01, .04),
}

return vim.tbl_deep_extend("keep", custom, palette)

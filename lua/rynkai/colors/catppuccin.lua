local fn = require("rynkai.fn")

local palette = {
	bg 			= "#1A1826",
	fg 			= "#D9E0EE",
	accent 	= "#F5C2E7",
	blue 		= "#96CDFB",
	red 		= "#F28FAD",
	orange 	= "#F8BD96",
	yellow 	= "#FAE3B0",
	green 	= "#ABE9B3",
	purple 	= "#DDB6F2",
}

local schemes = fn.set_schemes(palette)

local custom = {
	CursorLineBg = fn.brighten(schemes.base01, .04),
}

return vim.tbl_deep_extend("keep", custom, palette)

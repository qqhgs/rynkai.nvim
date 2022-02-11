local fn = require("rynkai.fn")

local palette = {
	bg 			= fn.darken("#2E3440", 0.65),
	accent 	= "#81A1C1",
	blue 		= "#5E81AC",
	red 		= "#BF616A",
	orange 	= "#D08770",
	yellow 	= "#EBCB8B",
	green 	= "#A3BE8C",
	purple 	= "#B48EAD",

}

local schemes = fn.set_schemes(palette)

local custom = {
	CursorLineBg = fn.brighten(schemes.base01, .04),
}

return vim.tbl_deep_extend("keep", custom, palette)

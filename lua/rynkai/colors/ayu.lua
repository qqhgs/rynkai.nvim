local fn = require("rynkai.fn")

local palette = {
	bg 			= "#1F2430",
	accent 	= "#ffcc66",
	blue 		= "#f29e74",
	red 		= "#F28779",
	orange 	= "#ffad66",
	yellow 	= "#ffd173",
	green 	= "#d5ff80",
	purple 	= "#dfbfff",

}

local schemes = fn.set_schemes(palette)

local custom = {
	CursorLineBg = fn.brighten(schemes.base01, .04),
}

return vim.tbl_deep_extend("keep", custom, palette)

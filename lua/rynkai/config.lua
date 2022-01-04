local M = {}

local default_options = {
	italics = {
		functions = false,
	},
	disable = {
		term_colors = false,
	}
}

M.options = {}

M.setup = function(options)
	M.options = vim.tbl_deep_extend("force", {}, default_options, options or {})
end

M.setup()

return M

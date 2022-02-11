local M = {}

local theme = require("rynkai.theme")
local config = require("rynkai.config").options

M.highlight = function(groupName, colors)
	local groups = { groupName }

	local style = colors.style and "gui=" .. colors.style or "gui=NONE"
	table.insert(groups, style)

	local fg = colors.fg and "guifg=" .. colors.fg or "guifg=NONE"
	table.insert(groups, fg)

	local bg = colors.bg and "guibg=" .. colors.bg or "guibg=NONE"
	table.insert(groups, bg)

	local sp = colors.sp and "guisp=" .. colors.sp or "guisp=NONE"
	table.insert(groups, sp)

	vim.api.nvim_command("hi! " .. table.concat(groups, " "))
  if colors.link then vim.cmd("highlight! link " .. groupName .. " " .. colors.link) end
end

M.load = function()
	vim.cmd("hi! clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end
	vim.o.background = "dark"
	vim.o.termguicolors = true
	vim.g.colors_name = "rynkai"

	local async
	async = vim.loop.new_async(vim.schedule_wrap(function()
		local plugins = theme.setPlugins()

		if config.term_colors == false then
			theme.setTerminal()
		end

		for group, colors in pairs(plugins) do
			M.highlight(group, colors)
		end

		async:close()
	end))

	local editor = theme.setEditor()
	for group, colors in pairs(editor) do
		M.highlight(group, colors)
	end

	local syntax = theme.setSyntax()
	for group, colors in pairs(syntax) do
		M.highlight(group, colors)
	end

	local treesitter = theme.setTreesitter()
	for group, colors in pairs(treesitter) do
		M.highlight(group, colors)
	end

	local lsp = theme.setLsp()
	for group, colors in pairs(lsp) do
		M.highlight(group, colors)
	end

	async:send()
end

return M

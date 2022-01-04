local C = require("rynkai.colors.default")
local configs = require("rynkai.config").options

local M = {}
M.setSyntax = function()
	local syntax = {
		Constant = { fg = C.sam1 },
		String = { fg = C.fello2 },
		Character = { fg = C.sam2 },
		-- Boolean 		= { fg = C.sam2 },
		Number = { fg = C.mark3 },
		-- Float 			= { fg = C.mark2 },

		Identifier = { fg = C.accent1 },

		Comment = { fg = C.fg4 },

		Statement = { fg = C.sam2 }, -- (preferred) any statements
		-- Conditional 	= { fg = C.mark3 }, -- if, then, else, endif, switch, etc.
		-- Repeat 			= { fg = C.noah1 }, -- for, do, while, etc.
		-- Label 				= { fg = C.accent3 }, -- case, default, etc.
		Operator = { fg = C.mark2 }, -- "sizeof", "+", "*", etc.
		Keyword = { fg = C.accent3 }, -- any other keyword
		-- Exception 		= {}, -- try, catch, throw

		PreProc = { fg = C.accent3 }, -- (preferred) generic Preprocessor
		-- Include 			= { fg = C.accent3 }, -- preprocessor #include
		-- Define 			= { fg = C.mark3 }, -- preprocessor #define
		-- Macro				= {}, -- same as Define
		-- PreCondit 		= {}, -- preprocessor #if, #else, #endif, etc.

		Type = { fg = C.accent3 }, -- (preferred) int, long, char, etc.
		-- StorageClass = { fg = C.noah3 }, -- static, register, volatile, etc.
		-- Structure 		= { fg = C.mark3 }, -- struct, union, enum, etc.
		-- Typedef 			= { fg = C.accent3 }, -- A typedef

		Special = { fg = C.accent3 },
		SpecialChar = { fg = C.accent4 },
		-- Tag 							= { fg = C.accent3 },
		Delimiter = { fg = C.accent3 },
		-- SpecialCOmment 	= {}, -- special things inside a comment
		-- Debug 						= {}, -- debugging statements

		Error = {}, -- (preferred) any erroneous construct
		Todo = { fg = C.accent3 },

		-- Treesitter
    TSVariable = { fg = C.accent2 }, -- Any variable name that does not have another highlight.
	}

	if configs.italics.functions then
		syntax.Function = { fg = C.accent5, style = "italic" }
	else
		syntax.Function = { fg = C.accent5 }
	end

	return syntax
end

M.setEditor = function()
	local editor = {
		Normal = { fg = C.fg1, bg = C.bg5 },
		NormalFloat = { bg = C.bg2 },
		VertSplit = { fg = C.bg3, bg = C.bg4 },
		PMenu = { fg = C.accent2, bg = C.bg3 },
		PMenuSel = { fg = C.accent1, bg = C.bg4 },
		PMenuSbar = { bg = C.bg2 },
		PMenuThumb = { bg = C.accent2 },
		CursorLine = { bg = C.bg4 },
		LineNr = { fg = C.fg5, bg = C.bg5 },
		CursorLineNr = { fg = C.accent3, bg = C.bg4 },
		SignColumn = { fg = C.accent1, bg = C.bg5 },
		NonText = { fg = C.bg3 },
		Question = { fg = C.accent2 },
		Search = { fg = C.bg3, bg = C.accent2 },
		Visual = { fg = C.fg2, bg = C.bg1 },
		StatusLine = { fg = C.bg2 },
		StatusLineNC = { fg = C.bg2 },
		DiffAdd = { fg = C.fello1, bg = C.bg5 },
		DiffChange = { fg = C.noah2, bg = C.bg5 },
		DiffDelete = { fg = C.mark2, bg = C.bg5 },
		Title = { fg = C.noah2 },
	}
	return editor
end

M.setLsp = function()
	local lsp = {
		DiagnosticHint = { fg = C.hint },
		DiagnosticWarn = { fg = C.warn },
		DiagnosticError = { fg = C.error },
		DiagnosticInfo = { fg = C.info },
	}
	return lsp
end

M.setTerminal = function()
	if vim.fn.has("nvim") then
		vim.g.terminal_color_0 = "#" .. C.bg4
		vim.g.terminal_color_1 = "#" .. C.sam2
		vim.g.terminal_color_2 = "#" .. C.fello3
		vim.g.terminal_color_3 = "#" .. C.noah3
		vim.g.terminal_color_4 = "#" .. C.fello2
		vim.g.terminal_color_5 = "#" .. C.mark3
		vim.g.terminal_color_6 = "#" .. C.sam3
		vim.g.terminal_color_7 = "#" .. C.noah1
		vim.g.terminal_color_8 = "#" .. C.bg1
		vim.g.terminal_color_9 = "#" .. C.sam2
		vim.g.terminal_color_10 = "#" .. C.fello3
		vim.g.terminal_color_11 = "#" .. C.mark3
		vim.g.terminal_color_12 = "#" .. C.accent5
		vim.g.terminal_color_13 = "#" .. C.mark3
		vim.g.terminal_color_14 = "#" .. C.sam3
		vim.g.terminal_color_15 = "#" .. C.bg5
		if vim.o.background == "light" then
			vim.g.terminal_color_background = "#" .. C.noah1
			vim.g.terminal_color_foreground = "#" .. C.fello2
		else
			vim.g.terminal_color_background = "#" .. C.bg4
			vim.g.terminal_color_foreground = "#" .. C.mark3
		end
	end
end

M.setPlugins = function()
	local plugins = {
		-- NvimTree
		NvimTreeNormal = { fg = C.accent1, bg = C.bg4 },
		NvimTreeSymlink = { fg = C.mark1 },
		NvimTreeFolderName = { fg = C.accent2 },
		NvimTreeFolderIcon = { fg = C.noah2 },
		NvimTreeEmptyFolderName = { fg = C.noah1 },
		NvimTreeOpenedFolderName = { fg = C.accent3 },
		NvimTreeRootFolder = { fg = C.accent4 },
		NvimTreeExecFile = { fg = C.fello1 },
		NvimTreeSpecialFile = { fg = C.sam1 },
		NvimTreeImageFile = { fg = C.sam2 },
		NvimTreeGitDirty = { fg = C.accent5 },
		NvimTreeGitStaged = { fg = C.noah2 },
		NvimTreeGitMerge = { fg = C.sam2 },
		NvimTreeGitRenamed = { fg = C.accent5 },
		NvimTreeGitNew = { fg = C.fello2 },
		NvimTreeGitDeleted = { fg = C.mark2 },

		-- Bufferline
		BufferLineFill = { bg = C.bg2 },
		BufferLineBackground = { fg = C.fg2, bg = C.bg2 },
		BufferLineDuplicate = { bg = C.bg2 },
		BufferLineSeparator = { fg = C.bg5, bg = C.bg2 },
		BufferLineTab = { fg = C.fg2, bg = C.bg2 },
		BufferLineTabSelected = { fg = C.accent3, bg = C.bg5 },
		BufferLineTabClose = { fg = C.accent3, bg = C.bg4 },
		BufferLineCloseButton = { bg = C.bg2 },
		BufferLineCloseButtonSelected = { fg = C.fg1, bg = C.bg5 },
		BufferLineBufferSelected = { fg = C.accent2, bg = C.bg5, style = "bold,italic" },
		BufferLineBufferVisible = { fg = C.accent1, bg = C.bg5 },
		BufferLineModified = { fg = C.fg2, bg = C.bg2 },
		BufferLineModifiedSelected = { fg = C.accent2 },
		BufferLineModifiedVisible = { fg = C.accent2 },
		BufferLineIndicator = { fg = C.accent2, bg = C.mark3 },
		BufferLineIndicatorSelected = { fg = C.accent3 },
		BufferLinePick = { fg = C.mark3, bg = C.bg2, style = "bold,italic" },
		BufferLineDiagnostic = { bg = C.bg2 },
		BufferLineDiagnosticVisible = { bg = C.bg2 },
		BufferLineWarning = { bg = C.bg2 },
		BufferLineWarnDiagnostic = { fg = C.karl2, bg = C.bg2 },
		BufferLineWarnDiagnosticSelected = { fg = C.karl2, bg = C.bg5 },
		BufferLineWarnDiagnosticVisible = { fg = C.karl2, bg = C.bg5 },
		BufferLineError = { bg = C.bg2 },
		BufferLineErrorDiagnostic = { fg = C.mark3, bg = C.bg2 },
		BufferLineErrorDiagnosticSelected = { fg = C.mark3, bg = C.bg5 },
		BufferLineErrorDiagnosticVisible = { fg = C.mark3, bg = C.bg5 },
		BufferLineInfo = { bg = C.bg2 },
		BufferLineInfoDiagnostic = { fg = C.noah3, bg = C.bg2 },
		BufferLineInfoDiagnosticSelected = { fg = C.noah3, bg = C.bg5 },
		BufferLineInfoDiagnosticVisible = { fg = C.noah3, bg = C.bg5 },
		BufferLineHint = { bg = C.bg2 },
		BufferLineHintDiagnostic = { fg = C.fello2, bg = C.bg2 },
		BufferLineHintDiagnosticSelected = { fg = C.fello2, bg = C.bg5 },
		BufferLineHintDiagnosticVisible = { fg = C.fello2, bg = C.bg5 },

		-- WhichKey
		WhichKey = { fg = C.accent2, style = "bold" },
		WhichKeyGroup = { fg = C.accent3 },
		WhichKeyDesc = { fg = C.accent1, style = "italic" },
		WhichKeySeperator = { fg = C.accent5 },
		WhichKeyFloating = { bg = C.fello1 },
		WhichKeyFloat = { bg = C.bg2 },

		-- Cmp
		CmpItemAbbr = { fg = C.accent2 },
		CmpItemKindDefault = { fg = C.accent5 },
		CmpItemMenuDefault = { fg = C.accent3 },

		-- Telescope
		TelescopeNormal = { fg = C.accent1, bg = C.bg3 },
    TelescopeBorder = { fg = C.accent2, bg = C.bg3 },
    TelescopeTitle = { fg = C.accent3 },
    TelescopeMatching = { fg = C.accent3 },
		TelescopeSelection = { fg = C.accent2, bg = C.bg2 },
		TelescopePromptPrefix = { fg = C.accent2 },
		-- TelescopeSelectionCaret = { fg = C.accent5 },
	}
	return plugins
end

return M

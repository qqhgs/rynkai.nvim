local defaults = require("rynkai.config").options
local palette = require("rynkai.colors." .. defaults.theme)
local C = require("rynkai.fn").set_schemes(palette)

local M = {}
M.setSyntax = function()
	local syntax = {
		Comment = { fg = C.base04 }, -- just comments
		Constant = { fg = C.base0C }, -- (preferred) any constant
		String = { fg = C.base0E }, -- a string constant: "this is a string"
		Character = { fg = C.base0E }, --  a character constant: 'c', '\n'
		Number = { fg = C.base0C }, --   a number constant: 234, 0xff
		Float = { fg = C.base0C }, --    a floating point constant: 2.3e10
		Boolean = { fg = C.base0C }, --  a boolean constant: TRUE, false
		Identifier = { fg = C.base08 }, -- (preferred) any variable name
		Function = { fg = C.base0A }, -- function name (also: methods for classes)
		Statement = { fg = C.base0F }, -- (preferred) any statement
		Conditional = { fg = C.base0B }, --  if, then, else, endif, switch, etcp.
		Repeat = { fg = C.base0B }, --   for, do, while, etcp.
		Label = { fg = C.base0C }, --    case, default, etcp.
		Operator = { fg = C.base0A }, -- "sizeof", "+", "*", etcp.
		Keyword = { fg = C.base09 }, --  any other keyword
		-- Exception     = { }, --  try, catch, throw

		PreProc = { fg = C.base09 }, -- (preferred) generic Preprocessor
		Include = { fg = C.base09 }, --  preprocessor #include
		-- Define        = { }, --   preprocessor #define
		-- Macro         = { }, --    same as Define
		-- PreCondit     = { }, --  preprocessor #if, #else, #endif, etcp.

		StorageClass = { fg = C.base0D }, -- static, register, volatile, etcp.
		Structure = { fg = C.base0D }, --  struct, union, enum, etcp.
		Typedef = { fg = C.base0D }, --  A typedef
		Special = { fg = C.base09 }, -- (preferred) any special symbol
		Type = { fg = C.base0A }, -- (preferred) int, long, char, etcp.
		-- SpecialChar   = { }, --  special character in a constant
		-- Tag           = { }, --    you can use CTRL-] on this
		-- Delimiter     = { }, --  character that needs attention
		-- Specialgray0= { }, -- special things inside a gray0
		-- Debug         = { }, --    debugging statements

		Underlined = { style = "underline" }, -- (preferred) text that stands out, HTML links
		Bold = { style = "bold" },
		Italic = { style = "italic" },
		-- ("Ignore", below, may be invisible...)
		-- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

		Error = { fg = C.base0B }, -- (preferred) any erroneous construct
		Todo = { bg = C.base0D, fg = C.base01, style = "bold" }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
		qfLineNr = { fg = C.base0D },
		qfFileName = { fg = C.base0A },
		htmlH1 = { fg = C.base09, style = "bold" },
		htmlH2 = { fg = C.base0A, style = "bold" },
		-- mkdHeading = { fg = cp.peach, style = "bold" },
		-- mkdCode = { bg = cp.terminal_black, fg = cp.white },
		mkdCodeDelimiter = { bg = C.base01, fg = C.base07 },
		mkdCodeStart = { fg = C.base08, style = "bold" },
		mkdCodeEnd = { fg = C.base08, style = "bold" },
		-- mkdLink = { fg = cp.blue, style = "underline" },

		-- debugging
		debugPC = { bg = C.base00 }, -- used for highlighting the current line in terminal-debug
		debugBreakpoint = { bg = C.base01, fg = C.base04 }, -- used for breakpoint colors in terminal-debug
		-- illuminate
		illuminatedWord = { bg = C.base03 },
		illuminatedCurWord = { bg = C.base03 },
		-- diff
		diffAdded = { fg = C.base0E },
		diffRemoved = { fg = C.base0B },
		diffChanged = { fg = C.base0D },
		diffOldFile = { fg = C.base0D },
		diffNewFile = { fg = C.base0C },
		diffFile = { fg = C.base0A },
		diffLine = { fg = C.base04 },
		diffIndexLine = { fg = C.base09 },
		DiffAdd = { fg = C.base0E, bg = C.base01 }, -- diff mode: Added line |diff.txt|
		DiffChange = { fg = C.base0D, bg = C.base01 }, -- diff mode: Changed line |diff.txt|
		DiffDelete = { fg = C.base0B, bg = C.base01 }, -- diff mode: Deleted line |diff.txt|
		DiffText = { fg = C.base0A, bg = C.base01 }, -- diff mode: Changed text within a changed line |diff.txt|
		-- NeoVim
		healthError = { fg = C.base0B },
		healthSuccess = { fg = C.base0E },
		healthWarning = { fg = C.base0D },
		-- misc

		-- glyphs
		GlyphPalette1 = { fg = C.base0B },
		GlyphPalette2 = { fg = C.base0E },
		GlyphPalette3 = { fg = C.base0D },
		GlyphPalette4 = { fg = C.base0A },
		GlyphPalette6 = { fg = C.base0E },
		GlyphPalette7 = { fg = C.base07 },
		GlyphPalette9 = { fg = C.base0B },
	}

	return syntax
end

M.setEditor = function()
	local editor = {
		ColorColumn = { bg = C.base05 }, -- used for the columns set with 'colorcolumn'
		Conceal = { fg = C.base0A }, -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor = { fg = C.base01, bg = C.base07 }, -- character under the cursor
		lCursor = { fg = C.base01, bg = C.base07 }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
		CursorIM = { fg = C.base01, bg = C.base07 }, -- like Cursor, but used when in IME mode |CursorIM|
		CursorColumn = { bg = C.base00 }, -- Screen-column at the cursor, when 'cursorcolumn' is secp.
		CursorLine = { bg = C.CursorLineBg or C.base02 }, -- Screen-line at the cursor, when 'cursorline' is secp.  Low-priority if foreground (ctermfg OR guifg) is not secp.
		Directory = { fg = C.base0A }, -- directory names (and other special names in listings)
		EndOfBuffer = { fg = C.base01 }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
		ErrorMsg = { fg = C.base0B, style = "bold,italic" }, -- error messages on the command line
		VertSplit = { fg = C.base00 }, -- the column separating vertically split windows
		Folded = { fg = C.base0A, bg = C.base03 }, -- line used for closed folds
		FoldColumn = { bg = C.base01, fg = C.base04 }, -- 'foldcolumn'
		SignColumn = { fg = C.base03 }, -- column where |signs| are displayed
		SignColumnSB = { bg = C.base00, fg = C.base03 }, -- column where |signs| are displayed
		Substitute = { bg = C.base03, fg = C.base08 }, -- |:substitute| replacement text highlighting
		LineNr = { fg = C.base03 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is secp.
		CursorLineNr = { fg = C.CursorLineNr or C.base09 }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line. highlights the number in numberline.
		MatchParen = { fg = C.base0C, bg = C.base03, style = "bold" }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg = { fg = C.base07, style = "bold" }, -- 'showmode' message (e.g., "-- INSERT -- ")
		MsgArea = { fg = C.base07 }, -- Area for messages and cmdline
		MsgSeparator = {}, -- Separator for scrolled messages, `msgsep` flag of 'display'
		MoreMsg = { fg = C.base0A }, -- |more-prompt|
		NonText = { fg = C.base04 }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal = { fg = C.base07, bg = C.base01 }, -- normal text
		NormalNC = { fg = C.base07, bg = C.base01 }, -- normal text in non-current windows
		NormalSB = { fg = C.base07, bg = C.base00 }, -- normal text in non-current windows
		NormalFloat = { fg = C.base07, bg = C.base00 }, -- Normal text in floating windows.
		FloatBorder = { fg = C.base0A },
		Pmenu = { fg = C.base06, bg = C.base02 }, -- Popup menu: normal item.
		PmenuSel = { fg = C.base09, bg = C.base03, style = "bold" }, -- Popup menu: selected item.
		PmenuSbar = { bg = C.base03 }, -- Popup menu: scrollbar.
		PmenuThumb = { bg = C.base04 }, -- Popup menu: Thumb of the scrollbar.
		Question = { fg = C.base0A }, -- |hit-enter| prompt and yes/no questions
		QuickFixLine = { bg = C.base03, style = "bold" }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search = { bg = C.base03, fg = C.base08, style = "bold" }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand oucp.
		IncSearch = { bg = C.base08, fg = C.base03 }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		SpecialKey = { fg = C.base07 }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
		SpellBad = { sp = C.base0B, style = "undercurl" }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap = { sp = C.base0D, style = "undercurl" }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal = { sp = C.base0A, style = "undercurl" }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare = { sp = C.base0E, style = "undercurl" }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		StatusLine = { fg = C.base07, bg = C.base00 }, -- status line of current window
		StatusLineNC = { fg = C.base03, bg = C.base00 }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		TabLine = { bg = C.base00, fg = C.base03 }, -- tab pages line, not active tab page label
		TabLineFill = { bg = C.base00 }, -- tab pages line, where there are no labels
		TabLineSel = { fg = C.base0E, bg = C.base03 }, -- tab pages line, active tab page label
		Title = { fg = C.base0A, style = "bold" }, -- titles for output from ":set all", ":autocmd" etcp.
		Visual = { bg = C.base03, style = "bold" }, -- Visual mode selection
		VisualNOS = { bg = C.base03, style = "bold" }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg = { fg = C.base0D }, -- warning messages
		Whitespace = { fg = C.base03 }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		WildMenu = { bg = C.base04 }, -- current match in 'wildmenu' completion
		-- These groups are not listed as default vim groups,
		-- but they are defacto standard group names for syntax highlighting.
		-- gray0ed out groups should chain up to their "preferred" group by
		-- default,
		-- Ungray0 and edit if you want more specific syntax highlighting.
	}

	return editor
end

M.setLsp = function()
	local lsp = {
		LspDiagnosticsDefaultError = { fg = C.base0B }, -- used for "Error" diagnostic virtual text
		LspDiagnosticsSignError = { fg = C.base0B }, -- used for "Error" diagnostic signs in sign column
		LspDiagnosticsFloatingError = { fg = C.base0B }, -- used for "Error" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextError = { fg = C.base0B }, -- Virtual text "Error"
		LspDiagnosticsUnderlineError = { style = "undercurl", sp = C.base0B }, -- used to underline "Error" diagnostics.
		LspDiagnosticsDefaultWarning = { fg = C.base0D }, -- used for "Warning" diagnostic signs in sign column
		LspDiagnosticsSignWarning = { fg = C.base0D }, -- used for "Warning" diagnostic signs in sign column
		LspDiagnosticsFloatingWarning = { fg = C.base0D }, -- used for "Warning" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextWarning = { fg = C.base0D }, -- Virtual text "Warning"
		LspDiagnosticsUnderlineWarning = { style = "undercurl", sp = C.base0D }, -- used to underline "Warning" diagnostics.
		LspDiagnosticsDefaultInformation = { fg = C.base0A }, -- used for "Information" diagnostic virtual text
		LspDiagnosticsSignInformation = { fg = C.base0A }, -- used for "Information" diagnostic signs in sign column
		LspDiagnosticsFloatingInformation = { fg = C.base0A }, -- used for "Information" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextInformation = { fg = C.base0A }, -- Virtual text "Information"
		LspDiagnosticsUnderlineInformation = { style = "undercurl", sp = C.base0A }, -- used to underline "Information" diagnostics.
		LspDiagnosticsDefaultHint = { fg = C.base0E }, -- used for "Hint" diagnostic virtual text
		LspDiagnosticsSignHint = { fg = C.base0E }, -- used for "Hint" diagnostic signs in sign column
		LspDiagnosticsFloatingHint = { fg = C.base0E }, -- used for "Hint" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextHint = { fg = C.base0E }, -- Virtual text "Hint"
		LspDiagnosticsUnderlineHint = { style = "undercurl", sp = C.base0A }, -- used to underline "Hint" diagnostics.
		LspReferenceText = { bg = C.base00 }, -- used for highlighting "text" references
		LspReferenceRead = { bg = C.base00 }, -- used for highlighting "read" references
		LspReferenceWrite = { bg = C.base00 }, -- used for highlighting "write" references

		DiagnosticError = { link = "LspDiagnosticsDefaultError" },
		DiagnosticWarn = { link = "LspDiagnosticsDefaultWarning" },
		DiagnosticInfo = { link = "LspDiagnosticsDefaultInformation" },
		DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },
		DiagnosticVirtualTextWarn = { link = "LspDiagnosticsVirtualTextWarning" },
		DiagnosticUnderlineWarn = { link = "LspDiagnosticsUnderlineWarning" },
		DiagnosticFloatingWarn = { link = "LspDiagnosticsFloatingWarning" },
		DiagnosticSignWarn = { link = "LspDiagnosticsSignWarning" },
		DiagnosticVirtualTextError = { link = "LspDiagnosticsVirtualTextError" },
		DiagnosticUnderlineError = { link = "LspDiagnosticsUnderlineError" },
		DiagnosticFloatingError = { link = "LspDiagnosticsFloatingError" },
		DiagnosticSignError = { link = "LspDiagnosticsSignError" },
		DiagnosticVirtualTextInfo = { link = "LspDiagnosticsVirtualTextInformation" },
		DiagnosticUnderlineInfo = { link = "LspDiagnosticsUnderlineInformation" },
		DiagnosticFloatingInfo = { link = "LspDiagnosticsFloatingInformation" },
		DiagnosticSignInfo = { link = "LspDiagnosticsSignInformation" },
		DiagnosticVirtualTextHint = { link = "LspDiagnosticsVirtualTextHint" },
		DiagnosticUnderlineHint = { link = "LspDiagnosticsUnderlineHint" },
		DiagnosticFloatingHint = { link = "LspDiagnosticsFloatingHint" },
		DiagnosticSignHint = { link = "LspDiagnosticsSignHint" },
	}
	return lsp
end

M.setTerminal = function()
	if vim.fn.has("nvim") then
		vim.g.terminal_color_0 = "#" .. C.base01
		vim.g.terminal_color_1 = "#" .. C.base0B
		vim.g.terminal_color_2 = "#" .. C.base0E
		vim.g.terminal_color_3 = "#" .. C.base0D
		vim.g.terminal_color_4 = "#" .. C.base09
		vim.g.terminal_color_5 = "#" .. C.base0F
		vim.g.terminal_color_6 = "#" .. C.base08
		vim.g.terminal_color_7 = "#" .. C.base05
		vim.g.terminal_color_8 = "#" .. C.base03
		vim.g.terminal_color_9 = "#" .. C.base0B
		vim.g.terminal_color_10 = "#" .. C.base0E
		vim.g.terminal_color_11 = "#" .. C.base0D
		vim.g.terminal_color_12 = "#" .. C.base09
		vim.g.terminal_color_13 = "#" .. C.base0F
		vim.g.terminal_color_14 = "#" .. C.base07
		vim.g.terminal_color_15 = "#" .. C.base01
		if vim.o.background == "light" then
			vim.g.terminal_color_background = "#" .. C.base01
		else
			vim.g.terminal_color_background = "#" .. C.base00
		end
	end
end

M.setTreesitter = function()
	local treesitter = {
		TSField = { fg = C.base08 }, -- For fields.
		TSProperty = { fg = C.base0D, style = "italic" }, -- Same as TSField.
		TSInclude = { fg = C.base0E, style = "italic" }, -- For includes: #include in C, use or extern crate in Rust, or require in Lua.
		TSOperator = { fg = C.base0A, style = "bold" }, -- For any operator: +, but also -> and * in cp.
		TSKeywordOperator = { fg = C.base0A, style = "bold" }, -- For new keyword operator
		TSPunctSpecial = { fg = C.base0B, style = "bold" }, -- For special punctutation that does not fall in the catagories before.

		TSFloat = { fg = C.base0C, style = "bold,italic" }, -- For floats.
		TSNumber = { fg = C.base0C, style = "bold,italic" }, -- For all numbers
		TSBoolean = { fg = C.base0C, style = "bold,italic" }, -- For booleans.

		TSConstructor = { fg = C.base06 }, -- For constructor calls and definitions: = { } in Lua, and Java constructors.
		TSConstant = { fg = C.base0C }, -- For constants
		TSConditional = { fg = C.base0F, style = "bold" }, -- For keywords related to conditionnals.
		TSRepeat = { fg = C.base0F, style = "bold" }, -- For keywords related to loops.
		TSException = { fg = C.base0C }, -- For exception related keywords.

		-- builtin
		TSConstBuiltin = { fg = C.base06 }, -- For constant that are built in the language: nil in Lua.
		TSFuncBuiltin = { fg = C.base0C, style = "italic" }, -- For builtin functions: table.insert in Lua.
		TSTypeBuiltin = { fg = C.base0D, style = "italic" }, -- For builtin types.
		TSVariableBuiltin = { fg = C.base0E, style = "italic" }, -- Variable names that are defined by the languages, like this or self.

		TSFunction = { fg = C.base0A }, -- For function (calls and definitions).
		TSFuncMacro = { fg = C.base0B }, -- For macro defined functions (calls and definitions): each macro_rules in Ruscp.
		TSParameter = { fg = C.base08, style = "italic" }, -- For parameters of a function.
		TSKeywordFunction = { fg = C.base0B }, -- For keywords used to define a fuction.
		TSKeyword = { fg = C.base0A }, -- For keywords that don't fall in previous categories.
		TSKeywordReturn = { fg = C.base09 },
		-- TSAnnotation        = { };    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
		-- TSAttribute         = { };    -- (unstable) TODO: docs
		-- TSCharacter         = { };    -- For characters.
		-- TSgray0           = { };    -- For gray0 blocks.
		TSNote = { fg = C.base01, bg = C.base0A },
		TSWarning = { fg = C.base01, bg = C.base0D },
		TSDanger = { fg = C.base01, bg = C.base0B },
		-- TSConstMacro        = { };    -- For constants that are defined by macros: NULL in cp.
		-- TSError = { fg = cp.red }, -- For syntax/parser errors.
		-- rustTSField = { fg = cp.black4 }, -- For fields.
		TSLabel = { fg = C.base0A }, -- For labels: label: in C and :label: in Lua.
		TSMethod = { fg = C.base0A, style = "italic" }, -- For method calls and definitions.
		TSNamespace = { fg = C.base08, style = "italic" }, -- For identifiers referring to modules and namespaces.
		-- TSNone              = { };    -- TODO: docs
		-- TSParameterReference= { };    -- For references to parameters of a function.
		tomlTSProperty = { fg = C.base0A }, -- Differentiates between string and properties
		TSPunctDelimiter = { fg = C.base0E }, -- For delimiters ie: .
		TSPunctBracket = { fg = C.base05 }, -- For brackets and parenthesis.
		TSString = { fg = C.base0E }, -- For strings.
		TSStringRegex = { fg = C.base0C }, -- For regexes.
		-- TSSymbol            = { };    -- For identifiers referring to symbols or atoms.
		TSType = { fg = C.base0D }, -- For types.
		TSVariable = { fg = C.base07 }, -- Any variable name that does not have another highlighcp.
		TSTagAttribute = { fg = C.base0F, style = "italic" }, -- Tags like html tag names.
		TSTag = { fg = C.base0C }, -- Tags like html tag names.
		TSTagDelimiter = { fg = C.base0B }, -- Tag delimiter like < > /
		TSText = { fg = C.base07 }, -- For strings considerated text in a markup language.
		-- TSEmphasis          = { };    -- For text to be represented with emphasis.
		-- TSUnderline         = { };    -- For text to be represented with an underline.
		-- TSStrike            = { };    -- For strikethrough texcp.
		-- TSTitle             = { };    -- Text that is part of a title.
		-- TSLiteral           = { };    -- Literal texcp.
		-- TSURI               = { };    -- Any URI like a link or email.

		-- Markdown tresitter parser support
		TSURI = { fg = C.base08, style = "italic,underline" }, -- urls, links and emails
		TSLiteral = { fg = C.base0E, style = "italic" }, -- used for inline code in markdown and for doc in python (""")
		TSTextReference = { fg = C.base06, style = "bold" }, -- references
		TSTitle = { fg = C.base0A, style = "bold" }, -- titles like: # Example
		TSEmphasis = { fg = C.base0B, style = "italic" }, -- bold
		TSStrong = { fg = C.base0B, style = "bold" }, -- italic
		TSStringEscape = { fg = C.base09 }, -- For escape characters within a string.

		-- bash
		bashTSFuncBuiltin = { fg = C.base0B, style = "italic" },
		bashTSParameter = { fg = C.base0D, style = "italic" },

		-- lua
		luaTSField = { fg = C.base06 },
		luaTSConstructor = { fg = C.base08 }, -- For constructor calls and definitions: = { } in Lua, and Java constructors.

		-- java
		javaTSConstant = { fg = C.base0E },

		-- typescript
		typescriptTSProperty = { fg = C.base06, style = "italic" }, -- Same as TSField.

		-- css
		cssTSType = { fg = C.base06 },
		cssTSProperty = { fg = C.base0D, style = "italic" }, -- Same as TSField.
	}

	if #defaults.italic > 0 then
		for _, name in ipairs(defaults.italic) do
			treesitter[name] = { style = "italic" }
		end
	end

	if #defaults.bold > 0 then
		for _, name in ipairs(defaults.bold) do
			treesitter[name] = { style = "bold" }
		end
	end

	return treesitter
end

M.setPlugins = function()
	local plugins = {

		-- NvimTree
		NvimTreeFolderName = { fg = C.NvimTreeFolder or C.NvimTreeFolderName or C.base0A },
		NvimTreeFolderIcon = { fg = C.NvimTreeFolder or C.NvimTreeFolderIcon or C.base0A },
		NvimTreeNormal = { fg = C.base07, bg = C.NvimTreeNormalBg or C.base00 },
		NvimTreeOpenedFolderName = { fg = C.NvimTreeFolder or C.NvimTreeOpenedFolderName or C.base0A },
		NvimTreeEmptyFolderName = { fg = C.NvimTreeFolder or C.NvimTreeEmptyFolderName or C.base0A },
		NvimTreeIndentMarker = { fg = C.base03 },
		NvimTreeVertSplit = { fg = C.base00, bg = C.base00 },
		NvimTreeRootFolder = { fg = C.base0A, style = "bold" },
		NvimTreeSymlink = { fg = C.base09 },
		NvimTreeStatuslineNc = { fg = C.base00, bg = C.base00 },
		NvimTreeGitDirty = { fg = C.base0D },
		NvimTreeGitNew = { fg = C.base0A },
		NvimTreeGitDeleted = { fg = C.base0B },
		NvimTreeSpecialFile = { fg = C.base08 },
		NvimTreeImageFile = { fg = C.base07 },
		NvimTreeOpenedFile = { fg = C.base09 },

		-- Bufferline
		BufferLineFill = { bg = C.base02 },
		BufferLineBackground = { fg = C.base04, bg = C.base02 }, -- others
		BufferLineDuplicate = { fg = C.base04, bg = C.base02 }, -- others
		BufferLineModified = { fg = C.base09, bg = C.base02 }, -- others
		BufferLineModifiedSelected = { fg = C.base09, bg = C.base01 }, -- others
		BufferLineBufferVisible = { fg = C.base06, bg = C.base03 },
		BufferLineBufferSelected = { fg = C.base09, bg = C.base01, style = "bold,italic" }, -- current
		BufferLineTab = { fg = C.base03, bg = C.base01 },
		BufferLineTabSelected = { fg = C.base0B, bg = C.base0A },
		BufferLineTabClose = { fg = C.base0B, bg = C.base00 },
		BufferLineIndicatorSelected = { fg = C.base01, bg = C.base01 },
		-- separators
		BufferLineSeparator = { fg = C.base00, bg = C.base00 },
		BufferLineSeparatorVisible = { fg = C.base00, bg = C.base00 },
		BufferLineSeparatorSelected = { fg = C.base00, bg = C.base00 },
		-- close buttons
		BufferLineCloseButton = { fg = C.base04, bg = C.base02 },
		BufferLineCloseButtonVisible = { fg = C.base06, bg = C.base03 },
		BufferLineCloseButtonSelected = { fg = C.base0B, bg = C.base01 },
		-- diagnostics
		BufferLineHint = { fg = C.base04, bg = C.base02 }, -- others
		BufferLineHintVisible = { fg = C.base04, bg = C.base03 }, -- others
		BufferLineHintDiagnostic = { fg = C.base04, bg = C.base02 }, -- others
		BufferLineHintDiagnosticVisible = { fg = C.base04, bg = C.base03 }, -- others
		BufferLineInfo = { fg = C.base04, bg = C.base02 }, -- others
		BufferLineInfoVisible = { fg = C.base04, bg = C.base03 }, -- others
		BufferLineInfoDiagnostic = { fg = C.base04, bg = C.base02 }, -- others
		BufferLineInfoDiagnosticVisible = { fg = C.base04, bg = C.base03 }, -- others
		BufferLineWarning = { fg = C.base04, bg = C.base03 }, -- others
		BufferLineWarningVisible = { fg = C.base04, bg = C.base03 }, -- others
		BufferLineWarningDiagnostic = { fg = C.base04, bg = C.base02 }, -- others
		BufferLineWarningDiagnosticVisible = { fg = C.base04, bg = C.base03 }, -- others
		BufferLineError = { fg = C.base0B, bg = C.base02 }, -- others
		BufferLineErrorVisible = { fg = C.base04, bg = C.base03 }, -- others
		BufferLineErrorDiagnostic = { fg = C.base04, bg = C.base02 }, -- others
		BufferLineErrorDiagnosticVisible = { fg = C.base04, bg = C.base03 }, -- others

		-- WhichKey
		WhichKey = { fg = C.base08 },
		WhichKeyGroup = { fg = C.base0A },
		WhichKeyDesc = { fg = C.base09 },
		WhichKeySeperator = { fg = C.base04 },
		WhichKeySeparator = { fg = C.base04 },
		WhichKeyFloat = { bg = C.base00 },
		WhichKeyValue = { fg = C.base04 },

		-- Cmp
		CmpItemAbbr = { fg = C.base06 },
		CmpItemAbbrDeprecated = { fg = C.base04, stlye = "strikethrough" },
		CmpItemKind = { fg = C.base0A },
		CmpItemMenu = { fg = C.base07 },
		CmpItemAbbrMatch = { fg = C.base07, style = "bold" },
		CmpItemAbbrMatchFuzzy = { fg = C.base07, style = "bold" },
		-- kind support
		CmpItemKindSnippet = { fg = C.base0F },
		CmpItemKindKeyword = { fg = C.base0B },
		CmpItemKindText = { fg = C.base0E },
		CmpItemKindMethod = { fg = C.base0A },
		CmpItemKindConstructor = { fg = C.base0A },
		CmpItemKindFunction = { fg = C.base0A },
		CmpItemKindFolder = { fg = C.base0A },
		CmpItemKindModule = { fg = C.base0A },
		CmpItemKindConstant = { fg = C.base0C },
		CmpItemKindField = { fg = C.base0E },
		CmpItemKindProperty = { fg = C.base0E },
		CmpItemKindEnum = { fg = C.base0E },
		CmpItemKindUnit = { fg = C.base0E },
		CmpItemKindClass = { fg = C.base0D },
		CmpItemKindVariable = { fg = C.base08 },
		CmpItemKindFile = { fg = C.base0A },
		CmpItemKindInterface = { fg = C.base0D },
		CmpItemKindColor = { fg = C.base0B },
		CmpItemKindReference = { fg = C.base0B },
		CmpItemKindEnumMember = { fg = C.base0B },
		CmpItemKindStruct = { fg = C.base0A },
		CmpItemKindValue = { fg = C.base0C },
		CmpItemKindEvent = { fg = C.base0A },
		CmpItemKindOperator = { fg = C.base0A },
		CmpItemKindTypeParameter = { fg = C.base0A },

		-- Telescope
		TelescopeBorder = { fg = C.base0A },
		TelescopeSelectionCaret = { fg = C.base08 },
		TelescopeSelection = { fg = C.base07, bg = C.base02, style = "bold" },
		TelescopeMatching = { fg = C.base0A },

		-- Gitsigns
		GitSignsAdd = { fg = C.base0E, bg = C.base01 }, -- diff mode: Added line |diff.txt|
		GitSignsChange = { fg = C.base0D, bg = C.base01 }, -- diff mode: Changed line |diff.txt|
		GitSignsDelete = { fg = C.base0B, bg = C.base01 }, -- diff mode: Deleted line |diff.txt|

		-- Indent Blankline
		IndentBlanklineChar = { fg = C.base03 },
		IndentBlanklineContextChar = { fg = C.base07 },
	}
	return plugins
end

return M

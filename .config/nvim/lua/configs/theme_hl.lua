local util = require("configs.theme_utils")

local M = {}
--
---@class Highlight
---@field fg string|nil
---@field bg string|nil
---@field sp string|nil
---@field style string|nil|Highlight
---@field link string|nil

---@alias Highlights table<string,Highlight>
function M.setup(options, colors)
	local theme = {
		config = options,
		colors = colors,
	}

	local c = theme.colors

	theme.highlights = {
		Foo = { bg = c.light_magenta, fg = c.fg },

		Comment = { fg = c.light_white, style = options.styles.comments }, -- any comment
		ColorColumn = { bg = c.black }, -- used for the columns set with 'colorcolumn'
		Conceal = { fg = c.light_black }, -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor = { fg = c.bg, bg = c.fg }, -- character under the cursor
		lCursor = { fg = c.bg, bg = c.fg }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
		CursorIM = { fg = c.bg, bg = c.fg }, -- like Cursor, but used when in IME mode |CursorIM|
		CursorColumn = { bg = c.highlight }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine = { bg = c.highlight }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
		Directory = { fg = c.blue }, -- directory names (and other special names in listings)
		DiffAdd = { bg = c.light_green }, -- diff mode: Added line |diff.txt|
		DiffChange = { bg = c.light_blue }, -- diff mode: Changed line |diff.txt|
		DiffDelete = { bg = c.light_red }, -- diff mode: Deleted line |diff.txt|
		DiffText = { bg = c.blue }, -- diff mode: Changed text within a changed line |diff.txt|
		EndOfBuffer = { fg = c.bg }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
		-- TermCursor  = { }, -- cursor in a focused terminal
		-- TermCursorNC= { }, -- cursor in an unfocused terminal
		ErrorMsg = { fg = c.red }, -- error messages on the command line
		VertSplit = { fg = c.border }, -- the column separating vertically split windows
		WinSeparator = { fg = c.border, bold = true }, -- the column separating vertically split windows
		Folded = { fg = c.blue, bg = c.highlight }, -- line used for closed folds
		FoldColumn = { bg = options.transparent and c.none or c.bg, fg = c.light_white }, -- 'foldcolumn'
		SignColumn = { bg = options.transparent and c.none or c.bg, fg = c.highlight }, -- column where |signs| are displayed
		SignColumnSB = { bg = c.highlight, fg = c.highlight }, -- column where |signs| are displayed
		Substitute = { bg = c.red, fg = c.black }, -- |:substitute| replacement text highlighting
		LineNr = { fg = c.highlight }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		CursorLineNr = { fg = c.light_black }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		MatchParen = { fg = c.yellow, bold = true }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg = { fg = c.fg, bold = true }, -- 'showmode' message (e.g., "-- INSERT -- ")
		MsgArea = { fg = c.fg }, -- Area for messages and cmdline
		-- MsgSeparator= { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		MoreMsg = { fg = c.blue }, -- |more-prompt|
		NonText = { fg = c.highlight }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal = { fg = c.fg, bg = options.transparent and c.none or c.bg }, -- normal text
		NormalNC = { fg = c.fg, bg = options.transparent and c.none or options.dim_inactive and c.bg or c.bg }, -- normal text in non-current windows
		NormalSB = { fg = c.fg, bg = c.highlight }, -- normal text in sidebar
		NormalFloat = { fg = c.fg_float, bg = c.highlight }, -- Normal text in floating windows.
		FloatBorder = { fg = c.fg, bg = c.highlight },
		FloatTitle = { fg = c.fg, bg = c.highlight },
		Pmenu = { bg = c.bg_popup, fg = c.fg }, -- Popup menu: normal item.
		PmenuSel = { bg = util.darken(c.highlight, 0.8) }, -- Popup menu: selected item.
		PmenuSbar = { bg = util.lighten(c.highlight, 0.95) }, -- Popup menu: scrollbar.
		PmenuThumb = { bg = c.highlight }, -- Popup menu: Thumb of the scrollbar.
		Question = { fg = c.blue }, -- |hit-enter| prompt and yes/no questions
		QuickFixLine = { bg = c.bg, bold = true }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search = { bg = c.bg_search, fg = c.fg }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
		IncSearch = { bg = c.yellow, fg = c.black }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		CurSearch = { link = "IncSearch" },
		SpecialKey = { fg = c.highlight }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
		SpellBad = { sp = c.red, undercurl = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap = { sp = c.yellow, undercurl = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal = { sp = c.white, undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare = { sp = c.green, undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		StatusLine = { fg = c.fg, bg = c.light_black }, -- status line of current window
		StatusLineNC = { fg = c.highlight, bg = c.light_black }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		TabLine = { bg = c.light_black, fg = c.highlight }, -- tab pages line, not active tab page label
		TabLineFill = { bg = c.black }, -- tab pages line, where there are no labels
		TabLineSel = { fg = c.black, bg = c.blue }, -- tab pages line, active tab page label
		Title = { fg = c.blue, bold = true }, -- titles for output from ":set all", ":autocmd" etc.
		Visual = { bg = c.bg }, -- Visual mode selection
		VisualNOS = { bg = c.bg }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg = { fg = c.yellow }, -- warning messages
		Whitespace = { fg = c.highlight }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		WildMenu = { bg = c.bg }, -- current match in 'wildmenu' completion

		-- These groups are not listed as default vim groups,
		-- but they are defacto standard group names for syntax highlighting.
		-- commented out groups should chain up to their "preferred" group by
		-- default,
		-- Uncomment and edit if you want more specific syntax highlighting.

		Constant = { fg = c.yellow }, -- (preferred) any constant
		String = { fg = c.green }, --   a string constant: "this is a string"
		Character = { fg = c.green }, --  a character constant: 'c', '\n'
		-- Number        = { }, --   a number constant: 234, 0xff
		-- Boolean       = { }, --  a boolean constant: TRUE, false
		-- Float         = { }, --    a floating point constant: 2.3e10

		Identifier = { fg = c.magenta, style = options.styles.variables }, -- (preferred) any variable name
		Function = { fg = c.blue, style = options.styles.functions }, -- function name (also: methods for classes)

		Statement = { fg = c.magenta }, -- (preferred) any statement
		-- Conditional   = { }, --  if, then, else, endif, switch, etc.
		-- Repeat        = { }, --   for, do, while, etc.
		-- Label         = { }, --    case, default, etc.
		Operator = { fg = c.blue }, -- "sizeof", "+", "*", etc.
		Keyword = { fg = c.cyan, style = options.styles.keywords }, --  any other keyword
		-- Exception     = { }, --  try, catch, throw

		PreProc = { fg = c.cyan }, -- (preferred) generic Preprocessor
		-- Include       = { }, --  preprocessor #include
		-- Define        = { }, --   preprocessor #define
		-- Macro         = { }, --    same as Define
		-- PreCondit     = { }, --  preprocessor #if, #else, #endif, etc.

		Type = { fg = c.blue }, -- (preferred) int, long, char, etc.
		-- StorageClass  = { }, -- static, register, volatile, etc.
		-- Structure     = { }, --  struct, union, enum, etc.
		-- Typedef       = { }, --  A typedef

		Special = { fg = c.blue }, -- (preferred) any special symbol
		-- SpecialChar   = { }, --  special character in a constant
		-- Tag           = { }, --    you can use CTRL-] on this
		-- Delimiter     = { }, --  character that needs attention
		-- SpecialComment= { }, -- special things inside a comment
		Debug = { fg = c.yellow }, --    debugging statements

		Underlined = { underline = true }, -- (preferred) text that stands out, HTML links
		Bold = { bold = true },
		Italic = { italic = true },

		-- ("Ignore", below, may be invisible...)
		-- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

		Error = { fg = c.red }, -- (preferred) any erroneous construct
		Todo = { bg = c.light_yellow, fg = c.bg }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		qfLineNr = { fg = c.light_black },
		qfFileName = { fg = c.blue },

		htmlH1 = { fg = c.magenta, bold = true },
		htmlH2 = { fg = c.blue, bold = true },

		-- mkdHeading = { fg = c.yellow, bold = true },
		-- mkdCode = { bg = c.light_black, fg = c.fg },
		mkdCodeDelimiter = { bg = c.light_black, fg = c.fg },
		mkdCodeStart = { fg = c.light_cyan, bold = true },
		mkdCodeEnd = { fg = c.light_cyan, bold = true },
		-- mkdLink = { fg = c.blue, underline = true },

		markdownHeadingDelimiter = { fg = c.yellow, bold = true },
		markdownCode = { fg = c.light_cyan },
		markdownCodeBlock = { fg = c.light_cyan },
		markdownH1 = { fg = c.magenta, bold = true },
		markdownH2 = { fg = c.blue, bold = true },
		markdownLinkText = { fg = c.blue, underline = true },

		["helpCommand"] = { bg = c.light_black, fg = c.blue },

		debugPC = { bg = c.highlight }, -- used for highlighting the current line in terminal-debug
		debugBreakpoint = { bg = util.darken(c.white, 0.1), fg = c.info }, -- used for breakpoint colors in terminal-debug

		dosIniLabel = { link = "@property" },

		-- These groups are for the native LSP client. Some other LSP clients may
		-- use these groups, or use their own. Consult your LSP client's
		-- documentation.
		LspReferenceText = { bg = c.highlight }, -- used for highlighting "text" references
		LspReferenceRead = { bg = c.highlight }, -- used for highlighting "read" references
		LspReferenceWrite = { bg = c.highlight }, -- used for highlighting "write" references

		DiagnosticError = { fg = c.red }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticWarn = { fg = c.yellow }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticInfo = { fg = c.white }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticHint = { fg = c.green }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticUnnecessary = { fg = c.light_black }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

		DiagnosticVirtualTextError = { bg = util.darken(c.red, 0.1), fg = c.red }, -- Used for "Error" diagnostic virtual text
		DiagnosticVirtualTextWarn = { bg = util.darken(c.yellow, 0.1), fg = c.yellow }, -- Used for "Warning" diagnostic virtual text
		DiagnosticVirtualTextInfo = { bg = util.darken(c.white, 0.1), fg = c.info }, -- Used for "Information" diagnostic virtual text
		DiagnosticVirtualTextHint = { bg = util.darken(c.green, 0.1), fg = c.green }, -- Used for "Hint" diagnostic virtual text

		DiagnosticUnderlineError = { undercurl = true, sp = c.red }, -- Used to underline "Error" diagnostics
		DiagnosticUnderlineWarn = { undercurl = true, sp = c.yellow }, -- Used to underline "Warning" diagnostics
		DiagnosticUnderlineInfo = { undercurl = true, sp = c.white }, -- Used to underline "Information" diagnostics
		DiagnosticUnderlineHint = { undercurl = true, sp = c.green }, -- Used to underline "Hint" diagnostics

		LspSignatureActiveParameter = { bg = util.darken(c.bg, 0.4), bold = true },
		LspCodeLens = { fg = c.light_white },
		LspInlayHint = { bg = util.darken(c.blue, 0.1), fg = c.highlight },

		LspInfoBorder = { fg = c.fg, bg = c.highlight },

		ALEErrorSign = { fg = c.red },
		ALEWarningSign = { fg = c.yellow },

		DapStoppedLine = { bg = util.darken(c.yellow, 0.1) }, -- Used for "Warning" diagnostic virtual text

		-- These groups are for the Neovim tree-sitter highlights.
		-- As of writing, tree-sitter support is a WIP, group names may change.

		--- Misc
		-- TODO:
		-- ["@comment.documentation"] = { },
		["@operator"] = { fg = c.blue }, -- For any operator: `+`, but also `->` and `*` in C.

		--- Punctuation
		["@punctuation.delimiter"] = { fg = c.blue }, -- For delimiters ie: `.`
		["@punctuation.bracket"] = { fg = c.fg }, -- For brackets and parens.
		["@punctuation.special"] = { fg = c.blue }, -- For special punctutation that does not fall in the catagories before.
		["@punctuation.special.markdown"] = { fg = c.yellow, bold = true },

		--- Literals
		["@string.documentation"] = { fg = c.light_yellow },
		["@string.regex"] = { fg = c.blue6 }, -- For regexes.
		["@string.escape"] = { fg = c.magenta }, -- For escape characters within a string.

		--- Functions
		["@constructor"] = { fg = c.magenta }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
		["@parameter"] = { fg = c.light_yellow }, -- For parameters of a function.
		["@parameter.builtin"] = { fg = util.lighten(c.light_yellow, 0.8) }, -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]

		--- Keywords
		["@keyword"] = { fg = c.magenta, style = options.styles.keywords }, -- For keywords that don't fall in previous categories.
		-- TODO:
		-- ["@keyword.coroutine"] = { }, -- For keywords related to coroutines.
		["@keyword.function"] = { fg = c.magenta, style = options.styles.functions }, -- For keywords used to define a fuction.

		["@label"] = { fg = c.blue }, -- For labels: `label:` in C and `:label:` in Lua.

		--- Types
		["@type.builtin"] = { fg = util.darken(c.blue, 0.8) },
		["@field"] = { fg = c.light_green }, -- For fields.
		["@property"] = { fg = c.light_green },

		--- Identifiers
		["@variable"] = { fg = c.fg, style = options.styles.variables }, -- Any variable name that does not have another highlight.
		["@variable.builtin"] = { fg = c.red }, -- Variable names that are defined by the languages, like `this` or `self`.
		["@namespace.builtin"] = { fg = c.red }, -- Variable names that are defined by the languages, like `this` or `self`.

		--- Text
		-- ["@text.literal.markdown"] = { fg = c.blue },
		["@text.literal.markdown_inline"] = { bg = c.light_black, fg = c.blue },
		["@text.reference"] = { fg = c.light_cyan },

		["@text.todo.unchecked"] = { fg = c.blue }, -- For brackets and parens.
		["@text.todo.checked"] = { fg = c.light_green }, -- For brackets and parens.
		["@text.warning"] = { fg = c.bg, bg = c.yellow },
		["@text.danger"] = { fg = c.bg, bg = c.red },

		["@text.diff.add"] = { link = "DiffAdd" },
		["@text.diff.delete"] = { link = "DiffDelete" },

		["@namespace"] = { link = "Include" },

		-- tsx
		["@tag.tsx"] = { fg = c.red },
		["@constructor.tsx"] = { fg = c.blue },
		["@tag.delimiter.tsx"] = { fg = util.darken(c.blue, 0.7) },

		-- LSP Semantic Token Groups
		["@lsp.type.boolean"] = { link = "@boolean" },
		["@lsp.type.builtinType"] = { link = "@type.builtin" },
		["@lsp.type.comment"] = { link = "@comment" },
		["@lsp.type.decorator"] = { link = "@attribute" },
		["@lsp.type.deriveHelper"] = { link = "@attribute" },
		["@lsp.type.enum"] = { link = "@type" },
		["@lsp.type.enumMember"] = { link = "@constant" },
		["@lsp.type.escapeSequence"] = { link = "@string.escape" },
		["@lsp.type.formatSpecifier"] = { link = "@punctuation.special" },
		["@lsp.type.generic"] = { link = "@variable" },
		["@lsp.type.interface"] = { fg = util.lighten(c.blue, 0.7) },
		["@lsp.type.keyword"] = { link = "@keyword" },
		["@lsp.type.lifetime"] = { link = "@storageclass" },
		["@lsp.type.namespace"] = { link = "@namespace" },
		["@lsp.type.number"] = { link = "@number" },
		["@lsp.type.operator"] = { link = "@operator" },
		["@lsp.type.parameter"] = { link = "@parameter" },
		["@lsp.type.property"] = { link = "@property" },
		["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
		["@lsp.type.selfTypeKeyword"] = { link = "@variable.builtin" },
		["@lsp.type.string"] = { link = "@string" },
		["@lsp.type.typeAlias"] = { link = "@type.definition" },
		["@lsp.type.unresolvedReference"] = { undercurl = true, sp = c.red },
		["@lsp.type.variable"] = {}, -- use treesitter styles for regular variables
		["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" },
		["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" },
		["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
		["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.keyword.async"] = { link = "@keyword.coroutine" },
		["@lsp.typemod.keyword.injected"] = { link = "@keyword" },
		["@lsp.typemod.macro.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.operator.injected"] = { link = "@operator" },
		["@lsp.typemod.string.injected"] = { link = "@string" },
		["@lsp.typemod.struct.defaultLibrary"] = { link = "@type.builtin" },
		["@lsp.typemod.type.defaultLibrary"] = { fg = util.darken(c.blue, 0.8) },
		["@lsp.typemod.typeAlias.defaultLibrary"] = { fg = util.darken(c.blue, 0.8) },
		["@lsp.typemod.variable.callable"] = { link = "@function" },
		["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
		["@lsp.typemod.variable.injected"] = { link = "@variable" },
		["@lsp.typemod.variable.static"] = { link = "@constant" },
		-- NOTE: maybe add these with distinct highlights?
		-- ["@lsp.typemod.variable.globalScope"] (global variables)

		-- ts-rainbow
		rainbowcol1 = { fg = c.red },
		rainbowcol2 = { fg = c.light_yellow },
		rainbowcol3 = { fg = c.green },
		rainbowcol4 = { fg = c.light_cyan },
		rainbowcol5 = { fg = c.blue },
		rainbowcol6 = { fg = c.magenta },
		rainbowcol7 = { fg = c.magenta },

		-- ts-rainbow2 (maintained fork)
		TSRainbowRed = { fg = c.red },
		TSRainbowOrange = { fg = c.yellow },
		TSRainbowYellow = { fg = c.light_yellow },
		TSRainbowGreen = { fg = c.green },
		TSRainbowBlue = { fg = c.blue },
		TSRainbowViolet = { fg = c.magenta },
		TSRainbowCyan = { fg = c.cyan },

		-- rainbow-delimiters
		RainbowDelimiterRed = { fg = c.red },
		RainbowDelimiterOrange = { fg = c.yellow },
		RainbowDelimiterYellow = { fg = c.light_yellow },
		RainbowDelimiterGreen = { fg = c.green },
		RainbowDelimiterBlue = { fg = c.blue },
		RainbowDelimiterViolet = { fg = c.magenta },
		RainbowDelimiterCyan = { fg = c.cyan },

		-- LspTrouble
		TroubleText = { fg = c.fg },
		TroubleCount = { fg = c.magenta, bg = c.highlight },
		TroubleNormal = { fg = c.fg, bg = c.highlight },

		-- Illuminate
		illuminatedWord = { bg = c.highlight },
		illuminatedCurWord = { bg = c.highlight },
		IlluminatedWordText = { bg = c.highlight },
		IlluminatedWordRead = { bg = c.highlight },
		IlluminatedWordWrite = { bg = c.highlight },

		-- diff
		diffAdded = { fg = c.light_green },
		diffRemoved = { fg = c.light_red },
		diffChanged = { fg = c.light_blue },
		diffOldFile = { fg = c.light_yellow },
		diffNewFile = { fg = c.yellow },
		diffFile = { fg = c.blue },
		diffLine = { fg = c.light_white },
		diffIndexLine = { fg = c.magenta },

		-- Neogit
		NeogitBranch = { fg = c.magenta },
		NeogitRemote = { fg = c.magenta },
		NeogitHunkHeader = { bg = c.highlight, fg = c.fg },
		NeogitHunkHeaderHighlight = { bg = c.highlight, fg = c.blue },
		NeogitDiffContextHighlight = { bg = util.darken(c.highlight, 0.5), fg = c.fg },
		NeogitDiffDeleteHighlight = { fg = c.light_red, bg = c.light_red },
		NeogitDiffAddHighlight = { fg = c.light_green, bg = c.light_green },

		-- Neotest
		NeotestPassed = { fg = c.green },
		NeotestRunning = { fg = c.light_yellow },
		NeotestFailed = { fg = c.red },
		NeotestSkipped = { fg = c.blue },
		NeotestTest = { fg = c.fg },
		NeotestNamespace = { fg = c.light_green },
		NeotestFocused = { fg = c.light_yellow },
		NeotestFile = { fg = c.light_cyan },
		NeotestDir = { fg = c.blue },
		NeotestBorder = { fg = c.blue },
		NeotestIndent = { fg = c.fg },
		NeotestExpandMarker = { fg = c.fg },
		NeotestAdapterName = { fg = c.magenta, bold = true },
		NeotestWinSelect = { fg = c.blue },
		NeotestMarked = { fg = c.blue },
		NeotestTarget = { fg = c.blue },
		--[[ NeotestUnknown = {}, ]]

		-- GitGutter
		GitGutterAdd = { fg = c.light_green }, -- diff mode: Added line |diff.txt|
		GitGutterChange = { fg = c.light_blue }, -- diff mode: Changed line |diff.txt|
		GitGutterDelete = { fg = c.light_red }, -- diff mode: Deleted line |diff.txt|
		GitGutterAddLineNr = { fg = c.light_green },
		GitGutterChangeLineNr = { fg = c.light_blue },
		GitGutterDeleteLineNr = { fg = c.light_red },

		-- GitSigns
		GitSignsAdd = { fg = c.light_green }, -- diff mode: Added line |diff.txt|
		GitSignsChange = { fg = c.light_blue }, -- diff mode: Changed line |diff.txt|
		GitSignsDelete = { fg = c.light_red }, -- diff mode: Deleted line |diff.txt|

		-- Telescope
		TelescopeBorder = { fg = c.fg, bg = c.highlight },
		TelescopeNormal = { fg = c.fg, bg = c.highlight },

		-- NvimTree
		NvimTreeNormal = { fg = c.fg, bg = c.highlight },
		NvimTreeWinSeparator = {
			fg = options.styles.sidebars == "transparent" and c.border or c.highlight,
			bg = c.highlight,
		},
		NvimTreeNormalNC = { fg = c.fg, bg = c.highlight },
		NvimTreeRootFolder = { fg = c.blue, bold = true },
		NvimTreeGitDirty = { fg = c.light_blue },
		NvimTreeGitNew = { fg = c.light_green },
		NvimTreeGitDeleted = { fg = c.light_red },
		NvimTreeOpenedFile = { bg = c.highlight },
		NvimTreeSpecialFile = { fg = c.magenta, underline = true },
		NvimTreeIndentMarker = { fg = c.highlight },
		NvimTreeImageFile = { fg = c.fg },
		NvimTreeSymlink = { fg = c.blue },
		NvimTreeFolderIcon = { bg = c.none, fg = c.blue },
		-- NvimTreeFolderName= { fg = c.fg_float },

		NeoTreeNormal = { fg = c.fg, bg = c.highlight },
		NeoTreeNormalNC = { fg = c.fg, bg = c.highlight },
		NeoTreeDimText = { fg = c.highlight },

		-- Fern
		FernBranchText = { fg = c.blue },

		-- glyph palette
		GlyphPalette1 = { fg = c.light_red },
		GlyphPalette2 = { fg = c.green },
		GlyphPalette3 = { fg = c.light_yellow },
		GlyphPalette4 = { fg = c.blue },
		GlyphPalette6 = { fg = c.light_green },
		GlyphPalette7 = { fg = c.fg },
		GlyphPalette9 = { fg = c.red },

		-- Dashboard
		DashboardShortCut = { fg = c.cyan },
		DashboardHeader = { fg = c.blue },
		DashboardCenter = { fg = c.magenta },
		DashboardFooter = { fg = c.blue },
		DashboardKey = { fg = c.yellow },
		DashboardDesc = { fg = c.cyan },
		DashboardIcon = { fg = c.cyan, bold = true },

		-- Alpha
		AlphaShortcut = { fg = c.yellow },
		AlphaHeader = { fg = c.blue },
		AlphaHeaderLabel = { fg = c.yellow },
		AlphaFooter = { fg = c.blue },
		AlphaButtons = { fg = c.cyan },

		-- WhichKey
		WhichKey = { fg = c.cyan },
		WhichKeyGroup = { fg = c.blue },
		WhichKeyDesc = { fg = c.magenta },
		WhichKeySeperator = { fg = c.light_white },
		WhichKeySeparator = { fg = c.light_white },
		WhichKeyFloat = { bg = c.highlight },
		WhichKeyValue = { fg = c.light_black },

		-- LspSaga
		DiagnosticWarning = { link = "DiagnosticWarn" },
		DiagnosticInformation = { link = "DiagnosticInfo" },

		LspFloatWinNormal = { bg = c.highlight },
		LspFloatWinBorder = { fg = c.fg },
		LspSagaBorderTitle = { fg = c.cyan },
		LspSagaHoverBorder = { fg = c.blue },
		LspSagaRenameBorder = { fg = c.green },
		LspSagaDefPreviewBorder = { fg = c.green },
		LspSagaCodeActionBorder = { fg = c.blue },
		LspSagaFinderSelection = { fg = c.bg },
		LspSagaCodeActionTitle = { fg = c.blue },
		LspSagaCodeActionContent = { fg = c.magenta },
		LspSagaSignatureHelpBorder = { fg = c.red },
		ReferencesCount = { fg = c.magenta },
		DefinitionCount = { fg = c.magenta },
		DefinitionIcon = { fg = c.blue },
		ReferencesIcon = { fg = c.blue },
		TargetWord = { fg = c.cyan },

		-- NeoVim
		healthError = { fg = c.red },
		healthSuccess = { fg = c.light_green },
		healthWarning = { fg = c.yellow },

		-- BufferLine
		BufferLineIndicatorSelected = { fg = c.light_blue },

		-- Barbar
		BufferCurrent = { bg = c.bg, fg = c.fg },
		BufferCurrentERROR = { bg = c.bg, fg = c.red },
		BufferCurrentHINT = { bg = c.bg, fg = c.green },
		-- BufferCurrentIcon = { bg = c.bg, fg = c.},
		BufferCurrentINFO = { bg = c.bg, fg = c.white },
		BufferCurrentWARN = { bg = c.bg, fg = c.yellow },
		BufferCurrentIndex = { bg = c.bg, fg = c.white },
		BufferCurrentMod = { bg = c.bg, fg = c.yellow },
		BufferCurrentSign = { bg = c.bg, fg = c.bg },
		BufferCurrentTarget = { bg = c.bg, fg = c.red },
		BufferAlternate = { bg = c.highlight, fg = c.fg },
		BufferAlternateERROR = { bg = c.highlight, fg = c.red },
		BufferAlternateHINT = { bg = c.highlight, fg = c.green },
		-- BufferAlternateIcon = { bg = c.highlight, fg = c. },
		BufferAlternateIndex = { bg = c.highlight, fg = c.white },
		BufferAlternateINFO = { bg = c.highlight, fg = c.white },
		BufferAlternateMod = { bg = c.highlight, fg = c.yellow },
		BufferAlternateSign = { bg = c.highlight, fg = c.white },
		BufferAlternateTarget = { bg = c.highlight, fg = c.red },
		BufferAlternateWARN = { bg = c.highlight, fg = c.yellow },
		BufferVisible = { bg = c.light_black, fg = c.fg },
		BufferVisibleERROR = { bg = c.light_black, fg = c.red },
		BufferVisibleHINT = { bg = c.light_black, fg = c.green },
		-- BufferVisibleIcon = { bg = c.light_black, fg = c. },
		BufferVisibleINFO = { bg = c.light_black, fg = c.white },
		BufferVisibleWARN = { bg = c.light_black, fg = c.yellow },
		BufferVisibleIndex = { bg = c.light_black, fg = c.white },
		BufferVisibleMod = { bg = c.light_black, fg = c.yellow },
		BufferVisibleSign = { bg = c.light_black, fg = c.white },
		BufferVisibleTarget = { bg = c.light_black, fg = c.red },
		BufferInactive = { bg = util.darken(c.highlight, 0.4), fg = util.darken(c.light_black, 0.8) },
		BufferInactiveERROR = { bg = util.darken(c.highlight, 0.4), fg = util.darken(c.red, 0.8) },
		BufferInactiveHINT = { bg = util.darken(c.highlight, 0.4), fg = util.darken(c.green, 0.8) },
		-- BufferInactiveIcon = { bg = c.light_black, fg = util.darken(c., 0.1) },
		BufferInactiveINFO = { bg = util.darken(c.highlight, 0.4), fg = util.darken(c.white, 0.8) },
		BufferInactiveWARN = { bg = util.darken(c.highlight, 0.4), fg = util.darken(c.yellow, 0.8) },
		BufferInactiveIndex = { bg = util.darken(c.highlight, 0.4), fg = c.light_black },
		BufferInactiveMod = { bg = util.darken(c.highlight, 0.4), fg = util.darken(c.yellow, 0.8) },
		BufferInactiveSign = { bg = util.darken(c.highlight, 0.4), fg = c.bg },
		BufferInactiveTarget = { bg = util.darken(c.highlight, 0.4), fg = c.red },
		BufferOffset = { bg = c.light_black, fg = c.light_black },
		BufferTabpageFill = { bg = util.darken(c.highlight, 0.8), fg = c.light_black },
		BufferTabpages = { bg = c.light_black, fg = c.none },

		-- Sneak
		Sneak = { fg = c.highlight, bg = c.magenta },
		SneakScope = { bg = c.bg },

		-- Hop
		HopNextKey = { fg = c.light_magenta, bold = true },
		HopNextKey1 = { fg = c.blue, bold = true },
		HopNextKey2 = { fg = util.darken(c.blue, 0.6) },
		HopUnmatched = { fg = c.highlight },

		TSNodeKey = { fg = c.light_magenta, bold = true },
		TSNodeUnmatched = { fg = c.highlight },

		LeapMatch = { bg = c.light_magenta, fg = c.fg, bold = true },
		LeapLabelPrimary = { fg = c.light_magenta, bold = true },
		LeapLabelSecondary = { fg = c.light_green, bold = true },
		LeapBackdrop = { fg = c.highlight },

		FlashBackdrop = { fg = c.highlight },
		FlashLabel = { bg = c.light_magenta, bold = true, fg = c.fg },

		LightspeedGreyWash = { fg = c.highlight },
		-- LightspeedCursor = { link = "Cursor" },
		LightspeedLabel = { fg = c.light_magenta, bold = true, underline = true },
		LightspeedLabelDistant = { fg = c.light_green, bold = true, underline = true },
		LightspeedLabelDistantOverlapped = { fg = c.light_green, underline = true },
		LightspeedLabelOverlapped = { fg = c.light_magenta, underline = true },
		LightspeedMaskedChar = { fg = c.yellow },
		LightspeedOneCharMatch = { bg = c.light_magenta, fg = c.fg, bold = true },
		LightspeedPendingOpArea = { bg = c.light_magenta, fg = c.fg },
		LightspeedShortcut = { bg = c.light_magenta, fg = c.fg, bold = true, underline = true },
		-- LightspeedShortcutOverlapped = { link = "LightspeedShortcut" },
		-- LightspeedUniqueChar = { link = "LightspeedUnlabeledMatch" },
		LightspeedUnlabeledMatch = { fg = c.blue, bold = true },

		-- Cmp
		CmpDocumentation = { fg = c.fg, bg = c.highlight },
		CmpDocumentationBorder = { fg = c.fg, bg = c.highlight },
		CmpGhostText = { fg = c.light_black },

		CmpItemAbbr = { fg = c.fg, bg = c.none },
		CmpItemAbbrDeprecated = { fg = c.highlight, bg = c.none, strikethrough = true },
		CmpItemAbbrMatch = { fg = c.blue, bg = c.none },
		CmpItemAbbrMatchFuzzy = { fg = c.blue, bg = c.none },

		CmpItemMenu = { fg = c.light_white, bg = c.none },

		CmpItemKindDefault = { fg = c.fg, bg = c.none },

		CmpItemKindCodeium = { fg = c.light_cyan, bg = c.none },
		CmpItemKindCopilot = { fg = c.light_cyan, bg = c.none },
		CmpItemKindTabNine = { fg = c.light_cyan, bg = c.none },

		-- headlines.nvim
		CodeBlock = { bg = c.bg },

		-- navic
		NavicSeparator = { fg = c.fg, bg = c.none },
		NavicText = { fg = c.fg, bg = c.none },

		AerialNormal = { fg = c.fg, bg = c.none },
		AerialGuide = { fg = c.highlight },
		AerialLine = { link = "LspInlayHint" },

		IndentBlanklineChar = { fg = c.highlight, nocombine = true },
		IndentBlanklineContextChar = { fg = c.magenta, nocombine = true },
		IblIndent = { fg = c.highlight, nocombine = true },
		IblScope = { fg = c.magenta, nocombine = true },

		-- Scrollbar
		ScrollbarHandle = { fg = c.none, bg = c.highlight },

		ScrollbarSearchHandle = { fg = c.yellow, bg = c.highlight },
		ScrollbarSearch = { fg = c.yellow, bg = c.none },

		ScrollbarErrorHandle = { fg = c.red, bg = c.highlight },
		ScrollbarError = { fg = c.red, bg = c.none },

		ScrollbarWarnHandle = { fg = c.yellow, bg = c.highlight },
		ScrollbarWarn = { fg = c.yellow, bg = c.none },

		ScrollbarInfoHandle = { fg = c.white, bg = c.highlight },
		ScrollbarInfo = { fg = c.white, bg = c.none },

		ScrollbarHintHandle = { fg = c.green, bg = c.highlight },
		ScrollbarHint = { fg = c.green, bg = c.none },

		ScrollbarMiscHandle = { fg = c.magenta, bg = c.highlight },
		ScrollbarMisc = { fg = c.magenta, bg = c.none },

		-- Yanky
		YankyPut = { link = "IncSearch" },
		YankyYanked = { link = "IncSearch" },

		-- Lazy
		LazyProgressDone = { bold = true, fg = c.light_magenta },
		LazyProgressTodo = { bold = true, fg = c.highlight },

		-- Notify
		NotifyBackground = { fg = c.fg, bg = c.bg },
		--- Border
		NotifyERRORBorder = { fg = util.darken(c.red, 0.3), bg = options.transparent and c.none or c.bg },
		NotifyWARNBorder = { fg = util.darken(c.yellow, 0.3), bg = options.transparent and c.none or c.bg },
		NotifyINFOBorder = { fg = util.darken(c.white, 0.3), bg = options.transparent and c.none or c.bg },
		NotifyDEBUGBorder = { fg = util.darken(c.light_white, 0.3), bg = options.transparent and c.none or c.bg },
		NotifyTRACEBorder = { fg = util.darken(c.magenta, 0.3), bg = options.transparent and c.none or c.bg },
		--- Icons
		NotifyERRORIcon = { fg = c.red },
		NotifyWARNIcon = { fg = c.yellow },
		NotifyINFOIcon = { fg = c.white },
		NotifyDEBUGIcon = { fg = c.light_white },
		NotifyTRACEIcon = { fg = c.magenta },
		--- Title
		NotifyERRORTitle = { fg = c.red },
		NotifyWARNTitle = { fg = c.yellow },
		NotifyINFOTitle = { fg = c.white },
		NotifyDEBUGTitle = { fg = c.light_white },
		NotifyTRACETitle = { fg = c.magenta },
		--- Body
		NotifyERRORBody = { fg = c.fg, bg = options.transparent and c.none or c.bg },
		NotifyWARNBody = { fg = c.fg, bg = options.transparent and c.none or c.bg },
		NotifyINFOBody = { fg = c.fg, bg = options.transparent and c.none or c.bg },
		NotifyDEBUGBody = { fg = c.fg, bg = options.transparent and c.none or c.bg },
		NotifyTRACEBody = { fg = c.fg, bg = options.transparent and c.none or c.bg },

		-- Mini
		MiniCompletionActiveParameter = { underline = true },

		MiniCursorword = { bg = c.highlight },
		MiniCursorwordCurrent = { bg = c.highlight },

		MiniIndentscopeSymbol = { fg = c.blue, nocombine = true },
		MiniIndentscopePrefix = { nocombine = true }, -- Make it invisible

		MiniJump = { bg = c.light_magenta, fg = "#ffffff" },

		MiniJump2dSpot = { fg = c.light_magenta, bold = true, nocombine = true },

		MiniStarterCurrent = { nocombine = true },
		MiniStarterFooter = { fg = c.light_yellow, italic = true },
		MiniStarterHeader = { fg = c.blue },
		MiniStarterInactive = { fg = c.light_white, style = options.styles.comments },
		MiniStarterItem = { fg = c.fg, bg = options.transparent and c.none or c.bg },
		MiniStarterItemBullet = { fg = c.fg },
		MiniStarterItemPrefix = { fg = c.yellow },
		MiniStarterSection = { fg = c.blue },
		MiniStarterQuery = { fg = c.white },

		MiniStatuslineDevinfo = { fg = c.fg, bg = c.highlight },
		MiniStatuslineFileinfo = { fg = c.fg, bg = c.highlight },
		MiniStatuslineFilename = { fg = c.fg, bg = c.highlight },
		MiniStatuslineInactive = { fg = c.blue, bg = c.light_black },
		MiniStatuslineModeCommand = { fg = c.black, bg = c.light_yellow, bold = true },
		MiniStatuslineModeInsert = { fg = c.black, bg = c.green, bold = true },
		MiniStatuslineModeNormal = { fg = c.black, bg = c.blue, bold = true },
		MiniStatuslineModeOther = { fg = c.black, bg = c.light_cyan, bold = true },
		MiniStatuslineModeReplace = { fg = c.black, bg = c.red, bold = true },
		MiniStatuslineModeVisual = { fg = c.black, bg = c.magenta, bold = true },

		MiniSurround = { bg = c.yellow, fg = c.black },

		MiniTablineCurrent = { fg = c.fg, bg = c.highlight },
		MiniTablineFill = { bg = c.black },
		MiniTablineHidden = { fg = c.light_black, bg = c.light_black },
		MiniTablineModifiedCurrent = { fg = c.yellow, bg = c.highlight },
		MiniTablineModifiedHidden = { bg = c.light_black, fg = util.darken(c.yellow, 0.7) },
		MiniTablineModifiedVisible = { fg = c.yellow, bg = c.light_black },
		MiniTablineTabpagesection = { bg = c.light_black, fg = c.none },
		MiniTablineVisible = { fg = c.fg, bg = c.light_black },

		MiniTestEmphasis = { bold = true },
		MiniTestFail = { fg = c.red, bold = true },
		MiniTestPass = { fg = c.green, bold = true },

		MiniTrailspace = { bg = c.red },

		-- Noice

		NoiceCompletionItemKindDefault = { fg = c.fg, bg = c.none },

		TreesitterContext = { bg = util.darken(c.highlight, 0.8) },
		Hlargs = { fg = c.light_yellow },
		-- TreesitterContext = { bg = util.darken(c.bg, 0.4) },
	}

	-- lsp symbol kind and completion kind highlights
	local kinds = {
		Array = "@punctuation.bracket",
		Boolean = "@boolean",
		Class = "@type",
		Color = "Special",
		Constant = "@constant",
		Constructor = "@constructor",
		Enum = "@lsp.type.enum",
		EnumMember = "@lsp.type.enumMember",
		Event = "Special",
		Field = "@field",
		File = "Normal",
		Folder = "Directory",
		Function = "@function",
		Interface = "@lsp.type.interface",
		Key = "@field",
		Keyword = "@lsp.type.keyword",
		Method = "@method",
		Module = "@namespace",
		Namespace = "@namespace",
		Null = "@constant.builtin",
		Number = "@number",
		Object = "@constant",
		Operator = "@operator",
		Package = "@namespace",
		Property = "@property",
		Reference = "@text.reference",
		Snippet = "Conceal",
		String = "@string",
		Struct = "@lsp.type.struct",
		Unit = "@lsp.type.struct",
		Text = "@text",
		TypeParameter = "@lsp.type.typeParameter",
		Variable = "@variable",
		Value = "@string",
	}

	local kind_groups = { "NavicIcons%s", "Aerial%sIcon", "CmpItemKind%s", "NoiceCompletionItemKind%s" }
	for kind, link in pairs(kinds) do
		local base = "LspKind" .. kind
		theme.highlights[base] = { link = link }
		for _, plugin in pairs(kind_groups) do
			theme.highlights[plugin:format(kind)] = { link = base }
		end
	end

	local markdown_rainbow = { c.blue, c.light_yellow, c.green, c.light_cyan, c.magenta, c.magenta }

	for i, color in ipairs(markdown_rainbow) do
		theme.highlights["@text.title." .. i .. ".markdown"] = { fg = color, bold = true }
		theme.highlights["Headline" .. i] = { bg = util.darken(color, 0.05) }
	end
	theme.highlights["Headline"] = { link = "Headline1" }

	if not require("vim").diagnostic then
		local severity_map = {
			Error = "Error",
			Warn = "Warning",
			Info = "Information",
			Hint = "Hint",
		}
		local types = { "Default", "VirtualText", "Underline" }
		for _, type in ipairs(types) do
			for snew, sold in pairs(severity_map) do
				theme.highlights["LspDiagnostics" .. type .. sold] = {
					link = "Diagnostic" .. (type == "Default" and "" or type) .. snew,
				}
			end
		end
	end

	---@type table<string, table>
	theme.defer = {}

	if options.hide_inactive_statusline then
		local inactive = { underline = true, bg = c.none, fg = c.bg, sp = c.border }

		-- StatusLineNC
		theme.highlights.StatusLineNC = inactive

		-- LuaLine
		for _, section in ipairs({ "a", "b", "c" }) do
			theme.defer["lualine_" .. section .. "_inactive"] = inactive
		end

		-- mini.statusline
		theme.highlights.MiniStatuslineInactive = inactive
	end

	options.on_highlights(theme.highlights, theme.colors)

	return theme
end

return M

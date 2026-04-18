local colors = require("ghostty-theme.colors")

local M = {}

function M.setup()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "ghostty"

  local hi = function(group, opts)
    local cmd = "highlight " .. group
    if opts.fg then cmd = cmd .. " guifg=" .. opts.fg end
    if opts.bg then cmd = cmd .. " guibg=" .. opts.bg end
    if opts.sp then cmd = cmd .. " guisp=" .. opts.sp end
    if opts.style then cmd = cmd .. " gui=" .. opts.style end
    if opts.link then cmd = "highlight! link " .. group .. " " .. opts.link end
    vim.cmd(cmd)
  end

  -- Editor
  hi("Normal", { fg = colors.fg, bg = colors.bg })
  hi("NormalFloat", { fg = colors.fg, bg = colors.bg_float })
  hi("NormalNC", { fg = colors.fg, bg = colors.bg })
  hi("FloatBorder", { fg = colors.border, bg = colors.bg_float })
  hi("Cursor", { fg = colors.cursor_text, bg = colors.cursor })
  hi("CursorLine", { bg = colors.bg_lighter })
  hi("CursorLineNr", { fg = colors.yellow, style = "bold" })
  hi("LineNr", { fg = colors.line_number })
  hi("SignColumn", { bg = colors.bg })
  hi("Visual", { bg = colors.selection_bg })
  hi("VisualNOS", { bg = colors.selection_bg })
  hi("Search", { fg = colors.bg, bg = colors.yellow })
  hi("IncSearch", { fg = colors.bg, bg = colors.cyan })
  hi("ColorColumn", { bg = colors.bg_lighter })
  hi("VertSplit", { fg = colors.border })
  hi("WinSeparator", { fg = colors.border })
  hi("Pmenu", { fg = colors.fg, bg = colors.bg_popup })
  hi("PmenuSel", { fg = colors.bg, bg = colors.blue })
  hi("PmenuSbar", { bg = colors.bg_popup })
  hi("PmenuThumb", { bg = colors.bright_black })
  hi("StatusLine", { fg = colors.fg, bg = colors.bg_lighter })
  hi("StatusLineNC", { fg = colors.comment, bg = colors.bg_lighter })
  hi("TabLine", { fg = colors.comment, bg = colors.bg_lighter })
  hi("TabLineFill", { bg = colors.bg_lighter })
  hi("TabLineSel", { fg = colors.fg, bg = colors.bg })
  hi("Folded", { fg = colors.comment, bg = colors.bg_lighter })
  hi("FoldColumn", { fg = colors.comment, bg = colors.bg })

  -- Syntax
  hi("Comment", { fg = colors.comment, style = "italic" })
  hi("Constant", { fg = colors.cyan })
  hi("String", { fg = colors.green })
  hi("Character", { fg = colors.green })
  hi("Number", { fg = colors.magenta })
  hi("Boolean", { fg = colors.magenta })
  hi("Float", { fg = colors.magenta })
  hi("Identifier", { fg = colors.red })
  hi("Function", { fg = colors.blue })
  hi("Statement", { fg = colors.magenta })
  hi("Conditional", { fg = colors.magenta })
  hi("Repeat", { fg = colors.magenta })
  hi("Label", { fg = colors.magenta })
  hi("Operator", { fg = colors.cyan })
  hi("Keyword", { fg = colors.red })
  hi("Exception", { fg = colors.magenta })
  hi("PreProc", { fg = colors.yellow })
  hi("Include", { fg = colors.blue })
  hi("Define", { fg = colors.magenta })
  hi("Macro", { fg = colors.red })
  hi("PreCondit", { fg = colors.yellow })
  hi("Type", { fg = colors.yellow })
  hi("StorageClass", { fg = colors.yellow })
  hi("Structure", { fg = colors.yellow })
  hi("Typedef", { fg = colors.yellow })
  hi("Special", { fg = colors.blue })
  hi("SpecialChar", { fg = colors.cyan })
  hi("Tag", { fg = colors.red })
  hi("Delimiter", { fg = colors.fg })
  hi("SpecialComment", { fg = colors.comment, style = "italic" })
  hi("Debug", { fg = colors.red })
  hi("Underlined", { fg = colors.cyan, style = "underline" })
  hi("Ignore", { fg = colors.comment })
  hi("Error", { fg = colors.error, style = "bold" })
  hi("Todo", { fg = colors.magenta, style = "bold,italic" })

  -- Treesitter
  hi("@variable", { fg = colors.red })
  hi("@variable.builtin", { fg = colors.red })
  hi("@variable.parameter", { fg = colors.red })
  hi("@variable.member", { fg = colors.red })
  hi("@constant", { fg = colors.cyan })
  hi("@constant.builtin", { fg = colors.cyan })
  hi("@module", { fg = colors.yellow })
  hi("@label", { fg = colors.magenta })
  hi("@string", { fg = colors.green })
  hi("@string.escape", { fg = colors.cyan })
  hi("@string.regexp", { fg = colors.cyan })
  hi("@character", { fg = colors.green })
  hi("@number", { fg = colors.magenta })
  hi("@boolean", { fg = colors.magenta })
  hi("@float", { fg = colors.magenta })
  hi("@function", { fg = colors.blue })
  hi("@function.builtin", { fg = colors.cyan })
  hi("@function.macro", { fg = colors.red })
  hi("@function.method", { fg = colors.blue })
  hi("@constructor", { fg = colors.yellow })
  hi("@keyword", { fg = colors.red })
  hi("@keyword.function", { fg = colors.magenta })
  hi("@keyword.operator", { fg = colors.magenta })
  hi("@keyword.return", { fg = colors.magenta })
  hi("@conditional", { fg = colors.magenta })
  hi("@repeat", { fg = colors.magenta })
  hi("@operator", { fg = colors.cyan })
  hi("@type", { fg = colors.yellow })
  hi("@type.builtin", { fg = colors.yellow })
  hi("@property", { fg = colors.red })
  hi("@field", { fg = colors.red })
  hi("@parameter", { fg = colors.red })
  hi("@namespace", { fg = colors.yellow })
  hi("@punctuation.delimiter", { fg = colors.fg })
  hi("@punctuation.bracket", { fg = colors.fg })
  hi("@punctuation.special", { fg = colors.cyan })
  hi("@comment", { fg = colors.comment, style = "italic" })
  hi("@tag", { fg = colors.red })
  hi("@tag.attribute", { fg = colors.yellow })
  hi("@tag.delimiter", { fg = colors.fg })

  -- LSP
  hi("LspReferenceText", { bg = colors.selection_bg })
  hi("LspReferenceRead", { bg = colors.selection_bg })
  hi("LspReferenceWrite", { bg = colors.selection_bg })
  hi("LspSignatureActiveParameter", { fg = colors.yellow, style = "bold" })
  hi("LspCodeLens", { fg = colors.comment })
  hi("LspInlayHint", { fg = colors.comment, bg = colors.bg_lighter })

  -- Diagnostics
  hi("DiagnosticError", { fg = colors.error })
  hi("DiagnosticWarn", { fg = colors.warning })
  hi("DiagnosticInfo", { fg = colors.info })
  hi("DiagnosticHint", { fg = colors.hint })
  hi("DiagnosticUnderlineError", { sp = colors.error, style = "underline" })
  hi("DiagnosticUnderlineWarn", { sp = colors.warning, style = "underline" })
  hi("DiagnosticUnderlineInfo", { sp = colors.info, style = "underline" })
  hi("DiagnosticUnderlineHint", { sp = colors.hint, style = "underline" })

  -- Git signs
  hi("GitSignsAdd", { fg = colors.git_add })
  hi("GitSignsChange", { fg = colors.git_change })
  hi("GitSignsDelete", { fg = colors.git_delete })
  hi("GitSignsAddNr", { fg = colors.git_add })
  hi("GitSignsChangeNr", { fg = colors.git_change })
  hi("GitSignsDeleteNr", { fg = colors.git_delete })
  hi("GitSignsAddLn", { fg = colors.git_add })
  hi("GitSignsChangeLn", { fg = colors.git_change })
  hi("GitSignsDeleteLn", { fg = colors.git_delete })

  -- Diff
  hi("DiffAdd", { fg = colors.git_add, bg = colors.bg_lighter })
  hi("DiffChange", { fg = colors.git_change, bg = colors.bg_lighter })
  hi("DiffDelete", { fg = colors.git_delete, bg = colors.bg_lighter })
  hi("DiffText", { fg = colors.git_change, bg = colors.selection_bg })

  -- Completion (nvim-cmp)
  hi("CmpItemAbbrDeprecated", { fg = colors.comment, style = "strikethrough" })
  hi("CmpItemAbbrMatch", { fg = colors.blue, style = "bold" })
  hi("CmpItemAbbrMatchFuzzy", { fg = colors.blue, style = "bold" })
  hi("CmpItemKindVariable", { fg = colors.red })
  hi("CmpItemKindInterface", { fg = colors.yellow })
  hi("CmpItemKindText", { fg = colors.fg })
  hi("CmpItemKindFunction", { fg = colors.blue })
  hi("CmpItemKindMethod", { fg = colors.blue })
  hi("CmpItemKindKeyword", { fg = colors.magenta })
  hi("CmpItemKindProperty", { fg = colors.red })
  hi("CmpItemKindUnit", { fg = colors.cyan })

  -- Telescope
  hi("TelescopeBorder", { fg = colors.border })
  hi("TelescopePromptBorder", { fg = colors.border })
  hi("TelescopeResultsBorder", { fg = colors.border })
  hi("TelescopePreviewBorder", { fg = colors.border })
  hi("TelescopeSelection", { fg = colors.fg, bg = colors.selection_bg })
  hi("TelescopeSelectionCaret", { fg = colors.cyan })
  hi("TelescopeMultiSelection", { fg = colors.magenta })
  hi("TelescopeMatching", { fg = colors.blue, style = "bold" })

  -- Neo-tree
  hi("NeoTreeNormal", { fg = colors.fg, bg = colors.bg })
  hi("NeoTreeNormalNC", { fg = colors.fg, bg = colors.bg })
  hi("NeoTreeDirectoryIcon", { fg = colors.blue })
  hi("NeoTreeDirectoryName", { fg = colors.blue })
  hi("NeoTreeGitAdded", { fg = colors.git_add })
  hi("NeoTreeGitModified", { fg = colors.git_change })
  hi("NeoTreeGitDeleted", { fg = colors.git_delete })
  hi("NeoTreeGitUntracked", { fg = colors.comment })

  -- WhichKey
  hi("WhichKey", { fg = colors.magenta })
  hi("WhichKeyGroup", { fg = colors.blue })
  hi("WhichKeyDesc", { fg = colors.cyan })
  hi("WhichKeySeperator", { fg = colors.comment })
  hi("WhichKeyFloat", { bg = colors.bg_float })
  hi("WhichKeyValue", { fg = colors.comment })

  -- Notify
  hi("NotifyERRORBorder", { fg = colors.error })
  hi("NotifyWARNBorder", { fg = colors.warning })
  hi("NotifyINFOBorder", { fg = colors.info })
  hi("NotifyDEBUGBorder", { fg = colors.comment })
  hi("NotifyTRACEBorder", { fg = colors.magenta })
  hi("NotifyERRORIcon", { fg = colors.error })
  hi("NotifyWARNIcon", { fg = colors.warning })
  hi("NotifyINFOIcon", { fg = colors.info })
  hi("NotifyDEBUGIcon", { fg = colors.comment })
  hi("NotifyTRACEIcon", { fg = colors.magenta })
  hi("NotifyERRORTitle", { fg = colors.error })
  hi("NotifyWARNTitle", { fg = colors.warning })
  hi("NotifyINFOTitle", { fg = colors.info })
  hi("NotifyDEBUGTitle", { fg = colors.comment })
  hi("NotifyTRACETitle", { fg = colors.magenta })

  -- Alpha (Dashboard)
  hi("AlphaHeader", { fg = colors.blue })
  hi("AlphaButtons", { fg = colors.cyan })
  hi("AlphaShortcut", { fg = colors.magenta })
  hi("AlphaFooter", { fg = colors.comment, style = "italic" })

  -- BufferLine
  hi("BufferLineIndicatorSelected", { fg = colors.blue })
  hi("BufferLineFill", { bg = colors.bg_darker })

  -- Indent Blankline
  hi("IblIndent", { fg = colors.bg_lighter })
  hi("IblScope", { fg = colors.bright_black })

  -- Noice
  hi("NoiceCmdlinePopup", { fg = colors.fg, bg = colors.bg_popup })
  hi("NoiceCmdlinePopupBorder", { fg = colors.border })
  hi("NoiceCmdlineIcon", { fg = colors.blue })
  hi("NoiceCmdlinePrompt", { fg = colors.cyan })

  -- Flash
  hi("FlashLabel", { fg = colors.bg, bg = colors.magenta, style = "bold" })
  hi("FlashMatch", { fg = colors.cyan })
  hi("FlashCurrent", { fg = colors.yellow })

  -- Trouble
  hi("TroubleText", { fg = colors.fg })
  hi("TroubleCount", { fg = colors.magenta, bg = colors.bg_lighter })
  hi("TroubleNormal", { fg = colors.fg, bg = colors.bg })

  -- Todo Comments
  hi("TodoBgTODO", { fg = colors.bg, bg = colors.info, style = "bold" })
  hi("TodoFgTODO", { fg = colors.info })
  hi("TodoBgFIX", { fg = colors.bg, bg = colors.error, style = "bold" })
  hi("TodoFgFIX", { fg = colors.error })
  hi("TodoBgHACK", { fg = colors.bg, bg = colors.warning, style = "bold" })
  hi("TodoFgHACK", { fg = colors.warning })
  hi("TodoBgNOTE", { fg = colors.bg, bg = colors.hint, style = "bold" })
  hi("TodoFgNOTE", { fg = colors.hint })
  hi("TodoBgPERF", { fg = colors.bg, bg = colors.magenta, style = "bold" })
  hi("TodoFgPERF", { fg = colors.magenta })

  -- Terminal
  vim.g.terminal_color_0 = colors.black
  vim.g.terminal_color_1 = colors.red
  vim.g.terminal_color_2 = colors.green
  vim.g.terminal_color_3 = colors.yellow
  vim.g.terminal_color_4 = colors.blue
  vim.g.terminal_color_5 = colors.magenta
  vim.g.terminal_color_6 = colors.cyan
  vim.g.terminal_color_7 = colors.white
  vim.g.terminal_color_8 = colors.bright_black
  vim.g.terminal_color_9 = colors.bright_red
  vim.g.terminal_color_10 = colors.bright_green
  vim.g.terminal_color_11 = colors.bright_yellow
  vim.g.terminal_color_12 = colors.bright_blue
  vim.g.terminal_color_13 = colors.bright_magenta
  vim.g.terminal_color_14 = colors.bright_cyan
  vim.g.terminal_color_15 = colors.bright_white
end

return M

local colors = {
    black      = "#000000",
    white      = "#FFFFFF",
    fl_red     = "#FF0000",
    fl_green   = "#00FF00",
    fl_blue    = "#0000FF",
    fl_cyan    = "#00FFFF",
    fl_magenta = "#FF00FF",
    fl_yellow  = "#FFFF00",
    fl_orange  = "#FF6600",
    maroon     = "#660000",
    green      = "#00A645",
    blue       = "#000066",
    cyan       = "#006666",
    magenta    = "#660066",
    yellow     = "#FFBF00",
    olive      = "#666600",
    gray       = "#999999",
}

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end
vim.g.colors_name = "high_k"

local hl = function(group, settings)
    vim.api.nvim_set_hl(0, group, settings)
end

-- --- UI Elements ---
hl("Normal",        { fg = colors.black,  bg = colors.white })
hl("Cursor",        { fg = colors.white,  bg = colors.fl_blue })
hl("Visual",        { fg = colors.black,  bg = colors.fl_green })
hl("LineNr",        { fg = colors.fl_red, bg = colors.white })
hl("CursorLine",    { bg = colors.fl_green })
hl("CursorLineNr",  { fg = colors.black })
hl("SignColumn",    { bg = colors.white })
hl("ColorColumn",   { bg = colors.fl_green })
hl("Pmenu",         { fg = colors.black,  bg = colors.white }) 
hl("PmenuSel",      { fg = colors.black,  bg = colors.fl_green }) 
hl("PmenuSbar",     { bg = colors.gray }) 
hl("PmenuThumb",    { bg = colors.black })
hl("IncSearch",     { fg = colors.black, bg = colors.yellow })
hl("CurSearch",     { fg = colors.black, bg = colors.yellow })
hl("Search",        { fg = colors.white, bg = colors.black })
hl("ModeMsg",       { fg = colors.fl_red })
hl("ErrorMsg",      { fg = colors.fl_red })
hl("MoreMsg",       { fg = colors.fl_blue })
hl("Question",      { fg = colors.fl_blue })
hl("Directory",     { fg = colors.fl_blue })
hl("Warning",       { fg = colors.fl_yellow })

-- --- StatusLine & Borders ---
hl("StatusLine",    { fg = colors.white, bg = colors.black })
hl("StatusLineNC",  { fg = colors.gray,  bg = colors.white })
hl("WinSeparator",  { fg = colors.black })
hl("FloatBorder",   { fg = colors.black, bg = colors.white })
hl("NormalFloat",   { bg = colors.white })

-- --- Syntax Highlighting ---
hl("Comment",      { fg = colors.gray, italic = true })
hl("String",       { fg = colors.green })
hl("Number",       { fg = colors.maroon })
hl("Constant",     { fg = colors.maroon })
hl("Boolean",      { fg = colors.magenta })
hl("Keyword",      { fg = colors.blue })
hl("Function",     { fg = colors.magenta })
hl("Identifier",   { fg = colors.black })
hl("Statement",    { fg = colors.blue })
hl("PreProc",      { fg = colors.maroon })
hl("Type",         { fg = colors.cyan })
hl("Special",      { fg = colors.magenta })
hl("Operator",     { fg = colors.black })
hl("Delimiter",    { fg = colors.black })

-- --- Treesitter ---
hl("@variable",    { fg = colors.black })
hl("@function",    { fg = colors.magenta })
hl("@keyword",     { fg = colors.blue })
hl("@string",      { fg = colors.green })
hl("@comment",     { fg = colors.gray })
hl("@class.cs",    { fg = colors.cyan })

-- --- Plugins ---
hl("OilDir",       { fg = colors.blue })
hl("OilDirIcon",   { fg = colors.blue })
hl("TelescopeBorder",   { fg = colors.black })
hl("TelescopeSelection", { bg = colors.fl_green, fg = colors.black })
hl("TelescopeMatching",  { fg = colors.fl_red })

-- --- Diagnostics ---
hl("DiagnosticError", { fg = colors.fl_red })
hl("DiagnosticWarn",  { fg = colors.fl_orange })
hl("DiagnosticInfo",  { fg = colors.blue })
hl("DiagnosticHint",  { fg = colors.green })

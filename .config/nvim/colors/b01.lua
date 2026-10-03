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

vim.g.colors_name = "b01"

local hl = function(group, settings)
    vim.api.nvim_set_hl(0, group, settings)
end

hl("Normal",        { fg = colors.yellow, bg = colors.black })
hl("Cursor",        { fg = colors.black,  bg = colors.green })
hl("TermCursor",    { fg = colors.black,  bg = colors.green })
hl("Visual",        { fg = colors.fl_cyan, bg = colors.blue })
hl("LineNr",        { fg = colors.fl_orange, bg = colors.black })
hl("CursorLine",    { bg = colors.blue })
hl("CursorLineNr",  { fg = colors.white })
hl("Gutter",        { bg = colors.black })

hl("Comment",      { fg = colors.gray })
hl("String",       { fg = colors.fl_green })
hl("Number",       { fg = colors.fl_magenta })
hl("Keyword",      { fg = colors.fl_red })
hl("Function",     { fg = colors.fl_cyan })
hl("Identifier",   { fg = colors.fl_yellow })
hl("Statement",    { fg = colors.fl_red })
hl("PreProc",      { fg = colors.fl_orange })
hl("Type",         { fg = colors.fl_cyan })
hl("Special",      { fg = colors.fl_magenta })
hl("Operator",     { fg = colors.white })

hl("@variable",    { fg = colors.yellow })
hl("@function",    { fg = colors.fl_cyan })
hl("@keyword",     { fg = colors.fl_red })
hl("@string",      { fg = colors.fl_green })
hl("@comment",     { fg = colors.gray })

hl("StatusLine",   { fg = colors.yellow, bg = colors.blue, bold = false }) 
hl("StatusLineNC", { fg = colors.gray,   bg = colors.black }) 
hl("ModeMsg",      { fg = colors.yellow }) 
hl("ErrorMsg",     { fg = colors.fl_red })
hl("MoreMsg",       { fg = colors.fl_blue })
hl("Question",      { fg = colors.fl_blue })
hl("Directory",     { fg = colors.fl_blue })
hl("Warning",       { fg = colors.fl_yellow })

hl("TabLine",      { fg = colors.gray,   bg = colors.black })
hl("TabLineSel",   { fg = colors.black,  bg = colors.fl_yellow })
hl("TabLineFill",  { bg = colors.black })

hl("WinSeparator", { fg = colors.blue })

hl("Search",       { fg = colors.black, bg = colors.fl_magenta })
hl("IncSearch",    { fg = colors.black, bg = colors.fl_cyan })
hl("FloatBorder",  { fg = colors.fl_orange, bg = colors.black })
hl("NormalFloat",  { bg = colors.black })

hl("OilDir",            { fg = colors.fl_cyan })
hl("OilDirIcon",        { fg = colors.fl_cyan })
hl("OilLink",           { fg = colors.fl_magenta })
hl("OilCreate",         { fg = colors.fl_green })
hl("OilDelete",         { fg = colors.fl_red })
hl("OilChange",         { fg = colors.fl_yellow })
hl("OilSocket",         { fg = colors.fl_magenta })
hl("OilExecutable",     { fg = colors.fl_green })
hl("OilIndex",          { fg = colors.fl_orange })

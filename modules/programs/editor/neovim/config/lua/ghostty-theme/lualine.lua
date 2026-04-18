-- Lualine theme for Ghostty colors
local colors = require("ghostty-theme.colors")

return {
  normal = {
    a = { fg = colors.bg, bg = colors.blue, gui = "bold" },
    b = { fg = colors.fg, bg = colors.bg_lighter },
    c = { fg = colors.fg, bg = colors.bg },
  },
  insert = {
    a = { fg = colors.bg, bg = colors.green, gui = "bold" },
    b = { fg = colors.fg, bg = colors.bg_lighter },
  },
  visual = {
    a = { fg = colors.bg, bg = colors.magenta, gui = "bold" },
    b = { fg = colors.fg, bg = colors.bg_lighter },
  },
  replace = {
    a = { fg = colors.bg, bg = colors.red, gui = "bold" },
    b = { fg = colors.fg, bg = colors.bg_lighter },
  },
  command = {
    a = { fg = colors.bg, bg = colors.yellow, gui = "bold" },
    b = { fg = colors.fg, bg = colors.bg_lighter },
  },
  inactive = {
    a = { fg = colors.comment, bg = colors.bg_lighter },
    b = { fg = colors.comment, bg = colors.bg_lighter },
    c = { fg = colors.comment, bg = colors.bg },
  },
}

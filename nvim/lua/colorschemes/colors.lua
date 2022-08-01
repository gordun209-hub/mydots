local M = {}



M.theme = function()
  -- I know I could just set bg = nil but I'm leaving this here in case I want custom colors in the future
  local colors = {
    nobg = nil,
    blue = "#87b0f9",
    mauve = "#cba6f7",
    red = "#f38ba8",
    green = "#a6e3a1",
    peach = "#fab387",
    white = "#c6d0f5",
    gray = "#a1a8c9",
    black = "#1e1e2e",
  }
  return {
    inactive = {
      a = { fg = colors.blue, bg = colors.nobg, gui = "bold" },
      b = { fg = colors.gray, bg = colors.nobg },
      c = { fg = colors.gray, bg = colors.nobg },
    },
    visual = {
      a = { fg = colors.black, bg = colors.mauve, gui = "bold" },
      b = { fg = colors.mauve, bg = colors.nobg },
      c = { fg = colors.white, bg = colors.nobg },
    },
    replace = {
      a = { fg = colors.black, bg = colors.red, gui = "bold" },
      b = { fg = colors.red, bg = colors.nobg },
      c = { fg = colors.white, bg = colors.nobg },
    },
    normal = {
      a = { fg = colors.black, bg = colors.blue, gui = "bold" },
      b = { fg = colors.blue, bg = colors.nobg },
      c = { fg = colors.white, bg = colors.nobg },
    },
    insert = {
      a = { fg = colors.black, bg = colors.green, gui = "bold" },
      b = { fg = colors.teal, bg = colors.nobg },
      c = { fg = colors.white, bg = colors.nobg },
    },
    command = {
      a = { fg = colors.black, bg = colors.peach, gui = "bold" },
      b = { fg = colors.peach, bg = colors.nobg },
      c = { fg = colors.white, bg = colors.nobg },
    },
  }
end
return M

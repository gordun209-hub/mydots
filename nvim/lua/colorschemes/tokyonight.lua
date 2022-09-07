require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "night", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
  transparent = true, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim                                                                                                  |
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value `:help attr-list`
    comments = "italic",
    keywords = "italic",
    functions = "NONE",
    variables = "NONE",
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "transparent", -- style for sidebars, see below
    floats = "transparent", -- style for floating windows
  },
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors                                                  |
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**. |
  dim_inactive = false, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold                                                                                                  |

  --- You can override specific color groups to use other groups or a hex color                                                                                       |
  --- fucntion will be called with a ColorScheme table
  on_colors = function(colors) end,

  --- You can override specific highlights to use other groups or a hex color                                                                                       |
  --- fucntion will be called with a Highlights and ColorScheme table
  on_highlights = function(highlights, colors) end,
})



vim.cmd [[colorscheme tokyonight]]


-- Floats/Windows
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = "None", fg = "None" });
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = "None", fg = "#488DFF" });
vim.api.nvim_set_hl(0, 'WhichKeyFloat', { bg = "None", fg = "#488DFF" });
vim.api.nvim_set_hl(0, 'BufferTabpageFill', { fg = "None" });
vim.api.nvim_set_hl(0, 'VertSplit', { bg = "#16161e", fg = "#16161e" });
vim.api.nvim_set_hl(0, 'BqfPreviewBorder', { link = 'FloatBorder' })

-- Completion Menu Colors



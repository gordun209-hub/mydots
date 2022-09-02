vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_terminal_colors = true
vim.g.tokyonight_italic_keywords = true
vim.g.tokyonight_style = "night"
vim.g.tokyonight_transparent = true
vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_dark_float = true


local present, tk_colors = pcall(require, "tokyonight.colors")
if not present then
  return
end

local tokyonight_colors = tk_colors.setup({})
vim.g.tokyonight_colors = {
  border = '#1A1B26';
}

vim.cmd [[colorscheme tokyonight]]


-- Floats/Windows
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = "None", fg = "None" });
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = "None", fg = "#488DFF" });
vim.api.nvim_set_hl(0, 'WhichKeyFloat', { bg = "None", fg = "#488DFF" });
vim.api.nvim_set_hl(0, 'BufferTabpageFill', { fg = "None" });
vim.api.nvim_set_hl(0, 'VertSplit', { bg = "#16161e", fg = "#16161e" });
vim.api.nvim_set_hl(0, 'BqfPreviewBorder', { link = 'FloatBorder' })

-- Completion Menu Colors
local highlights = {
  CmpItemAbbr            = { fg = tokyonight_colors.dark3, bg = "NONE" },
  CmpItemKindClass       = { fg = tokyonight_colors.orange },
  CmpItemKindConstructor = { fg = tokyonight_colors.purple },
  CmpItemKindFolder      = { fg = tokyonight_colors.blue2 },
  CmpItemKindFunction    = { fg = tokyonight_colors.blue },
  CmpItemKindInterface   = { fg = tokyonight_colors.teal, bg = "NONE" },
  CmpItemKindKeyword     = { fg = tokyonight_colors.magneta2 },
  CmpItemKindMethod      = { fg = tokyonight_colors.red },
  CmpItemKindReference   = { fg = tokyonight_colors.red1 },
  CmpItemKindSnippet     = { fg = tokyonight_colors.dark3 },
  CmpItemKindVariable    = { fg = tokyonight_colors.cyan, bg = "NONE" },
  CmpItemKindText        = { fg = "LightGrey" },
  CmpItemMenu            = { fg = "#C586C0", bg = "NONE" },
  CmpItemAbbrMatch       = { fg = "#569CD6", bg = "NONE" },
  CmpItemAbbrMatchFuzzy  = { fg = "#569CD6", bg = "NONE" },
}

vim.api.nvim_set_hl(0, "CmpBorderedWindow_FloatBorder", { fg = tokyonight_colors.blue0 })

for group, hl in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, hl)
end

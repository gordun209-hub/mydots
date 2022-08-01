local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
  print("laa")
  return
end

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
require("catppuccin").setup({
  dim_inactive = {
    enabled = true,
    shade = "dark",
    percentage = 0.15,
  },

  transparent_background = false,
  term_colors = true,
  compile = {
    enabled = true,
    path = vim.fn.stdpath "cache" .. "/catppuccin",
  },
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = { "italic" },
    strings = {},
    variables = {},
    numbers = {},
    booleans = { "italic" },
    properties = {},
    types = {},
    operators = {},
  },
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
    cmp = true,
    lsp_saga = false,

    gitgutter = false,
    gitsigns = true,
    leap = false,
    telescope = true,
    -- nvimtree = {
    --   enabled = false,
    --   show_root = true,
    --   transparent_panel = false,
    -- },
    -- neotree = {
    --   enabled = false,
    --   show_root = true,
    --   transparent_panel = false,
    -- },
    -- dap = {
    --   enabled = false,
    --   enable_ui = false,
    -- },
    which_key = false,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
    dashboard = true,
    neogit = false,
    vim_sneak = false,
    fern = false,
    barbar = true,
    markdown = true,
    lightspeed = false,
    ts_rainbow = true,
    hop = false,
    notify = true,
    telekasten = true,
  },
  color_overrides = {},
  custom_highlights = {},
})

vim.cmd [[colorscheme catppuccin]]

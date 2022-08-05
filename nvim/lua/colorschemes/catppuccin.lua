local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
  return
end

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
require("catppuccin").setup({
  dim_inactive = {
    enabled = false,

  },

  transparent_background = true,
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
    lsp_saga = true,

    gitgutter = false,
    gitsigns = false,
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
      enabled = false,
    },
    dashboard = false,
    neogit = false,
    vim_sneak = false,
    fern = false,
    barbar = false,
    markdown = false,
    lightspeed = false,
    ts_rainbow = true,
    hop = false,
    notify = false,
    telekasten = false,
  },
  color_overrides = {},
  custom_highlights = {},
})

vim.cmd [[colorscheme catppuccin]]

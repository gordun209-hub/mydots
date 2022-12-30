return {
  {
    "fenetikm/falcon",
    lazy = false,
    config = function()
      vim.g.falcon_background = 0
      vim.g.falcon_inactive = 0
      vim.cmd([[colorscheme falcon]])
    end,
  },
}

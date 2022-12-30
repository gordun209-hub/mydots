return {

  -- statusline
  {

    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = {
      options = {
        globalstatus = true,
      },
    },
  },

  -- indent guides for Neovim
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = {
      char = "▏",
    },
  },
}

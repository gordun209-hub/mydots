return {

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      local navic = require("nvim-navic")
      local lualine = require("lualine")
      local symbols = require("gordun.config.settings")
      lualine.setup({
        options = {
          globalstatus = true,
          disabled_filetypes = { statusline = { "lazy", "alpha" } },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = {
            { "branch" },
          },
          lualine_c = {
            {
              "diagnostics",
              symbols = {
                error = symbols.icons.diagnostics.Error,
                warn = symbols.icons.diagnostics.Warn,
                info = symbols.icons.diagnostics.Info,
                hint = symbols.icons.diagnostics.Hint,
              },
            },
            { "filename", padding = { left = 1, right = 1 } },
            { navic.get_location, cond = navic.is_available },
          },
        },
      })
    end,
  },

  -- indent guides for Neovim
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = {
      char = "▏",
      filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
      show_trailing_blankline_indent = false,
      show_current_context = true,
    },
  },

  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },

 {
    "SmiteshP/nvim-navic",
    init = function()
      vim.g.navic_silence = true
      require("gordun.util").on_attach(function(client, buffer)
        if client.server_capabilities.documentSymbolProvider then
          require("nvim-navic").attach(client, buffer)
        end
      end)
    end,
    config = { separator = " ", highlight = true, depth_limit = 5 },
  },

  --icons
  "nvim-tree/nvim-web-devicons",

  -- ui components
  "MunifTanjim/nui.nvim",
}

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "ray-x/go.nvim",
    "ray-x/guihua.lua",
  },

  opts = {
    -- make sure mason installs the server
    servers = {
      gopls = {},
    },
    setup = {
      gopls = function(_, opts)
        require("go").setup({ server = opts })
        return true
      end,
    },
  },
}

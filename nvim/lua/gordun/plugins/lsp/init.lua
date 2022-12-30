local servers = require("gordun.plugins.lsp.servers")
local function on_attach(client, bufnr)
  require("gordun.plugins.lsp.format").on_attach(client, bufnr)
  require("gordun.plugins.lsp.mappings").on_attach(client, bufnr)
end

return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      { "folke/neodev.nvim", config = true },
      { "williamboman/mason.nvim", config = true },
      { "williamboman/mason-lspconfig.nvim", config = { ensure_installed = vim.tbl_keys(servers) } },
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local defaults = {
        on_attach = on_attach,
        capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
      }

      for server, opts in pairs(servers) do
        opts = vim.tbl_deep_extend("force", {}, defaults, opts or {})
        require("lspconfig")[server].setup(opts)
      end
    end,
  },

  {
    "MrcJkb/haskell-tools.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("haskell-tools").setup({})
    end,
  },
  -- formatters
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    config = function()
      local nls = require("null-ls")
      nls.setup({
        on_attach = on_attach,
        sources = {
          -- nls.builtins.formatting.prettierd,
          nls.builtins.formatting.stylua,
          nls.builtins.diagnostics.flake8,
        },
      })
    end,
  },
}

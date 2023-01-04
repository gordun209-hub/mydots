return {
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      { "williamboman/mason.nvim", config = true },
      { "williamboman/mason-lspconfig.nvim", config = { automatic_installation = true } },
      "hrsh7th/cmp-nvim-lsp",
    },
    servers = nil,
    config = function(plugin)
      -- setup formatting and keymaps
      require("gordun.util").on_attach(function(client, buffer)
        require("gordun.plugins.lsp.format").on_attach(client, buffer)
        require("gordun.plugins.lsp.keymaps").on_attach(client, buffer)
      end)

      for name, icon in pairs(require("gordun.config.icons").diagnostics) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end
      vim.diagnostic.config({
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
      })
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

      local servers = plugin.servers or require("gordun.plugins.lsp.servers")
      for server, opts in pairs(servers) do
        opts.capabilities = capabilities
        require("lspconfig")[server].setup(opts)
      end
    end,
  },

  {
    "rmagatti/goto-preview",
    config = function()
      require("goto-preview").setup({})
    end,
  },

  {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
  },
  -- {
  --   "MrcJkb/haskell-tools.nvim",
  --   dependencies = {
  --     "neovim/nvim-lspconfig",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim",
  --   },
  --   ft = "hs",
  --   config = function()
  --     require("haskell-tools").setup({})
  --   end,
  -- },
  -- formatters
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = { "mason.nvim" },
    config = function()
      local with_root_file = function(builtin, file)
        return builtin.with({
          condition = function(utils)
            return utils.root_has_file(file)
          end,
        })
      end
      local nls = require("null-ls")
      nls.setup({
        on_attach = on_attach,
        sources = {
          -- nls.builtins.formatting.prettierd,
          nls.builtins.formatting.stylua,
          nls.builtins.diagnostics.flake8,
          nls.builtins.code_actions.eslint,
          nls.builtins.code_actions.shellcheck,
          ---formatting
          nls.builtins.formatting.eslint_d,
          with_root_file(nls.builtins.formatting.stylua, "stylua.toml"),
          nls.builtins.formatting.shfmt,
          nls.builtins.formatting.rustfmt,
          nls.builtins.formatting.stylish_haskell,
          nls.builtins.formatting.ocamlformat,
          ---diagnostics
          nls.builtins.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),
          nls.builtins.diagnostics.zsh,
          nls.builtins.diagnostics.hadolint,
          nls.builtins.diagnostics.credo,
        },
      })
    end,
  },
  -- cmdline tools and lsp servers
  {

    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    ensure_installed = {
      "stylua",
      "shellcheck",
      "shfmt",
      "flake8",
    },
    config = function(plugin)
      require("mason").setup()
      local mr = require("mason-registry")
      for _, tool in ipairs(plugin.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end,
  },
}

local function on_attach(client, bufnr)
  require("gordun.plugins.lsp.format").on_attach(client, bufnr)
  require("gordun.plugins.lsp.mappings").on_attach(client, bufnr)
end

return {
  "simrat39/rust-tools.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  ft = "rust",
  config = function()
    require("rust-tools").setup({
      server = {
        on_attach = on_attach,
      },
    })
  end,
}

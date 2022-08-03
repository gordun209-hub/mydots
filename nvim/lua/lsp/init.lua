local typescript_ok, typescript = pcall(require, 'typescript')
require("lsp.mason") -- this installs servers
require("lsp.handlers").setup() -- this exposes handlers
local lspconfig = require("lspconfig")
require('lsp.null-ls')
require("lsp.lsp-signatures")
local util = require("lspconfig.util")
local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded", width = 60 }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded", widht = 60 })
}
local on_attach = require('lsp.handlers').on_attach
local capabilities = require('lsp.handlers').capabilities
if typescript_ok then
  typescript.setup({
    disable_commands = false, -- prevent the plugin from creating Vim commands
    --disable_formatting = false, -- disable tsserver's formatting capabilities
    debug = false, -- enable debug logging for commands
    server = {
      capabilities = require('lsp.settings.tsserver').capabilities,
      on_attach = require('lsp.settings.tsserver').on_attach,
      handlers = handlers
    }
  })
end

lspconfig.tailwindcss.setup {
  capabilities = capabilities,
  filetypes = require('lsp.settings.tailwindcss').filetypes,
  init_options = require('lsp.settings.tailwindcss').init_options,
  on_attach = require('lsp.settings.tailwindcss').on_attach,
  settings = require('lsp.settings.tailwindcss').settings,
}


lspconfig.eslint.setup {
  capabilities = capabilities,
  on_attach = require('lsp.settings.eslint').on_attach,
  settings = require('lsp.settings.eslint').settings,
  handlers = handlers,
  root_dir = util.root_pattern(
    ".eslintrc.js",
    ".eslintrc.cjs",
    ".eslintrc.yaml",
    ".eslintrc.yml",
    ".eslintrc.json"
  ),

}

lspconfig.sumneko_lua.setup {
  handlers = handlers,
  on_attach = on_attach,
  settings = require('lsp.settings.sumneko-lua').settings,
  capabilities = capabilities
}

lspconfig.html.setup {
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
  settings = require('lsp.settings.html').settings,
}
lspconfig.emmet_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  handlers = handlers,
  settings = require('lsp.settings.emmet-ls').settings,
}

lspconfig.bashls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  handlers = handlers,
  settings = require('lsp.settings.bashls').settings
}

lspconfig.racket_langserver.setup {
  root_dir = lspconfig.util.root_pattern(".git", "."),
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
}
--require('lsp.settings.rust').setup(on_attach, capabilities)

lspconfig.prismals.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  handlers = handlers,
}

-- lspconfig.clangd.setup {
--     capabilities = capabilities,
--     on_attach = on_attach,
-- }
-- lspconfig.purescriptls.setup {
--     capabilities = capabilities,
--     on_attach = on_attach,
-- }
-- lspconfig.rescriptls.setup {
--     capabilities = capabilities,
--     on_attach = on_attach,
-- }
-- lspconfig.hls.setup {
--     cmd = { 'haskell-language-server-wrapper', '--lsp' },
--     settings = {
--         haskell = {
--             formatter = 'fourmolu',
--         },
--     },
--     capabilities = capabilities,
--     on_attach = on_attach,
-- }
-- lspconfig.ltex.setup {
--     settings = {
--         filetypes = {
--             "markdown", "org", "norg", "plaintex", "rst", "gitcommit"
--         }
--     },
--     capabilities = capabilities,
--     on_attach = on_attach
-- }
-- lspconfig.elmls.setup {
--     capabilities = capabilities,
--     on_attach = on_attach
-- }

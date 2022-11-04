--require("lsp.mason") -- this installs servers
require("lsp.handlers").setup() -- this exposes handlers
local lspconfig = require("lspconfig")
local on_attach = require('lsp.handlers').on_attach
local capabilities = require('lsp.handlers').capabilities

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
})



lspconfig.eslint.setup {
    on_attach = require('lsp.settings.eslint').on_attach,
    settings = require('lsp.settings.eslint').settings,
}
lspconfig.sumneko_lua.setup {
    on_attach = on_attach,
    settings = require('lsp.settings.sumneko-lua').settings,
    capabilities = capabilities
}
--
lspconfig.bashls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = require('lsp.settings.bashls').settings
}
lspconfig.racket_langserver.setup {
    root_dir = lspconfig.util.root_pattern(".git", "."),
    capabilities = capabilities,
    on_attach = on_attach,
}
-- lspconfig.vls.setup {
--     capabilities = capabilities,
--     on_attach = on_attach
-- }
-- lspconfig.prismals.setup {
--     capabilities = capabilities,
--     on_attach = on_attach,
-- }
-- lspconfig.svelte.setup {
--     capabilities = capabilities,
--     on_attach = on_attach
-- }
lspconfig.yamlls.setup {
    settings = {
        yaml = {
            schemastore = {
                enable = true
            }
        }
    },
    capabilities = capabilities,
    on_attach = on_attach,
}
lspconfig.jsonls.setup({
    capabilities = capabilities,
    on_attach = function(client)
    end,
    settings = {
        json = {
            validate = { enable = true },
            schemas = require('schemastore').json.schemas(),
        },
    },
})
lspconfig.pyright.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
lspconfig.clangd.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

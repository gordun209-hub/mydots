local nls = require('null-ls')
local on_attach = require('lsp.handlers').on_attach
local capabilities = require('lsp.handlers').capabilities
local fmt = nls.builtins.formatting
local dgn = nls.builtins.diagnostics
-- Configuring null-ls
nls.setup({
    sources = {

        fmt.rustfmt,
        fmt.fixjson,
        fmt.stylish_haskell,
        dgn.mypy,
        fmt.black,
        -- dgn.golangci_lint,
        -- fmt.gofumpt,
        fmt.shfmt,
        dgn.zsh.with({
            filetypes = { "zshrc", ".zshrc" }
        }),
        dgn.jsonlint,
    },
    on_attach = on_attach,
    capabilities = capabilities
})

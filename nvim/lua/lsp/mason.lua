require("mason").setup {
    ui = {
        icons = {
            package_installed = "✓"
        }
    }
}
require("mason-lspconfig").setup {
    ensure_installed = {"shfmt","shellcheck", "typescript", "typescriptreact", "javascript","lua-language-server","luacheck","bash-language-server", "javascriptreact", "racket-langserver" },
}
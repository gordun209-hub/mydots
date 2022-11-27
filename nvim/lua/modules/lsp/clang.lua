local M = {}

M.setup = function(on_attach, capabilities)
    require('lspconfig').clangd.setup({
        on_attach = on_attach,
        capabilities = { offsetEncoding = "utf-8", capabilities }
    })
end

return M

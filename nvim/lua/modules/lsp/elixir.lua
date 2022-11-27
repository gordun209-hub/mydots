local M = {}

M.setup = function(on_attach, capabilities)
    require('lspconfig').elixirls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = {"/usr/bin/elixir-ls"}
    })

end

return M


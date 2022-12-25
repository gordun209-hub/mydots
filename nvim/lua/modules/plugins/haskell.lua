local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>

    if client.name == "hls" then
        vim.keymap.set('n', '<space>cr', vim.lsp.codelens.run, opts)
        vim.keymap.set('n', '<space>hs', ht.hoogle.hoogle_signature, opts)
        vim.keymap.set('n', '<leader>rr', ht.repl.toggle, def_opts)
        -- roggle a GHCi repl for the current buffer
        vim.keymap.set('n', '<leader>rf', function()
            ht.repl.toggle(vim.api.nvim_buf_get_name(0))
        end, def_opts)
        vim.keymap.set('n', '<leader>rq', ht.repl.quit, def_opts)
    end
    -- Mappings.
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', '<leader>G', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', '<leader>g', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-n>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>fa', function() vim.lsp.buf.format { async = true } end, bufopts)
end

ht.setup {
    hls = {
        -- See nvim-lspconfig's  suggested configuration for keymaps, etc.
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            haskell = { -- haskell-language-server options
                formattingProvider = 'stylish-haskell',
                checkProject = true, -- Setting this to true could have a performance impact on large mono repos.
            }
        }
    },
}

local settings = {
    Lua = {
        diagnostics = {
            globals = {
                'vim',
                'use',
                'describe',
                'it',
                'assert',
                'before_each',
                'after_each',
            },
        },
        completion = {
            showWord = 'Disable',
            callSnippet = 'Disable',
            keywordSnippet = 'Disable',
        },
        workspace = {
            checkThirdParty = false,
            library = {
                [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            },
        },
    },
}

local M = {}

M.setup = function(on_attach, capabilities)

    require('lspconfig').sumneko_lua.setup({
        on_attach = on_attach,
        settings = settings,
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = capabilities,
    })
end

return M

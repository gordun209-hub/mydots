local M = {}
local ht = require('haskell-tools')

M.setup = function(on_attach, capabilities)
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

end

return M

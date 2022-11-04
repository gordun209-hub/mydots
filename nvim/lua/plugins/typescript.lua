local typescript = require "typescript"
local on_attach = require('lsp.handlers').on_attach

typescript.setup({
    disable_commands = false, -- prevent the plugin from creating Vim commands
    --disable_formatting = false, -- disable tsserver's formatting capabilities
    debug = false, -- enable debug logging for commands
    server = {
        capabilities = require('lsp.settings.tsserver').capabilities,
        on_attach = on_attach
    }
})

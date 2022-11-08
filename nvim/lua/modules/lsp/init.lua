-- heavily inspired by jose-elias-alvarez config
-- https://github.com/jose-elias-alvarez/dotfiles/blob/main/config/nvim/lua/lsp/init.lua
local u = require('utils')
local lsp = vim.lsp
local border_opts = { border = 'rounded', focusable = false, scope = 'line' }

-- lsp comp items
lsp.protocol.CompletionItemKind = {
    Text = ' [text]',
    Method = ' [method]',
    Function = ' [function]',
    Constructor = ' [constructor]',
    Field = 'ﰠ [field]',
    Variable = ' [variable]',
    Class = ' [class]',
    Interface = ' [interface]',
    Module = ' [module]',
    Property = ' [property]',
    Unit = ' [unit]',
    Value = ' [value]',
    Enum = ' [enum]',
    Keyword = ' [key]',
    Snippet = ' [snippet]',
    Color = ' [color]',
    File = ' [file]',
    Reference = ' [reference]',
    Folder = ' [folder]',
    EnumMember = ' [enum member]',
    Constant = ' [constant]',
    Struct = ' [struct]',
    Event = '⌘ [event]',
    Operator = ' [operator]',
    TypeParameter = ' [type]',
}

-- handlers
lsp.handlers['textDocument/signatureHelp'] = lsp.with(lsp.handlers.signature_help, border_opts)
lsp.handlers['textDocument/hover'] = lsp.with(lsp.handlers.hover, border_opts)


--- on_attach
local on_attach = function(client, bufnr)
    -- commands
    u.buf_command(bufnr, 'LspDiagPrev', vim.diagnostic.goto_prev)
    u.buf_command(bufnr, 'LspDiagNext', vim.diagnostic.goto_next)
    u.buf_command(bufnr, 'LspDiagLine', vim.diagnostic.open_float)
    u.buf_command(bufnr, 'LspDiagQuickfix', vim.diagnostic.setqflist)
    u.buf_command(bufnr, 'LspSignatureHelp', vim.lsp.buf.signature_help)
    u.buf_command(bufnr, 'LspTypeDef', vim.lsp.buf.type_definition)
    u.buf_command(bufnr, 'LspDef', vim.lsp.buf.definition)
    u.buf_command(bufnr, 'LspRangeAct', vim.lsp.buf.code_action)
    u.buf_command(bufnr, 'LspAct', vim.lsp.buf.code_action)
    u.buf_command(bufnr, 'LspRename', function()
        vim.lsp.buf.rename()
    end)
    if client.name == 'rust-analyzer' then
        -- hover_with_actions has been deprecated from rust-tools settings
        u.buf_command(bufnr, 'LspHover', ':RustHoverActions<CR>')
    else
        u.buf_command(bufnr, 'LspHover', vim.lsp.buf.hover)
    end

    --- bindings
    u.buf_map(bufnr, 'n', '<leader>rn', ':LspRename<CR>')
    u.buf_map(bufnr, 'n', 'gd', ':LspDef<CR>')
    u.buf_map(bufnr, 'n', 'K', ':LspHover<CR>')
    u.buf_map(bufnr, 'n', '[d', ':LspDiagPrev<CR>')
    u.buf_map(bufnr, 'n', ']d', ':LspDiagNext<CR>')
    u.buf_map(bufnr, 'n', 'gl', ':LspDiagLine<CR>')
    u.buf_map(bufnr, 'n', '<leader>q', ':LspDiagQuickfix<CR>')
    u.buf_map(bufnr, 'i', 'gs', '<cmd>LspSignatureHelp<CR>')
    vim.keymap.set("n", "<leader>fa", "<cmd>lua vim.lsp.buf.format({async=true})<CR>")
    --- telescope
    u.buf_map(bufnr, 'n', '<leader>lr', ':Telescope lsp_references<CR>')
    u.buf_map(bufnr, 'n', '<leader>gd', ':Telescope lsp_type_definitions<CR>')
    u.buf_map(bufnr, 'n', '<leader>ca', '<cmd>LspAct<CR>')
    u.buf_map(bufnr, 'n', '<leader>CA', '<cmd>LspRangeAct<CR>')


    require('illuminate').on_attach(client)
end

-- capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities()

-- required servers
for _, server in ipairs({
    'bashls',
    'eslint',
    'jsonls',
    'tsserver',
    'null-ls',
    'rust-analyzer',
    'neodev',
}) do
    require('modules.lsp.' .. server).setup(on_attach, capabilities)
end

-- suppress lspconfig messages
local notify = vim.notify
vim.notify = function(msg, ...)
    if msg:match('%[lspconfig%]') then
        return
    end

    notify(msg, ...)
end

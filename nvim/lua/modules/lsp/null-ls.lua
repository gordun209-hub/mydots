-- null-ls
local null_ls = require('null-ls')
local b = null_ls.builtins

local with_root_file = function(builtin, file)
    return builtin.with({
        condition = function(utils)
            return utils.root_has_file(file)
        end,
    })
end

-- null-ls sources
local sources = {
    ---actions
    -- b.code_actions.gitrebase,
    b.code_actions.shellcheck,
    ---formatting
    b.formatting.eslint_d,
    b.formatting.prettier.with({
        disabled_filetypes = { 'typescript', 'typescriptreact' },
    }),
    with_root_file(b.formatting.stylua, 'stylua.toml'),
    b.formatting.shfmt,
    b.formatting.rustfmt,
    ---diagnostics
}

local M = {
    setup = function(on_attach, _)
        require('null-ls').setup({
            sources = sources,
            on_attach = on_attach,
        })
    end,
}

return M

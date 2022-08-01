local nls = require('null-ls')
local on_attach = require('lsp.handlers').on_attach
local capabilities = require('lsp.handlers').capabilities
local fmt = nls.builtins.formatting
local dgn = nls.builtins.diagnostics

-- Configuring null-ls
nls.setup({
  sources = {
    fmt.trim_whitespace.with({
      filetypes = { 'text', 'sh', 'zsh', 'toml', 'make', 'conf', 'tmux' },
    }),

    fmt.rustfmt,
    fmt.fixjson,
    fmt.shfmt,
    dgn.fish,
    fmt.fish_indent,
    dgn.shellcheck.with({ diagnostics_format = '#{m} [#{c}]' }),
    dgn.zsh.with({
      filetypes = { "zshrc", ".zshrc" }
    }),
    dgn.jsonlint,
    dgn.markdownlint,

    -- fmt.raco_fmt.with({
    --     filetypes = {'scheme', 'racket'}
    -- }),
    dgn.shellcheck.with({
      filetypes = {"sh","zsh"}
    }),
    fmt.prettier_d_slim.with({
      filetypes = { "yaml", "markdown", "css", "scss", "html", "json", "jsonc" }
    })
  },
  on_attach = on_attach,
  capabilities = capabilities
})

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "null-ls-info",
--   callback = function() vim.api.nvim_win_set_config(0, { border = "rounded" }) end,
-- })

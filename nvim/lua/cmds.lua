vim.api.nvim_create_autocmd("BufRead", { pattern = "*/node_modules/*", command = "lua vim.diagnostic.disable(0)" })
local autocmd = vim.api.nvim_create_autocmd
vim.api.nvim_create_autocmd("BufNewFile", { pattern = "*/node_modules/*", command = "lua vim.diagnostic.disable(0)" })
vim.api.nvim_create_autocmd("TextYankPost",
    { callback = function() vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 200 }) end })



autocmd('BufEnter', {
    desc = 'Do not auto comment on new line',
    command = 'set fo-=c fo-=r fo-=o',
})


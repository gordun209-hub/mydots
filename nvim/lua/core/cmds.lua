vim.api.nvim_create_autocmd("BufRead", { pattern = "*/node_modules/*", command = "lua vim.diagnostic.disable(0)" })
local autocmd = vim.api.nvim_create_autocmd
vim.api.nvim_create_autocmd("BufNewFile", { pattern = "*/node_modules/*", command = "lua vim.diagnostic.disable(0)" })
local highlight_group = vim.api.nvim_create_augroup("Highlight", { clear = true })
--local cmd             = vim.cmd cmd([[ autocmd FileType python,c,typescript javascript shiftwidth=2 tabstop=2 ]])
local group = vim.api.nvim_create_augroup("Utils", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost",
    { callback = function() vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 200 }) end })


vim.api.nvim_create_autocmd("BufWritePre", { desc = "fix all on save",
    pattern = "*.tsx,*.ts,*.jsx,*.js",
    command = "EslintFixAll",
    group = highlight_group,

})

autocmd('BufEnter', {
    desc = 'Do not auto comment on new line',
    command = 'set fo-=c fo-=r fo-=o',
})


--
vim.api.nvim_create_autocmd({ "VimEnter" }, {
    callback = function()
        vim.cmd "hi link illuminatedWord LspReferenceText"
    end,
})

vim.api.nvim_create_autocmd(
    "VimResized",
    {
        desc = "auto resize splited windows",
        pattern = "*",
        group = group,
        command = "tabdo wincmd =",
    }
)

vim.api.nvim_create_autocmd(
    "BufWinEnter",
    {
        desc = "clear the last used search pattern",
        pattern = "*",
        group = group,
        command = "let @/ = ''",
    }
)

local vimrc_group = vim.api.nvim_create_augroup("vimrc", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
    desc = "Don't auto commenting new lines",
    pattern = "*",
    command = "set fo-=c fo-=r fo-=o",
    group = vimrc_group,
})


local highlight_group = vim.api.nvim_create_augroup("Highlight", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight on yank",
    callback = function()
        vim.highlight.on_yank({ higrou = "IncSearch", timeout = 400 })
    end,
    group = highlight_group,
})

-- Run gofmt + goimport on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        require('go.format').goimport()
    end,
    group = vimrc_group,
})

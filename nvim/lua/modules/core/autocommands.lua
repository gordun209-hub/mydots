local autocmd = vim.api.nvim_create_autocmd

vim.api.nvim_create_augroup('Git', { clear = false })
vim.api.nvim_create_augroup('Filetypes', { clear = false })
vim.api.nvim_create_augroup('UI', { clear = false })

autocmd('BufEnter', {
    desc = 'Do not auto comment on new line',
    command = 'set fo-=c fo-=r fo-=o',
})



autocmd({ 'BufReadPost' }, {
    desc = 'return to last position known inside a buffer',
    pattern = '*',
    callback = function()

        local test_line = vim.api.nvim_buf_get_mark(0, '"')
        local last_line = vim.api.nvim_buf_line_count(0)

        if test_line[1] > 0 and test_line[1] <= last_line then
            vim.api.nvim_win_set_cursor(0, test_line)
        end
    end,
    group = vim.api.nvim_create_augroup('LastPosition', { clear = true }),
})

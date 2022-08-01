-- vim.g.Illuminate_delay = 0
-- vim.g.Illuminate_highlightUnderCursor = 0
vim.g.Illuminate_ftblacklist = {'alpha', 'NvimTree',"packer","help","qf"}
-- vim.g.Illuminate_highlightUnderCursor = 0nnnn
vim.api.nvim_set_keymap('n', '<a-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', {noremap=true})

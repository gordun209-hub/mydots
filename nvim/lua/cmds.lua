local autocmd = vim.api.nvim_create_autocmd



autocmd('BufEnter', {
  desc = 'Do not auto comment on new line',
  command = 'set fo-=c fo-=r fo-=o',
})



-- Highlight Yanked Text
vim.api.nvim_create_augroup("Highlight", { clear = true })
autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank({higroup='IncSearch', timeout=500, on_visual = true})",
  group = "Highlight",
  desc = "Highlight yanked text",
})

-- Run gofmt + goimport on save
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)


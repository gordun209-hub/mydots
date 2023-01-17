vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.autowrite = true -- enable auto write
vim.opt.clipboard = "unnamedplus" -- sync with system clipboard
vim.opt.cmdheight = 1
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.conceallevel = 3 -- Hide * markup for bold and italic
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.hidden = true -- Enable modified buffers in background
vim.opt.ignorecase = true -- Ignore case
vim.opt.laststatus = 0
vim.opt.number = true -- Print line number
vim.opt.pumheight = 10 -- Maximum number of entries in a popup
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.scrolloff = 4 -- Lines of context
vim.opt.shiftround = true -- Round indent
vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.showmode = false -- dont show mode since we have a statusline
vim.opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.opt.smartcase = true -- Don't ignore case with capitals
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.tabstop = 2 -- Number of spaces tabs count for
vim.opt.termguicolors = true -- True color support

vim.opt.undofile = true
vim.opt.undolevels = 10000

vim.opt.updatetime = 50
vim.opt.wrap = false -- Disable line wrap
-- fix markdown indentation settings
vim.g.markdown_recommended_style = 0

if vim.fn.has("nvim-0.9.0") == 1 then
  vim.opt.splitkeep = "screen"
  vim.opt.shortmess = "filnxtToOFWIcC"
end

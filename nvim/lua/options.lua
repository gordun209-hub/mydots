vim.opt.hlsearch = false

vim.opt.incsearch = true
vim.opt.breakindent = false
vim.opt.encoding = "utf-8"
vim.opt.updatetime = 100
vim.opt.redrawtime = 15000
vim.opt.autoindent = true
--vim.o.inccommand = "nosplit"
vim.opt.completeopt = "menuone,noselect"
--vim.o.clipboard = 'unnamedplus'
vim.opt.history = 100
vim.opt.startofline = false
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.tabstop = 2 -- Number of spaces tabs count for
vim.opt.softtabstop = 2
vim.opt.errorbells = false
vim.opt.nu = true -- Print line number
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.signcolumn = 'yes' -- 'auto:1-2'
vim.opt.cursorline = false
vim.opt.wrap = false
vim.opt.showmode = false
vim.opt.lazyredraw = true
vim.opt.emoji = false -- turn off as they are treated as double width characters
vim.opt.shortmess:append('c');
vim.opt.formatoptions:remove('c');
vim.opt.formatoptions:remove('r');
vim.opt.formatoptions:remove('o');
vim.opt.shell = "/usr/bin/bash"
vim.opt.cmdheight = 1
vim.opt.shada = "!,'300,<50,@100,s10,h"
-- Use filetype.lua instead
vim.opt.laststatus = 0
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true -- Save undo history
vim.opt.ignorecase = true -- Ignore case
vim.opt.smartcase = true -- Don't ignore case with capitals
vim.opt.scrolloff = 8 -- Lines of context
vim.opt.hidden = true -- Enable modified buffers in background
vim.opt.wildmenu = true
vim.opt.wildignore = {
  'node_modules',
  '.git,.svn',
}

vim.opt.ttimeout = true
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 10
vim.opt.mouse = 'a'
vim.g.netrw_banner = 0

vim.opt.hlsearch = false
vim.opt.encoding = "utf-8"
vim.scriptencoding = 'utf-8'
vim.opt.updatetime = 100
vim.opt.autoindent = true
vim.opt.pumheight = 15
vim.o.clipboard = 'unnamed'
vim.opt.history = 100
vim.opt.expandtab = true -- Use spaces instead of tabs vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.shiftwidth = 2
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.tabstop = 4 -- Number of spaces tabs count for
vim.opt.errorbells = false
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.signcolumn = 'yes' -- 'auto:1-2'
vim.opt.cursorline = false
vim.opt.wrap = false
vim.opt.linebreak = true
vim.wo.number = true
vim.opt.colorcolumn = '100'
vim.opt.whichwrap = 'h,l,<,>,[,],~'
vim.opt.showmode = false
vim.opt.lazyredraw = true
vim.opt.emoji = false -- turn off as they are treated as double width characters
vim.opt.formatoptions:remove('c');
vim.opt.formatoptions:remove('r');
vim.opt.formatoptions:remove('o');
vim.opt.shada = "!,'300,<50,@100,s10,h"
vim.o.foldcolumn = '1'
vim.opt.shortmess:append('c');
vim.opt.formatoptions:remove('c');
vim.opt.formatoptions:remove('r');
vim.opt.formatoptions:remove('o');
vim.opt.fillchars:append('stl: ');
vim.opt.fillchars:append('eob: ');
vim.opt.fillchars:append('fold: ');
vim.opt.fillchars:append('foldopen: ');
vim.opt.fillchars:append('foldsep: ');
vim.opt.fillchars:append('foldclose:');
vim.opt.fileencoding = "utf-8"
vim.opt.foldlevel = 1000
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.laststatus = 3
vim.opt.showbreak = '↳  '
vim.opt.listchars = 'tab:»·,nbsp:+,trail:·,extends:→,precedes:←'
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

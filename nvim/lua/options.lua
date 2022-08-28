vim.opt.hlsearch = false
vim.opt.incsearch = true
--vim.opt.breakindent = false
--vim.opt.breakindentopt = 'shift:2,min:20'
vim.opt.encoding = "utf-8"
-- vim.opt.updatetime = 100
-- vim.opt.redrawtime = 15000
vim.opt.autoindent = true
--vim.o.inccommand = "nosplit"
vim.opt.completeopt = "menuone,noselect"
vim.o.clipboard = 'unnamed'
vim.opt.history = 100
vim.opt.expandtab = true -- Use spaces instead of tabs vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.shiftwidth = 2
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.tabstop = 4 -- Number of spaces tabs count for
vim.opt.errorbells = false
--vim.opt.nu = true -- Print line number
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.signcolumn = 'yes' -- 'auto:1-2'
vim.opt.cursorline = false
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.colorcolumn = '100'
vim.opt.whichwrap = 'h,l,<,>,[,],~'
vim.opt.showmode = false
vim.opt.lazyredraw = true
vim.opt.emoji = false -- turn off as they are treated as double width characters
vim.opt.shortmess:append('c');
vim.opt.formatoptions:remove('c');
vim.opt.formatoptions:remove('r');
vim.opt.formatoptions:remove('o');
--vim.opt.cmdheight = 0
--vim.opt.cmdwinheight=5
--vim.opt.equalalways = false
--vim.opt.shada = "!,'300,<50,@100,s10,h"
vim.opt.textwidth = 80
vim.o.foldcolumn = '1'
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
-- Use
vim.opt.foldlevel = 1000
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.laststatus = 0
vim.opt.showbreak = '↳  '
vim.opt.listchars = 'tab:»·,nbsp:+,trail:·,extends:→,precedes:←'
--vim.opt.pumblend = 10
vim.opt.pumheight = 10
--vim.opt.winblend = 10
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

--vim.opt.ttimeout = true
-- vim.opt.timeoutlen = 500
-- vim.opt.ttimeoutlen = 10
vim.opt.mouse = 'a'
vim.cmd [[set nocompatible]]
vim.cmd [[set path+=** ]] -- Searches current directory recursively.

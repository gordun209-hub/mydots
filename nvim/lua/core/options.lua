vim.o.hlsearch = false
vim.o.incsearch = true
--vim.o.breakindent = false
vim.opt.encoding = "utf-8"
vim.o.updatetime = 50
vim.o.autoindent = true
vim.o.smartindent = true
--vim.o.inccommand = "nosplit"
vim.o.completeopt = "menu,menuone,noselect"
--vim.o.clipboard = 'unnamedplus'
vim.o.history = 100
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
vim.o.jumpoptions = 'view'
vim.opt.wrap = false
vim.opt.showmode = false
vim.opt.lazyredraw = true
vim.opt.emoji = false -- turn off as they are treated as double width characters
vim.opt.shortmess:append('c');
vim.opt.formatoptions:remove('c');
vim.opt.formatoptions:remove('r');
vim.opt.formatoptions:remove('o');
vim.o.relativenumber = true
vim.o.shell = "/usr/bin/bash"
vim.opt.cmdheight = 1
-- Use filetype.lua instead
vim.opt.laststatus = 3
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
--vim.opt.timeout = true
vim.o.timeoutlen = 300
--vim.opt.ttimeoutlen = 10
vim.opt.mouse = 'a'
--vim.g.netrw_banner = 0
vim.opt.shada = "!,'300,<50,@100,s10,h"
vim.opt.termguicolors = true
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
--vim.g.loaded_clipboard_provider=0
local disabled_built_ins = {
  "2html_plugin",
  "bugreport",
  "compiler",
  "ftplugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",

  "matchit",
  "netrw",
  "netrwFileHandlers",
  "netrwPlugin",
  "netrwSettings",
  "optwin",
  "rplugin",
  "rrhelper",
  "spellfile_plugin",
  "synmenu",
  "syntax",
  "tar",
  "tarPlugin",
  "tutor",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}
for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end


vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- global settings
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local options = {
    backup = false, -- creates a backup file
    clipboard = "unnamedplus,unnamed", -- allows neovim to access the system clipboard
    completeopt = { "menu", "menuone", "noselect" }, -- mostly just for cmp
    conceallevel = 0, -- so that `` is visible in markdown files
    hlsearch = false, -- highlight all matches on previous search pattern
    ignorecase = true, -- ignore case in search patterns
    mouse = "a", -- allow the mouse to be used in neovim
    pumheight = 10, -- pop up menu height
    showmode = false, -- we don't need to see things like -- INSERT -- anymore
    smartcase = true, -- smart case
    smartindent = true, -- make indenting smarter again
    splitbelow = true, -- force all horizontal splits to go below current window
    splitright = true, -- force all vertical splits to go to the right of current window
    swapfile = false, -- creates a swapfile
    termguicolors = true, -- set term gui colors (most terminals support this)
    undofile = true, -- enable persistent undo
    showtabline = 0, -- always show tabs
    winwidth = 30, -- set window width
    updatetime = 50, -- faster completion (4000ms default)
    writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true, -- convert tabs to spaces
    shiftwidth = 4, -- the number of spaces inserted for each indentation
    showcmd = false, -- display incomplete commands
    tabstop = 4, -- insert 2 spaces for a tab
    softtabstop = 4,
    hidden = true, -- Required to keep multiple buffers open multiple buffers
    smarttab = true, -- insert indents automatically
    autoindent = true, -- copy indent from current line
    cursorline = false, -- highlight the current line
    number = true, -- set numbered lines
    cmdheight = 0,
    wildmenu = true,
    relativenumber = true, -- set relative numbered lines
    signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
    wrap = false, -- display lines as one long line
    scrolloff = 8, -- is one of my fav
}
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.shortmess:append("c")
vim.o.ls = 3
vim.o.ch = 0
for key, value in pairs(options) do
    vim.opt[key] = value
end


-- Folding
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
-- vim.o.foldcolumn = "1"

-- Use ripgrep as grep tool
vim.o.grepprg = "rg --vimgrep --no-heading"
vim.o.grepformat = "%f:%l:%c:%m,%f:%l:%m"


-- Autom. read file when changed outside of Vim
vim.o.autoread = true

-- Autom. save file before some action
vim.o.autowrite = true

local disable_builtin_plugins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "matchit",
    "tar",
    "tarPlugin",
    "rrhelper",
    "spellfile_plugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
}

for _, builtin_plugin in ipairs(disable_builtin_plugins) do
    vim.g["loaded_" .. builtin_plugin] = 1
end

require('modules.packer')
require('modules.core')

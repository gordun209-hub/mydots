-- global settings
require("impatient").enable_profile()
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.markdown_fenced_languages = {
    "ts=typescript"
}
local options = {
    backup = false, -- creates a backup file
    clipboard = "unnamedplus,unnamed", -- allows neovim to access the system clipboard
    completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    conceallevel = 0, -- so that `` is visible in markdown files
    hlsearch = false, -- highlight all matches on previous search pattern
    ignorecase = true, -- ignore case in search patterns
    mouse = "a", -- allow the mouse to be used in neovim
    pumheight = 10, -- pop up menu height
    showmode = false, -- we don't need to see things like -- INSERT -- anymore
    smartcase = true, -- smart case
    swapfile = false, -- creates a swapfile
    termguicolors = true, -- set term gui colors (most terminals support this)
    history = 2000,
    showtabline = 0, -- always show tabs
    winwidth = 30, -- set window width
    splitright = true,
    splitbelow = true,
    updatetime = 50, -- faster completion (4000ms default)
    writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true, -- convert tabs to spaces
    undofile = true,
    shiftwidth = 4, -- the number of spaces inserted for each indentation
    showcmd = false, -- display incomplete commands
    tabstop = 4, -- insert 2 spaces for a tab
    softtabstop = 4,
    hidden = true, -- Required to keep multiple buffers open multiple buffers
    smarttab = true, -- insert indents automatically
    smartindent = true,
    autoindent = true, -- copy indent from current line
    cursorline = false, -- highlight the current line
    number = true, -- set numbered lines
    cmdheight = 0,
    relativenumber = true, -- set relative numbered lines
    signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
    wrap = false, -- display lines as one long line
    scrolloff = 8, -- is one of my fav
    -- these are new

}

vim.opt.shada = "!,'100,<50,s10,h,:1000,/1000"

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.shortmess:append("c")
for key, value in pairs(options) do
    vim.opt[key] = value
end

vim.opt.colorcolumn = '100'

vim.o.grepprg = "rg --vimgrep --no-heading"
vim.o.grepformat = "%f:%l:%c:%m,%f:%l:%m"

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25


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

local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
}


for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end
local config = {
    -- disable virtual text
    virtual_text = true,

    -- show signs
    signs = {
        active = signs,
    },
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
        focusable = true,
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
}

vim.diagnostic.config(config)
for _, builtin_plugin in ipairs(disable_builtin_plugins) do
    vim.g["loaded_" .. builtin_plugin] = 1
end

require('modules.packer')
require('modules.core')

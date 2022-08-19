--vim.g.loaded_clipboard_provider=0
--

require 'impatient'
vim.opt.termguicolors = true
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
require('packer_init')
require('options')
require('keymaps')
--require('cmds')
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



require 'impatient'.enable_profile()


require('lsp')
require('core.options')
require('core.keymaps')
require('core.cmds')
require('packer_init')


--vim.opt.shadafile = "NONE"
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

local o = vim.opt
-- global settings
o.shiftwidth = 4
o.completeopt = "menu,menuone,noselect"
o.tabstop = 4
o.expandtab = true
o.smartindent = true
o.undofile = true
o.cursorline = false
o.list = true
o.number = true
o.relativenumber = true
o.wrap = false
o.signcolumn = 'yes:1'
o.shortmess:append('cS')
o.hidden = true
o.ignorecase = true
o.joinspaces = false
o.scrolloff = 8
o.sidescrolloff = 8
o.shiftround = true
o.smartcase = true
o.splitbelow = true
o.splitright = true
o.updatetime = 50
o.inccommand = 'nosplit'
o.errorbells = false
o.swapfile = false
o.backup = false
o.showbreak = '↪'
o.termguicolors = true
o.colorcolumn = '80'
o.shada = "!,'100,<50,s10,h,:1000,/1000"
o.lazyredraw = true
o.foldlevel = 99
o.foldmethod = 'indent'

_G.global = {}
-- diagnostics
local border_opts = { border = 'rounded', focusable = false, scope = 'line' }

vim.diagnostic.config({ virtual_text = false, float = border_opts })
vim.fn.sign_define('DiagnosticSignError', { text = '✗', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '!', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInformation', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })


require("modules.core")
require("modules.plugins")
require("modules.lsp")

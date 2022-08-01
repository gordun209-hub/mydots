-- Enable highlight on search
vim.o.hlsearch = false
-- highlight match while typing search pattern
vim.o.incsearch = true

-- Make line numbers default
--vim.wo.number = true
vim.cmd [[set iskeyword+=-]]

-- Enable break indent
vim.o.breakindent = true



-- Save undo history
--vim.o.undolevels = 1000


-- Case insensitive searching UNLESS /C or capital in search

-- Decrease update time
vim.o.updatetime = 50
--vim.wo.signcolumn = "yes:2"
--vim.g.did_load_filetypes = 1

-- Use filetype.lua instead
-- Decrease redraw time
--vim.o.redrawtime = 100


-- Disable intro message


-- Do not source the default filetype.vim

-- Take indent for new line from previous line
vim.o.autoindent = true
vim.o.smartindent = true










--vim.o.cindent = true






-----------------------------------------------------------------------------//
-- Utils {{{1
-----------------------------------------------------------------------------//
vim.opt.sessionoptions = {
    'blank',
    'buffers',
    'curdir',
    'folds',
    'help',
    'options',
    'tabpages',
    'winsize',
    'resize',
    'winpos',
    'terminal',
}
vim.o.inccommand = "nosplit"

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"
-- Makes neovim and host OS clipboard play nicely with each other
vim.o.clipboard = 'unnamedplus,unnamed,unnamed'


-- Number of command-lines that are remembered
vim.o.history = 10000
-----------------------------------------------------------------------------//
-- Indentation {{{1
-----------------------------------------------------------------------------//
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.tabstop = 2 -- Number of spaces tabs count for
vim.opt.softtabstop = 2
vim.opt.shiftround = true -- Round indent
vim.opt.joinspaces = false -- No double spaces with join after a dot
-----------------------------------------------------------------------------//
-- Display {{{1
-----------------------------------------------------------------------------//
vim.opt.errorbells = false
vim.opt.colorcolumn = "80"
vim.opt.number = true -- Print line number
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.numberwidth = 2
vim.opt.signcolumn = 'yes:1' -- 'auto:1-2'
vim.opt.cursorline = true
vim.api.nvim_create_augroup('cursorline_focus', {})
vim.api.nvim_create_autocmd({ 'InsertLeave', 'WinEnter' }, {
    group = 'cursorline_focus',
    callback = function()
        vim.wo.cursorline = true
    end,
})
vim.api.nvim_create_autocmd({ 'InsertEnter', 'WinLeave' }, {
    group = 'cursorline_focus',
    callback = function()
        vim.wo.cursorline = false
    end,
})
vim.opt.wrap = false
vim.opt.linebreak = true -- wrap, but on words, not randomly
-- opt.textwidth = 80
--vim.opt.synmaxcol = 1024 -- don't syntax highlight long lines
--vim.g.no_plugin_maps = 1
vim.opt.showmode = false
vim.opt.lazyredraw = true
vim.opt.emoji = false -- turn off as they are treated as double width characters
--vim.opt.virtualedit = 'onemore' -- allow cursor to move past end of line in visual block mode, needed for my custom paste mapping
vim.opt.list = true -- show invisible characters
vim.opt.listchars = {
    eol = ' ', -- ¬↴
    tab = '→ ',
    extends = '…',
    precedes = '…',
    trail = '·',
}
vim.opt.shortmess:append 'I' -- disable :intro startup screen
-- Disable ins-completion-menu messages
vim.opt.shortmess:append("c")
vim.opt.shortmess:remove('r')
vim.opt.shortmess:remove('o')
-- Show (partial) command in status line
vim.o.showcmd = false

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append("<>hl")


-- Show absolute line number in front of each line
vim.o.relativenumber = true
vim.opt.laststatus = 3

-----------------------------------------------------------------------------//
-- Folds {{{1
-----------------------------------------------------------------------------//
vim.opt.foldtext = 'folds#render()'
vim.opt.foldopen:append { 'search' }
vim.opt.foldlevelstart = 10
vim.opt.foldmethod = 'marker' -- or 'syntax'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'


-----------------------------------------------------------------------------//
-- Backup {{{1
-----------------------------------------------------------------------------//
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true -- Save undo history


-----------------------------------------------------------------------------//
-- Search {{{1
-----------------------------------------------------------------------------//
vim.opt.ignorecase = true -- Ignore case
vim.opt.smartcase = true -- Don't ignore case with capitals
-- Use ripgrep as grep tool
vim.o.grepprg = "rg --vimgrep --no-heading"
vim.o.grepformat = "%f:%l:%c:%m,%f:%l:%m"

vim.opt.wrapscan = true -- Search wraps at end of file
vim.opt.scrolloff = 4 -- Lines of context
-- opt.sidescrolloff = 8 -- Columns of context
vim.opt.showmatch = true


-----------------------------------------------------------------------------//
-- window splitting and buffers {{{1
-----------------------------------------------------------------------------//
vim.opt.hidden = true -- Enable modified buffers in background
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.fillchars = {
    vert = '│',
    fold = ' ',
    diff = '╱', -- alternatives: ⣿ ░
    msgsep = '‾',
    foldopen = '▾',
    foldsep = '│',
    foldclose = '▸',
}


-----------------------------------------------------------------------------//
-- Wild and file globbing stuff in command mode {{{1
-----------------------------------------------------------------------------//
vim.opt.wildignorecase = true -- Ignore case when completing file names and directories
vim.opt.wildcharm = 26 -- equals set wildcharm=<C-Z>, used in the mapping section
vim.opt.wildmenu = true
-- Binary
vim.opt.wildignore = {
    '*.aux,*.out,*.toc',
    '*.o,*.obj,*.dll,*.jar,*.pyc,__pycache__,*.rbc,*.class',
    'node_modules',
    -- media
    '*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp',
    '*.avi,*.m4a,*.mp3,*.oga,*.ogg,*.wav,*.webm',
    '*.eot,*.otf,*.ttf,*.woff',
    '*.doc,*.pdf',
    -- archives
    '*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz',
    -- temp/system
    '*.*~,*~ ',
    '*.swp,.lock,.DS_Store,._*,tags.lock',
    -- version control
    '.git,.svn',
}
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 7 -- Make popup window translucent
vim.opt.pumheight = 20 -- Limit the amount of autocomplete items shown



-----------------------------------------------------------------------------//
-- Timings {{{1
-----------------------------------------------------------------------------//
vim.g.cursorhold_updatetime = 300
vim.opt.timeout = true
vim.o.timeoutlen = 300
--vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 10

-----------------------------------------------------------------------------//
-- Diff{{1
-----------------------------------------------------------------------------//
-- Use in vertical diff mode, blank lines to keep sides aligned, Ignore whitespace changes
vim.opt.diffopt:prepend {
    'vertical',
    'iwhite',
    'hiddenoff',
    'foldcolumn:0',
    'context:4',
    'algorithm:histogram',
    'indent-heuristic',
}

-----------------------------------------------------------------------------//
-- Mouse {{{1
-----------------------------------------------------------------------------//
vim.opt.mouse = 'a'

-----------------------------------------------------------------------------//
-- Netrw {{{1
-----------------------------------------------------------------------------//
-- do not display info on the top of window
vim.g.netrw_banner = 0

-----------------------------------------------------------------------------//
-- Colorscheme {{{1
-----------------------------------------------------------------------------//
vim.opt.termguicolors = true
vim.opt.guicursor = ""

-----------------------------------------------------------------------------//
-- Providers {{{1
-----------------------------------------------------------------------------//
-- disable some builtin providers we don't use

local globals = {
    dashboard_default_executive = "telescope", --- Use fuzzy search plugin in dashboard
    mapleader = " ", --- Map leader key to SPC
}


for k, v in pairs(globals) do
    vim.g[k] = v
end
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
-- disable some unused options
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

--vim.wo.colorcolumn = "80"

--vim.g.do_filetype_lua = 1
--vim.g.did_load_filetypes = 0

--vim.g.sexp_filetypes = "clojure,scheme,lisp,timl,fennel,janet,hy,racket"

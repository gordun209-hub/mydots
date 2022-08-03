local opts = { noremap = true, silent = true }
local action = require("lspsaga.codeaction")

local silent         = { silent = true }
local term_opts      = { silent = true }
local keymap         = vim.api.nvim_set_keymap
--Remap space as leader key
vim.g.mapleader      = " "
vim.g.maplocalleader = " "
keymap("n", "H", "^", silent)
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- Save file with ctrl + s
keymap("n", "<C-s>", ":w<CR>", silent)
keymap("i", "<C-s>", "<ESC> :w<CR>", silent)
---     Telescope
--keymap("n", "<leader>fg", "<CMD>Telescope git_branches<CR>", {})
keymap("n", "<leader>fk", "<CMD>Telescope keymaps<CR>", {})
keymap("n", "<leader>fc", "<CMD>Telescope commands<CR>", {})
keymap("n", "<leader>fp", "<cmd>lua require('telescope').extensions.projects.projects()<cr>", opts)
keymap("n", "<leader>fl", "<cmd>Telescope live_grep theme=ivy<cr>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
keymap("n", "<leader>fe", "<cmd>Telescope file_browser<cr>", opts)
keymap("n", "<leader>fr", "<cmd>lua require'telescope'.extensions.repo.list{fd_opts={'--no-ignore-vcs'}}<cr>", opts)
keymap("n", "<leader>rl", "<cmd> Telescope repo list<cr>", opts)
-- keymap(
--   "n",
--   "<leader>fb",
--   "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
--   opts
-- )
-- keymap(
--   "n",
--   "<leader>ff",
--   "<cmd> Fzf <cr>"
--   ,
--   opts
-- )
vim.api.nvim_set_keymap('n', '<leader>ff',
    "<cmd>lua require('fzf-lua').files()<CR>",
    { noremap = true, silent = true })
-- keymap("n", "<leader>ff", "<CMD>lua require('plugins.configs.telescope').project_files()<CR>",opts)
-- keymap("n", "<leader>ff", "<CMD>lua require('plugins.configs.telescope.pickers.multi-rg')()<CR>", opts)
keymap("n", "<Leader>fw",
  "<CMD>lua require('plugins.configs.telescope').project_files({ default_text = vim.fn.expand('<cword>'), initial_mode = 'normal' })<CR>"
  , opts)
-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
-- Navigate buffersbuffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
keymap("n", "c.", ":%s//g<Left><Left>", opts)
keymap("n", "\\c.", ":%s/\\<<C-r><C-w>\\>//g<Left><Left>", opts)
keymap("n", "<leader>'", "<cmd>1ToggleTerm size=15 direction=horizontal<cr>", opts)
-- Search and Replace
keymap("n", "c.", ":%s//g<Left><Left>", opts)
keymap("n", "\\c.", ":%s/\\<<C-r><C-w>\\>//g<Left><Left>", opts)
keymap("n", "-", "<cmd>Nnn<cr>", { noremap = true })
vim.api.nvim_set_keymap(
  "n",
  "<leader>ni",
  "<cmd>lua require('package-info').install()<cr>",
  { silent = true, noremap = true }
)
local expr = { expr = true, noremap = false, silent = false } -- more intuitive wildmenu navigation
-- command mode
vim.keymap.set('c', '<C-a>', '<Home>')
vim.keymap.set('c', '<C-e>', '<End>')
-- insert mode
vim.keymap.set('i', '<C-j>', '<Down>')
vim.keymap.set('i', '<C-k>', '<Up>')
vim.keymap.set('i', '<C-h>', '<Left>')
vim.keymap.set('i', '<C-l>', '<Right>')
-- Better indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
-- Move selected line / block of text in visual mode
-- shift + k to move up
-- shift + j to move down
vim.keymap.set('x', 'K', ':move \'<-2<CR>gv-gv')
vim.keymap.set('x', 'J', ':move \'>+1<CR>gv-gv')
-- ctrl + a: select all
vim.keymap.set('n', '<C-a>', '<esc>ggVG<CR>')
-- sensible defaults
vim.keymap.set('', 'Q', '') -- disable
vim.keymap.set('n', 'x', '"_x') -- delete char without yank
vim.keymap.set('x', 'x', '"_x') -- delete visual selection without yank
-- select last inserted text
vim.keymap.set('n', 'gV', [['`[' . strpart(getregtype(), 0, 1) . '`]']], expr)
-- quickfix navigation
vim.keymap.set('n', ']q', ':cnext<CR>')
vim.keymap.set('n', '[q', ':cprevious<CR>')
--  ctrl + / nohighlight
vim.keymap.set('n', '<C-_>', ':noh<CR>')
-- cycle tabs
vim.keymap.set('n', ']]', '<cmd>tabnext<CR>')
vim.keymap.set('n', '[[', '<cmd>tabprevious<CR>')


-- LSP
--keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", silent)
--keymap("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", silent)
--keymap("n", "<leader>cl", "<cmd>lua vim.diagnostic.open_float({ border = 'rounded', max_width = 100 })<CR>", silent)
--keymap("n", "L", "<cmd>lua vim.lsp.buf.signature_help()<CR>", silent)
--keymap("n", "]g", "<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded', max_width = 100 }})<CR>", silent)
--keymap("n", "[g", "<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded', max_width = 100 }})<CR>", silent)
-- keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", silent)
-- keymap("v", "<leader>ca", "<cmd>'<,'>lua vim.lsp.buf.range_code_action()<CR>", silent)
--keymap("n", "<C-Space>", "<cmd>lua vim.lsp.buf.code_action()<CR>", silent)
--keymap("v", "<leader>f", "<cmd>'<.'>lua vim.lsp.buf.range_formatting()<CR>", silent)
--keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", silent)
--keymap("n", "gr", "<cmd>lua vim.lsp.buf.references({ includeDeclaration = false })<CR>", silent)
keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", silent)


vim.keymap.set("n", "gh", require("lspsaga.finder").lsp_finder, { silent = true })
-- code action
vim.keymap.set("n", "<leader>ca", action.code_action, { silent = true })
vim.keymap.set("v", "<leader>ca", function()
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
  action.range_code_action()
end, { silent = true })
-- show hover doc and press twice will jumpto hover window
vim.keymap.set("n", "K", require("lspsaga.hover").render_hover_doc, { silent = true })
-- show signature help
vim.keymap.set("n", "L", require("lspsaga.signaturehelp").signature_help, { silent = true })
-- rename
vim.keymap.set("n", "gr", require("lspsaga.rename").lsp_rename, { silent = true })
-- preview definition
vim.keymap.set("n", "gd", require("lspsaga.definition").preview_definition, { silent = true })
vim.keymap.set("n", "<leader>cd", require("lspsaga.diagnostic").show_line_diagnostics, { silent = true })
vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
-- jump diagnostic
vim.keymap.set("n", "[g", require("lspsaga.diagnostic").goto_prev, { silent = true })
vim.keymap.set("n", "]g", require("lspsaga.diagnostic").goto_next, { silent = true })
-- or jump to error
vim.keymap.set("n", "[G", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
vim.keymap.set("n", "]G", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
vim.keymap.set("n", "<C-f>", function()
  action.smart_scroll_with_saga(1)
end, { silent = true })
-- scroll up hover doc
vim.keymap.set("n", "<C-b>", function()
  action.smart_scroll_with_saga(-1)
end, { silent = true })

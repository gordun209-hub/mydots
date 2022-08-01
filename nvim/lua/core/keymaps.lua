local opts = { noremap = true, silent = true }
local silent = { silent = true }
local term_opts = { silent = true }

local cmd            = vim.cmd
local command        = vim.api.nvim_create_user_command
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
-- keymap("n", "<leader>fg", "<CMD>Telescope git_branches<CR>", {})
-- keymap("n", "<leader>fk", "<CMD>Telescope keymaps<CR>", {})
-- keymap("n", "<leader>fc", "<CMD>Telescope commands<CR>", {})
-- keymap("n", "<leader>fp", "<cmd>lua require('telescope').extensions.projects.projects()<cr>", opts)
-- keymap("n", "<leader>fl", "<cmd>Telescope live_grep theme=ivy<cr>", opts)
-- keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
-- keymap("n", "<leader>fe", "<cmd>Telescope file_browser<cr>", opts)
-- keymap("n", "<leader>fr", "<cmd>lua require'telescope'.extensions.repo.list{fd_opts={'--no-ignore-vcs'}}<cr>", opts)
-- keymap("n", "<leader>rl", "<cmd> Telescope repo list<cr>", opts)
-- keymap(
--   "n",
--   "<leader>fb",
--   "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
--   opts
-- )
-- keymap(
--   "n",
--   "<leader>ff",
--   "<cmd> Telescope find_files <cr>"
--   ,
--   opts
-- )
--
-- -- keymap("n", "<leader>ff", "<CMD>lua require('plugins.configs.telescope').project_files()<CR>",opts)
-- -- keymap("n", "<leader>ff", "<CMD>lua require('plugins.configs.telescope.pickers.multi-rg')()<CR>", opts)
-- keymap("n", "<Leader>fw",
--   "<CMD>lua require('plugins.configs.telescope').project_files({ default_text = vim.fn.expand('<cword>'), initial_mode = 'normal' })<CR>"
--   , opts)
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

-- Visual Block --
-- -- Move text up and down
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<L>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<H>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
-- search and replace
keymap("n", "c.", ":%s//g<Left><Left>", opts)
keymap("n", "\\c.", ":%s/\\<<C-r><C-w>\\>//g<Left><Left>", opts)

keymap("n", "<leader>'", "<cmd>1ToggleTerm size=15 direction=horizontal<cr>", opts)
-- TROUBLE SHORTCUTS
--vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>Trouble<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tw", "<cmd>Trouble workspace_diagnostics<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>td", "<cmd>Trouble document_diagnostics<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tl", "<cmd>Trouble loclist<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tq", "<cmd>Trouble quickfix<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tr", "<cmd>Trouble lsp_references<cr>", { silent = true, noremap = true })

-- Show package versions
--
-- Search and Replace
keymap("n", "c.", ":%s//g<Left><Left>", opts)
keymap("n", "\\c.", ":%s/\\<<C-r><C-w>\\>//g<Left><Left>", opts)

-- new_keymap("n", "<Leader>pr", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", silent)
-- new_keymap("v", "<Leader>pr", "<cmd>lua require('spectre').open_visual()<CR>")
-- lir
keymap("n", "-", "<cmd>:e %:h<cr>", { noremap = true })

-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
vim.api.nvim_set_keymap(
  "n",
  "<leader>ni",
  "<cmd>lua require('package-info').install()<cr>",
  { silent = true, noremap = true }
)

-- <space><space> switches between buffers
-- vim.keymap.set('n', '<leader><leader>', ':b#<CR>')

-- Disable hjkl (get used to sneak)
-- vim.keymap.set('n', 'j', '<Nop>')
-- vim.keymap.set('n', 'k', '<Nop>')
-- vim.keymap.set('n', 'h', '<Nop>')
-- vim.keymap.set('n', 'l', '<Nop>')



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

-- navigate paragraphs without altering jumplist


-- alternate file
vim.keymap.set('n', '<C-6>', '<C-^>')

-- sensible defaults
vim.keymap.set('', 'Q', '') -- disable
vim.keymap.set('n', 'x', '"_x') -- delete char without yank
vim.keymap.set('x', 'x', '"_x') -- delete visual selection without yank

-- paste in visual mode and keep available
vim.keymap.set('x', 'p', [['pgv"'.v:register.'y`>']], expr)
vim.keymap.set('x', 'P', [['Pgv"'.v:register.'y`>']], expr)
-- select last inserted text
vim.keymap.set('n', 'gV', [['`[' . strpart(getregtype(), 0, 1) . '`]']], expr)

-- Vimdiff as mergetool
vim.keymap.set('n', '<leader>1', ':diffget //1<CR>')
vim.keymap.set('n', '<leader>2', ':diffget //2<CR>')
vim.keymap.set('n', '<leader>3', ':diffget //3<CR>')

-- quickfix navigation
vim.keymap.set('n', ']q', ':cnext<CR>')
vim.keymap.set('n', '[q', ':cprevious<CR>')

--  ctrl + / nohighlight
vim.keymap.set('n', '<C-_>', ':noh<CR>')

-- cycle tabs
vim.keymap.set('n', ']]', '<cmd>tabnext<CR>')
vim.keymap.set('n', '[[', '<cmd>tabprevious<CR>')


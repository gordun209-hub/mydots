local opts = { noremap = true, silent = true }

local silent    = { silent = true }
local term_opts = { silent = true }
local keymap    = vim.api.nvim_set_keymap
keymap("n", "H", "^", silent)
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- Save file with ctrl + s
keymap("n", "<C-s>", ":w<CR>", silent)
keymap("i", "<C-s>", "<ESC> :w<CR>", silent)

-- vim.api.nvim_set_keymap(
--     'n',
--     '<C-p>',
--     ":lua require'telescope'.extensions.project.project{}<CR>",
--     { noremap = true, silent = true }
-- )
keymap("n", "<leader>fk", "<CMD>Telescope keymaps<CR>", {})
keymap("n", "<leader>fc", "<CMD>Telescope commands<CR>", {})
--keymap("n", "<leader>fp", "<cmd>lua require('telescope').extensions.projects.projects()<cr>", opts)
keymap("n", "<leader>fl", "<cmd>Telescope live_grep theme=ivy<cr>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
keymap("n", "<leader>fe", "<cmd>Telescope file_browser<cr>", opts)
--keymap("n", "<leader>fr", "<cmd>lua require'telescope'.extensions.repo.list{fd_opts={'--no-ignore-vcs'}}<cr>", opts)
keymap("n", "<leader>rl", "<cmd>Telescope repo list<cr>", opts)
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
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
-- Search and Replace
keymap("n", "c.", ":%s//g<Left><Left>", opts)
keymap("n", "\\c.", ":%s/\\<<C-r><C-w>\\>//g<Left><Left>", opts)
keymap("n", "-", "<cmd>Lf<cr>", { noremap = true })
-- Move selected line / block of text in visual mode
-- ctrl + a: select all
vim.keymap.set('n', '<C-a>', '<esc>ggVG<CR>')
-- sensible defaults
vim.keymap.set('', 'Q', '') -- disable
vim.keymap.set('n', 'x', '"_x') -- delete char without yank
vim.keymap.set('x', 'x', '"_x') -- delete visual selection without yank
-- quickfix navigation
vim.keymap.set('n', ']q', ':cnext<CR>')
vim.keymap.set('n', '[q', ':cprevious<CR>')
--  ctrl + / nohighlight
-- cycle tabs
vim.keymap.set('n', ']]', '<cmd>tabnext<CR>')
vim.keymap.set('n', '[[', '<cmd>tabprevious<CR>')

keymap("n", "<leader>fa", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", silent)

-- Suggested keymaps that do not depend on haskell-language-server
-- Toggle a GHCi repl for the current package

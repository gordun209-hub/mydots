--- Mappings
local u = require('utils')

-- map key
vim.g.mapleader = ' '


-- fix indentation

-- easier windows jump
u.map('n', '<C-Left>', '<C-w>h')
u.map('n', '<C-Right>', '<C-w>l')
u.map('n', '<C-Down>', '<C-w>j')
u.map('n', '<C-Up>', '<C-w>k')

--- Resize windows
u.map('n', '<leader>+', '<cmd>vertical resize +10<cr>')
u.map('n', '<leader>-', '<cmd>vertical resize -10<cr>')

u.map('n', '<space>+', '<cmd>resize +5<cr>')
u.map('n', '<space>-', '<cmd>resize -5<cr>')

--- Quick file save
u.map("n", "<C-s>", ":w<CR>")
u.map("i", "<C-s>", ":<ESC> :w<CR>")
u.map("n", "-", "<cmd>Nnn<cr>")
-- Format

--- Git
u.map('n', '<leader>gh', ':diffget //3<cr>')
u.map('n', '<leader>gu', ':diffget //2<cr>')


--- move current line up/down
u.map('v', 'J', ":m '>+1<CR>gv=gv")
u.map('v', 'K', ":m '<-2<CR>gv=gv")


-- close current window



u.map("n", "<leader>fk", "<CMD>Telescope keymaps<CR>")
u.map("n", "<leader>fc", "<CMD>Telescope commands<CR>")
--keymap("n", "<leader>fp", "<cmd>lua require('telescope').extensions.projects.projects()<cr>", opts)
u.map("n", "<leader>fl", "<cmd>Telescope live_grep theme=ivy<cr>")
u.map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
u.map("n", "<leader>fe", "<cmd>Telescope file_browser<cr>")
--keymap("n", "<leader>fr", "<cmd>lua require'telescope'.extensions.repo.list{fd_opts={'--no-ignore-vcs'}}<cr>", opts)
u.map("n", "<leader>rl", "<cmd>Telescope repo list<cr>")
u.map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
u.map("n", "<leader>fs", "<cmd>Telescope grep_string<cr>")

u.map("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
u.map("n", "<leader>o", "<cmd>Telescope history<cr>")



--git * commands
u.command('BCommits', 'Telescope git_bcommits')
u.command('Commits', 'Telescope git_commits')
u.command('Branchs', 'Telescope git_branches')
u.command('GStatus', 'Telescope git_status')

u.map('n', '<Leader>gc', '<cmd>Commits<CR>')
u.map('n', '<Leader>gp', '<cmd>BCommits<CR>')
u.map('n', '<Leader>gb', '<cmd>Branchs<CR>')
u.map('n', '<Leader>gs', '<cmd>GStatus<CR>')

--help commands
u.command('ManPages', 'Telescope man_pages')

u.map('n', '<leader>m', ':ManPages<CR>')

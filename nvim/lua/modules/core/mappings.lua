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

--- keep text selected after indentation
u.map('v', '<', '<gv')
u.map('v', '>', '>gv')

--- move current line up/down
u.map('v', 'J', ":m '>+1<CR>gv=gv")
u.map('v', 'K', ":m '<-2<CR>gv=gv")


-- close current window
u.map('n', '<C-c><C-c>', '<cmd>close<cr>')

--- Copy-paste
u.map('v', '<leader>p', '"_dP')
u.map('n', '<leader>y', '"+y')
u.map('v', '<leader>y', '"+y')
u.map('n', '<leader>Y', 'gg"+yG')
u.map('n', '<leader>d', '"_d')
u.map('v', '<leader>d', '"_d')

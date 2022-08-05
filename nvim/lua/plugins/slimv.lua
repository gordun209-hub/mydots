-- Change leader key so it doesn't clash with comma leader
vim.g.slimv_leader = '\\'

vim.g.slimv_swank_cmd = '!tmux new-window -d -n REPL-SBCL "sbcl --load ~/.local/share/nvim/site/pack/packer/start/slimv/slime/start-swank.lisp"'

-- Change REPL to vertical split
vim.g.slimv_repl_split=4

-- Enable rainbow parenthesis
vim.g.lisp_rainbow=1

vim.g.slimv_impl = 'sbcl'

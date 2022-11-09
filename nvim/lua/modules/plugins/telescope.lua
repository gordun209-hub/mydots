-- https://github.com/nvim-telescope/telescope.nvim
local u = require('utils')
local telescope_ok, telescope = pcall(require, 'telescope')

if not telescope_ok then
    u.notif('Plugins :', 'Something went wrong with telescope', vim.log.levels.WARN)
    return
else
    telescope.setup({
        defaults = {
            prompt_prefix = '❯ ',
            selection_caret = '❯ ',
            sorting_strategy = 'ascending',
            vimgrep_arguments = {
                'rg',
                '--color=never',
                '--no-heading',
                '--with-filename',
                '--line-number',
                '--column',
                '--smart-case',
                '--ignore',
                '--hidden',
                '-g',
                '!.git',
            },
            mappings = {
                i = {
                    ['<C-u>'] = false,
                    ['<C-d>'] = false,
                },
            },
        },
        pickers = {
            git_files = {
                show_untracked = true,
            },
        },
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
            },
        },
    })


    --find * commands/mappings


    -- extensions mappings/commands

    require('telescope').load_extension('project')
 --   require('telescope').load_extension('lazygit')
    require('telescope').load_extension('ui-select')

    u.command('Project', 'Telescope project')
    u.map('n', '<C-p>', '<cmd>Project<CR>')

end

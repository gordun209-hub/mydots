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

    -- generic mappings
    u.map('n', '<Leader>T', ':Telescope<CR>')

    --find * commands/mappings
    u.command('Files', 'Telescope find_files')
    u.command('Rg', 'Telescope live_grep')
    u.command('GrepStr', 'Telescope grep_string')
    u.command('BLines', 'Telescope current_buffer_fuzzy_find')
    u.command('History', 'Telescope oldfiles')
    u.command('Buffers', 'Telescope buffers')

    u.map('n', '<Leader>ff', '<cmd>Files<CR>')
    u.map('n', '<Leader>fl', '<cmd>Rg<CR>')
    u.map('n', '<Leader>fs', '<cmd>GrepStr<CR>')
    u.map('n', '<Leader>b', '<cmd>Buffers<CR>')
    u.map('n', '<Leader>o', '<cmd>History<CR>')

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
    u.command('HelpTags', 'Telescope help_tags')
    u.command('ManPages', 'Telescope man_pages')

    u.map('n', '<Leader>H', ':HelpTags<CR>')
    u.map('n', '<leader>m', ':ManPages<CR>')

    -- lsp mappings/commands
    u.map('n', '<Leader>ls', '<cmd>LspSym<CR>')
    u.command('LspRef', 'Telescope lsp_references')
    u.command('LspDef', 'Telescope lsp_definitions')
    u.command('LspSym', 'Telescope lsp_workspace_symbols')


    -- extensions mappings/commands

    require('telescope').load_extension('project')
 --   require('telescope').load_extension('lazygit')
    require('telescope').load_extension('ui-select')

    u.command('Project', 'Telescope project')
    u.map('n', '<C-p>', '<cmd>Project<CR>')

end

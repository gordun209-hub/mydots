local treesitter_ok, treesitter = pcall(require, 'nvim-treesitter.configs')

if not treesitter_ok then
    print("laa")
    return
else
    treesitter.setup({
        ensure_installed = 'all',
        highlight = {
            enable = true,
            use_languagetree = true,
            additional_vim_regex_highlighting = false
        },
        rainbow = {
            enable = true,
            extended_mode = true,
            max_file_lines = 2000,
        },
        matchup = {
            enable = true
        },
        sync_install = true,
        autotag = { enable = true },
    })
end

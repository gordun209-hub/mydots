require "staline".setup {
    sections = {
        left = { '  ', 'mode', ' ', 'branch', ' ', 'lsp' },
        mid = {},
        right = { 'file_name', 'line_column' }
    },
    mode_colors = {
        i = "#c0daf5",
        n = "#7aa2f7",
        c = "#8fbf7f",
        v = "#fc802d",
    },
    defaults = {
        true_colors = true,
        line_column = " [%l/%L] :%c  ",
        branch_symbol = " "
    }
}

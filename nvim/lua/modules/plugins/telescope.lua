require('telescope').setup {
    mappings = {
        i = {
            ["<esc>"] = require("telescope.actions").close,
            ["<S-Up>"] = require("telescope.actions").preview_scrolling_up,
            ["<S-Down>"] = require("telescope.actions").preview_scrolling_down,
            ["<PageDown>"] = require("telescope.actions").cycle_history_next,
            ["<PageUp>"] = require("telescope.actions").cycle_history_prev,
        },
    },
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    vimgrep_arguments = {
        "rg",
        "-L",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--trim",
        "--glob=!.git/",
        "--glob=!.yarn/",
        "--glob=!package-lock.json",
        "--glob=!yarn.lock"
    },
    scroll_strategy = "cycle",
    layout_strategy = "horizontal",

    layout_config = {
        prompt_position = "bottom",
        horizontal = { preview_width = 0.6, results_width = 0.8 },
        width = 0.95,
        height = 0.95,
        preview_cutoff = 120,
    },
    file_ignore_patterns = { "node_modules", "^.git/", "_build", "_build", "deps", "credo" },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,

    pickers = { find_files = { hidden = true } },
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case" -- or "ignore_case" or "respect_case"
        },
        live_grep_args = {
            auto_quoting = true,
            mappings = {
                i = {
                    ["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
                    ["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({ postfix = " --iglob " }),
                },
            },
        }
    }
}



require 'telescope'.load_extension('project')
require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')
require('telescope').load_extension("live_grep_args")

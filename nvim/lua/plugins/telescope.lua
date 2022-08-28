require('telescope').setup({
  defaults = {
    prompt_prefix = "   ",
    selection_caret = " ",
    file_ignore_patterns = {
      ".git\\",
      "/node_modules*",
      "public",
      "dist",
    },

    layout_config = {
      horizontal = { prompt_position = 'top', results_width = 0.6, preview_width = 0.55 },
      vertical = { mirror = false },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    sorting_strategy = 'ascending',
    winblend = 0,
    color_devicons = true,
    use_less = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    path_display = { "absolute" },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case" -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  }
})
require 'telescope'.load_extension('project')
require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')

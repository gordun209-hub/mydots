  require('telescope').setup({
    defaults = {
      selection_caret = ' ',
      layout_config = {
        horizontal = { prompt_position = 'top', results_width = 0.6 },
        vertical = { mirror = false },
      },
      sorting_strategy = 'ascending',
      file_previewer = require('telescope.previewers').vim_buffer_cat.new,
      grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
      qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    },
    extensions = {
    },
  })
  require'telescope'.load_extension('project')
  --require('telescope').load_extension('dotfiles')
  --require('telescope').load_extension('gosource')
  require('telescope').load_extension('file_browser')


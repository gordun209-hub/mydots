local actions    = require "telescope.actions"
local previewers = require('telescope.previewers')
local builtin    = require('telescope.builtin')
local icons      = require('plugins.icons')
local M          = {}
local git_icons  = {
  added = icons.gitAdd,
  changed = icons.gitChange,
  copied = ">",
  deleted = icons.gitRemove,
  renamed = "➡",
  unmerged = "‡",
  untracked = "?",
}



require('telescope').setup {
  defaults = {
    vimgrep_arguments    = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number", "--column",
      "--smart-case",
      "--hidden",
      "--trim",
      "--glob=!.git/",
      "--glob=!package-lock.json",
    },
    pickers              = {

      live_grep = {
        theme = "dropdown",
      },
      grep_string = {
        theme = "dropdown",
      },
      find_files = {
        theme = "dropdown",
        previewer = false,
        hidden = true,
      },
      buffers = {
        theme = "dropdown",
        previewer = false,
        initial_mode = "normal",
      },
      planets = {
        show_pluto = true,
      },
      colorscheme = {
        -- enable_preview = true,
      },
      lsp_references = {
        theme = "dropdown",
        initial_mode = "normal",
      },
      lsp_definitions = {
        theme = "dropdown",
        initial_mode = "normal",
      },
      lsp_declarations = {
        theme = "dropdown",
        initial_mode = "normal",
      },
      lsp_implementations = {
        theme = "dropdown",
        initial_mode = "normal",
      },


      -- Default configuration for builtin pickers goes here:
      -- picker_name = {
      --   picker_config_key = value,
      --   ...
      -- }
      -- Now the picker_config_key will be applied every time you call this
      -- builtin picker
    },
    layout_config        = {
      prompt_position = "bottom",
      horizontal = { preview_width = 0.6, results_width = 0.8 },
      width = 0.95,
      height = 0.95,
      preview_cutoff = 120,
    },
    set_env              = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_sorter          = require('telescope.sorters').get_fzy_sorter,
    generic_sorter       = require("telescope.sorters").get_generic_fuzzy_sorter,
    file_previewer       = require("telescope.previewers").vim_buffer_cat.new,
    use_less             = true,
    sorting_strategy     = "descending",
    file_ignore_patterns = { "node_modules", "yarn.lock", ".yarn", "package-lock.json", ".next", ".git/", "dist/",
      "build/", "migrations/" },
    prompt_prefix        = ' 🔍 ',
    color_devicons       = true,
    git_icons            = git_icons,
    selection_strategy   = "reset",
    layout_strategy      = "horizontal",
    grep_previewer       = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer     = require('telescope.previewers').vim_buffer_qflist.new,

    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<C-s>"] = actions.cycle_previewers_next,
        ["<C-a>"] = actions.cycle_previewers_prev,
        ["<C-h>"] = "which_key",
        ["<ESC>"] = actions.close,
      },
      n = {
        ["<C-s>"] = actions.cycle_previewers_next,
        ["<C-a>"] = actions.cycle_previewers_prev,
      }
    }
  },
  extensions = {
    project = {
      hidden_files = false,

    },
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },

    ['ui-select'] = {
      require('telescope.themes').get_cursor { -- or get_dropdown
        winblend = 0,
        initial_mode = 'normal',
      },
    },
    packer = {
      theme = "ivy",
      layout_config = {
        height = .5
      }
    }
  }
}
require('telescope').load_extension('packer')
require('telescope').load_extension('fzf')
require('telescope').load_extension('repo')
require('telescope').load_extension('ui-select')
require('telescope').load_extension('gh')
-- set_highlight({
--   list = {
--     { group = "TelescopePromptCounter", foreground = colors.orange },
--     { group = "TelescopeResultsLineNr", foreground = colors.white },
--   },
-- })

-- Implement delta as previewer for diffs


local delta_bcommits = previewers.new_termopen_previewer {
  get_command = function(entry)
    return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'diff', entry.value .. '^!', '--',
      entry.current_file }
  end
}

local delta = previewers.new_termopen_previewer {
  get_command = function(entry)
    return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'diff', entry.value .. '^!' }
  end
}

M.my_git_commits = function(opts)
  opts = opts or {}
  opts.previewer = {
    delta,
    previewers.git_commit_message.new(opts),
    previewers.git_commit_diff_as_was.new(opts),
  }

  builtin.git_commits(opts)
end

M.my_git_bcommits = function(opts)
  opts = opts or {}
  opts.previewer = {
    delta_bcommits,
    previewers.git_commit_message.new(opts),
    previewers.git_commit_diff_as_was.new(opts),
  }

  builtin.git_bcommits(opts)
end



M.project_files = function(opts)
  opts = opts or {} -- define here if you want to define something
  local ok = pcall(require "telescope.builtin".git_files, opts)
  if not ok then require "telescope.builtin".find_files(opts) end
end

M.telescope_grep = function()
  require('telescope.builtin').live_grep {
    path_display = {},
    layout_strategy = 'horizontal',
    layout_config = { preview_width = 0.4 },
  }
end
M.command_history = function()
  builtin.command_history(
    require('telescope.themes').get_dropdown({
      color_devicons = true,
      winblend       = 4,
      layout_config  = {
        width = function(_, max_columns, _)
          return math.min(max_columns, 150)
        end,

        height = function(_, _, max_lines)
          return math.min(max_lines, 15)
        end,
      },
    }))
end
M.grep_string_visual = function()
  local visual_selection = function()
    local save_previous = vim.fn.getreg("a")
    vim.api.nvim_command('silent! normal! "ay')
    local selection = vim.fn.trim(vim.fn.getreg("a"))
    vim.fn.setreg("a", save_previous)
    return vim.fn.substitute(selection, [[\n]], [[\\n]], "g")
  end
  builtin.live_grep({
    default_text = visual_selection(),
  })
end

return M

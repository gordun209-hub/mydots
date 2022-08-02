require 'nvim-treesitter.configs'.setup {
  ensure_installed = {}, -- one of "all", or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  highlight = {
    enable = true,
    -- disable = { "c", "rust" },  -- list of language that will be disabled
     additional_vim_regex_highlighting = false,
  },
  matchup = {
    enable = true,
  },


  indent = {
    enable = true
  },

  rainbow = {
    enable = true
  },

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  autotag = { enable = true },


}

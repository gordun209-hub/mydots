return {

    -- better diagnostics list and others
    {
        "folke/trouble.nvim",
        enabled = false,
    },

    {
        "is0n/fm-nvim",
        cmd = { "Joshuto", "Lf", "Fzf", "Nnn", "Lazygit" },
        config = function()
            require("fm-nvim").setup({
                -- (Vim) Command used to open files
                edit_cmd = "edit",
                -- See `Q&A` for more info
                on_close = {},
                on_open = {},
                -- UI Options
                ui = {
                    -- Default UI (can be "split" or "float")
                    default = "float",

                    float = {
                        -- Floating window border (see ':h nvim_open_win')
                        border = "none",

                        -- Highlight group for floating window/border (see ':h winhl')
                        float_hl = "Normal",
                        border_hl = "FloatBorder",

                        -- Floating Window Transparency (see ':h winblend')
                        blend = 0,

                        -- Num from 0 - 1 for measurements
                        height = 0.8,
                        width = 0.8,

                        -- X and Y Axis of Window
                        x = 0.5,
                        y = 0.5,
                    },

                    split = {
                        -- Direction of split
                        direction = "topleft",

                        -- Size of split
                        size = 24,
                    },

                    -- Terminal commands used w/ file manager (have to be in your $PATH)
                    cmds = {
                        lf_cmd = "lf", -- eg: lf_cmd = "lf -command 'set hidden'"
                        fm_cmd = "fm",
                        nnn_cmd = "nnn",
                        fff_cmd = "fff",
                        twf_cmd = "twf",
                        fzf_cmd = "fzf", -- eg: fzf_cmd = "fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
                        fzy_cmd = "find . | fzy",
                        xplr_cmd = "xplr",
                        vifm_cmd = "vifm",
                        skim_cmd = "sk",
                        broot_cmd = "broot",
                        gitui_cmd = "gitui",
                        ranger_cmd = "ranger",
                        joshuto_cmd = "joshuto",
                        lazygit_cmd = "lazygit",
                        neomutt_cmd = "neomutt",
                    },

                    -- Mappings used with the plugin
                    mappings = {
                        vert_split = "<C-v>",
                        horz_split = "<C-h>",
                        tabedit = "<C-t>",
                        edit = "<C-e>",
                        ESC = "<ESC>",
                    },

                    -- Path to broot config
                    broot_conf = vim.fn.stdpath("data") .. "/site/pack/packer/start/fm-nvim/assets/broot_conf.hjson",
                },
            })
        end,
    },

  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    event = "BufReadPost",
    keys = {
      { "<c-space>", desc = "Increment selection" },
      { "<bs>", desc = "Schrink selection", mode = "x" },
    },
    ---@type TSConfig
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      context_commentstring = { enable = true, enable_autocmd = false },
      ensure_installed = "all",
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = "<nop>",
          node_decremental = "<bs>",
        },
      },
    },
    ---@param opts TSConfig
    config = function(plugin, opts)
      if plugin.ensure_installed then
        require("gordun.util").deprecate("treesitter.ensure_installed", "treesitter.opts.ensure_installed")
      end
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
    {
        "numToStr/Navigator.nvim",
        cmd = { "NavigatorLeft", "NavigatorRight", "NavigatorUp", "NavigatorDown" },
        config = function()
            require("Navigator").setup()
        end,
    },
}

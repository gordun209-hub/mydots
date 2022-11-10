-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- Language server configurations
    use { 'neovim/nvim-lspconfig', config = function() require('modules.lsp') end } -- Configurations for Nvim LSP
    -- extra rust
    use({ 'simrat39/rust-tools.nvim' })

    -- Json like configs
    use "b0o/schemastore.nvim"


    use { "jose-elias-alvarez/null-ls.nvim" }
    -- Icons --

    use({
        "nvim-tree/nvim-web-devicons",
        config = function() require("nvim-web-devicons").setup {}
        end
    })
    -- Highlight --
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'
        , config = function() require('modules.plugins.treesitter') end }

    use { 'JoosepAlviste/nvim-ts-context-commentstring', after = "nvim-treesitter" } -- for commenting

    -- statusline --
    use { "tamton-aquib/staline.nvim", config = function() require("modules.core.statusline") end }
    -- Rainbow parentheses by using tree-sitter
    use({
        "p00f/nvim-ts-rainbow",
        after = "nvim-treesitter",
    })
    -- Comment --

    use {
        "numToStr/Comment.nvim",
        config = function()
            require("modules.plugins.comment")
        end,
        keys = { "cc", "gc", "gb" }
    }
    -- Language spesific --
    use { 'ray-x/go.nvim' }
    use { 'ray-x/guihua.lua', after = "go.nvim" }
    -- Autocreate/update html tags
    use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

    -- autocomplete AI --
    use('zbirenbaum/copilot.lua')
    -- Tmux navigation --

    -- tree trying neotree
    use { 'is0n/fm-nvim', cmd = { "Joshuto", "Lf", 'Fzf', 'Nnn', 'Lazygit' },
        config = function() require('modules.plugins.fm')
        end }
    -- tmux navigation
    use { "aserowy/tmux.nvim",
        keys = {
            '<C-h>',
            '<C-j>',
            '<C-k>',
            '<C-l>',
        },
        config = function() require('modules.plugins.tmux') end, }



    use { "fenetikm/falcon", config = function() require("modules.core.colorscheme") end }
    -- Git --
    use {
        'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
        config = function() require('gitsigns').setup() end
    }
    -- Auto complete
    use { 'hrsh7th/nvim-cmp', config = function() require('modules.plugins.cmp') end,
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lua',

        },
    }
    use({
        'L3MON4D3/luasnip',
        requires = {
            'rafamadriz/friendly-snippets',
        },
    })
    -- Highlight --
    use { "RRethy/vim-illuminate", config = function() require('modules.plugins.illuminate') end }
    -- Colorizer --
    use { "norcalli/nvim-colorizer.lua", config = function() require("colorizer").setup() end }

    -- surroind --
    use {
        "kylechui/nvim-surround",
        config = function()
            require('modules.plugins.surround')
        end,
        event = { "InsertEnter" },
        keys = { 'c' }
    }

    -- Diagnostics nice

    use {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup()
        end,
        cmd = "Trouble",
    }
    -- Auto pair --

    use({ 'windwp/nvim-autopairs', after = "nvim-cmp"
        , config = function() require("nvim-autopairs").setup() end })

    use {
        "nvim-telescope/telescope.nvim",
        config = function() require('modules.plugins.telescope') end,
        requires = {
            { 'nvim-lua/popup.nvim' },
            { 'nvim-lua/plenary.nvim' },
            { "nvim-telescope/telescope-project.nvim" },
            { "nvim-telescope/telescope-file-browser.nvim" },
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                run = "make"
            }
        },
    }

end)

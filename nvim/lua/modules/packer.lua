-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)

    use 'lewis6991/impatient.nvim'
    use 'wbthomason/packer.nvim'

    use { 'neovim/nvim-lspconfig', config = function() require('modules.lsp') end } -- Configurations for Nvim LSP


    use({ "nvim-telescope/telescope-live-grep-args.nvim" })
    use { "jose-elias-alvarez/typescript.nvim", config = function() require("modules.plugins.typescript") end, ft = "ts" }
    -- Signatures
    use { "williamboman/mason.nvim", config = function() require('modules.lsp.mason') end }
    use { 'simrat39/symbols-outline.nvim', config = function() require('modules.plugins.symbols-outline') end,
        cmd = "SymbolsOutline" }
    -- extra rust
    use({ 'simrat39/rust-tools.nvim', ft = "rs" })
    -- Json like configs
    use { "b0o/schemastore.nvim", ft = { "json", "yaml", "toml", "xml" } }
    -- project --
    use({
        "ahmedkhalf/project.nvim",
        config = function()
            require("modules.plugins.project").setup()
        end,
        requires = "nvim-telescope/telescope.nvim",
    })
    use { "jose-elias-alvarez/null-ls.nvim", after = "nvim-lspconfig" }
    -- indent --
    use({
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("modules.plugins.indent-blankline")
        end,
    })
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
    use { 'tamton-aquib/staline.nvim', config = function() require('modules.core.statusline') end
        , requires = { 'nvim-web-devicons' } }
    -- Rainbow parentheses by using tree-sitter
    use({
        "p00f/nvim-ts-rainbow",
        after = "nvim-treesitter",
        event = "InsertEnter"
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
    use {
        'MrcJkb/haskell-tools.nvim',
        requires = {
            'neovim/nvim-lspconfig',
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim', -- optional
        },
        ft = "hs",
        config = function() require("modules.plugins.haskell") end,
        -- tag = 'x.y.z' -- [^1]
    }
    use { 'ray-x/go.nvim', config = function() require("modules.plugins.go") end, ft = "go" }
    use { 'ray-x/guihua.lua', after = "go.nvim" }
    -- Autocreate/update html tags
    use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter", event = "InsertEnter" })

    -- -- autocomplete AI --
    use { 'zbirenbaum/copilot.lua', config = function() require('modules.plugins.copilot') end }


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


    use { "fenetikm/falcon" }
    -- Auto complete
    use { 'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        config = function() require('modules.plugins.cmp') end,
        requires = {
            { 'hrsh7th/cmp-nvim-lsp', after = "nvim-cmp" },
            { 'hrsh7th/cmp-buffer', after = "nvim-cmp" },
            { 'saadparwaiz1/cmp_luasnip', after = "nvim-cmp" },
            { 'hrsh7th/cmp-path', after = "nvim-cmp" },
            { 'hrsh7th/cmp-cmdline', after = "nvim-cmp" },
            { 'hrsh7th/cmp-nvim-lua', after = "nvim-cmp" },
        },
    }
    use({
        'L3MON4D3/luasnip',
        requires = {
            'rafamadriz/friendly-snippets',
        },
        after = "nvim-cmp"

    })
    -- Highlight --
    use { "RRethy/vim-illuminate", config = function() require('modules.plugins.illuminate') end, event = "InsertCharPre" }
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
        , config = function() require('modules.plugins.autopairs') end })

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
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

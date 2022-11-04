local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth", "1",
        "https://github.com/wbthomason/packer.nvim", install_path,
    })
    print(
        "Installing packer, plugins and treesitter parsers. After the installation is finished close and open Neovim."
    )
    vim.cmd([[packadd packer.nvim]])
end
-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
    pattern = 'packer_init.lua',
    command = 'source <afile> | PackerCompile',
})

local status_ok, packer = pcall(require, "packer")

if not status_ok then
    return
end

packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "single" })
        end,
    },
})
return packer.startup(function(use)
    use { "wbthomason/packer.nvim" } -- manages itself
    use { "kyazdani42/nvim-web-devicons", config = function() require('plugins.devicons') end, }
    use {
        "nvim-treesitter/nvim-treesitter", -- syntax highlighting
        run = ":TSUpdate",
        config = function() require 'plugins.treesitter'
        end,
    }

    use { "jose-elias-alvarez/typescript.nvim", ft = "ts" }
    use { 'windwp/nvim-ts-autotag', after = "nvim-treesitter" }
    use { 'p00f/nvim-ts-rainbow', after = "nvim-treesitter" } -- rainbow pairs
    use { 'JoosepAlviste/nvim-ts-context-commentstring', after = "nvim-treesitter" } -- for commenting
    use { 'windwp/nvim-autopairs', event = "InsertCharPre", after = "nvim-cmp",
        config = function() require('plugins.autopairs') end }
    -- surround text
    use { "RRethy/vim-illuminate", config = function() require('plugins.illuminate') end }
    use {
        "kylechui/nvim-surround",
        config = function()
            require('plugins.surround')
        end,
        event = { "InsertEnter" },
        keys = { 'c' }
    }
    use { 'onsails/lspkind-nvim' }
    use {
        "simrat39/symbols-outline.nvim",
        cmd = "SymbolsOutline",
    }
    use {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup()
        end,
        cmd = "Trouble",
    }

    -- use { 'folke/tokyonight.nvim', config = function() require('colorschemes.tokyonight') end }
    use { "fenetikm/falcon" }
    use { 'ray-x/go.nvim', config = function() require("plugins.gopls") end }
    use { 'ray-x/guihua.lua', after = "go.nvim" }
    -- Telescope
    use {
        "nvim-telescope/telescope.nvim",
        config = function() require('plugins.telescope') end,
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


    -- use({
    --     "folke/noice.nvim",
    --     config = function()
    --         require("noice").setup()
    --     end,
    --     requires = {
    --         -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    --         "MunifTanjim/nui.nvim",
    --         -- OPTIONAL:
    --         --   `nvim-notify` is only needed, if you want to use the notification view.
    --         --   If not available, we use `mini` as the fallback
    --     }
    -- })
    -- LSP --
    -- lsp configurations
    use {
        "neovim/nvim-lspconfig",
        config = function() require('lsp') end
    }
    use {
        "williamboman/mason.nvim", config = function() require('lsp.mason') end,
        requires = { "williamboman/mason-lspconfig.nvim" }
    }
    -- see function signatures when writing args
    use { "ray-x/lsp_signature.nvim", event = "InsertEnter",
        config = function() require('lsp.lsp-signatures') end }
    -- formatting and diagnostic settings
    use { "jose-elias-alvarez/null-ls.nvim", config = function() require('lsp.null-ls') end,
        requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" } }
    -- better lsp actions
    use({ 'simrat39/rust-tools.nvim', ft = "rs" }) -- extra capability for rust lang
    -- package json for rust
    use {
        'saecki/crates.nvim',
        tag = 'v0.2.1',
        event = { "BufRead Cargo.toml" },
        requires = { { "nvim-lua/plenary.nvim" } },
        config = function()
            require('crates').setup()
        end,
    }
    -- scheme dev
    use { 'gpanders/nvim-parinfer', ft = { 'scheme', 'racket' } }
    -- AUTOCOMPLETE
    use { 'hrsh7th/nvim-cmp', config = function() require('plugins.cmp') end }
    --use { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer', after = 'cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-path', after = 'cmp-buffer' }
    use { 'hrsh7th/cmp-cmdline', after = 'cmp-path' }
    use { 'L3MON4D3/LuaSnip' }


    use "b0o/schemastore.nvim"

    -- autosuggestion ai
    use({
        "github/copilot.vim",
        config = function()
            require('plugins.copilot')
        end,
        cmd = { "Copilot" },
    })

    use { "tamton-aquib/staline.nvim", config = function() require("plugins.staline") end }
    -- color the colors like #33214 that looks orange
    use {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("plugins.colorizer")
        end, after = "nvim-treesitter",
        event = { "CursorHold" },
        ft = { "html", "css", "json", "yaml", "conf" },
    }

    -- can recognize projects when it sees
    use {
        "ahmedkhalf/project.nvim",
        config = function()
            require("plugins.project")
        end,
        opt = true,
        after = "telescope.nvim"
    }
    -- Scrolling good
    use({
        'karb94/neoscroll.nvim',
        event = 'WinScrolled',
        config = function()
            require('neoscroll').setup({ hide_cursor = false })
        end,
    })
    -- tree trying neotree
    use { 'is0n/fm-nvim', cmd = { "Joshuto", "Lf", 'Fzf', 'Nnn', 'Lazygit' },
        config = function() require('plugins.fm')
        end }
    -- tmux navigation
    use { "aserowy/tmux.nvim",
        keys = {
            '<C-h>',
            '<C-j>',
            '<C-k>',
            '<C-l>',
        },
        config = function() require('plugins.tmux') end, }


    use { "alec-gibson/nvim-tetris", cmd = "Tetris" }
    -- commenting easy
    use {
        "numToStr/Comment.nvim",
        config = function()
            require("plugins.comment")
        end,
        keys = { "cc", "gc", "gb" }
    }
    -- PLUGINS THAT NO EFFECT ON LOADING TIME FEEL FREE TO ADD ANY PLUGIN
    use { 'mbbill/undotree', cmd = { 'UndotreeToggle' } }
    use { 'folke/zen-mode.nvim', branch = 'main', cmd = { 'ZenMode' } }
    use { 'fladson/vim-kitty', ft = { 'kitty' } } -- kitty config
    use { 'vuki656/package-info.nvim', event = { "BufRead package.json" },
        config = function() require("plugins.package-info") end }
    use { 'mboughaba/i3config.vim', ft = 'i3config' } -- i3 config file syntax
    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim',
        config = function() require('plugins.neogit') end,
        cmd = { "Neogit" } }

    use { 'kevinhwang91/nvim-bqf', ft = 'qf' }
    use {
        'sindrets/diffview.nvim',
        cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
        after = 'nvim-web-devicons',
    }
    use({
        "dstein64/vim-startuptime", cmd = "StartupTime"
    })
    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)

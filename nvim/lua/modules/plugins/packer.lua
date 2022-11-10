vim.cmd('packadd packer.nvim')

local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local fn = vim.fn

-- install packer if needed
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    })
end

require('packer').init({
    -- /home/stef/.local/share/nvim/site/pack/packer/start/packer.nvim/packer_compiled.lua
    compile_path = install_path .. '/packer_compiled.lua',
})

return require('packer').startup(function(use)
    -- Plugin manager
    use('wbthomason/packer.nvim')

    -- Libs lua
    use({
        'nvim-lua/plenary.nvim',
        'nvim-lua/popup.nvim',
    })

    --- Lsp
    use({
        'neovim/nvim-lspconfig',
        'jose-elias-alvarez/typescript.nvim',
    })



    use({
        'jose-elias-alvarez/null-ls.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'neovim/nvim-lspconfig',
        },
    })
    use({ "zbirenbaum/copilot.lua" })

    -- Completion
    use({
        'hrsh7th/nvim-cmp',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lua',
        'lukas-reineke/cmp-rg',
        'hrsh7th/cmp-nvim-lsp-signature-help',
    })

    -- Snippets
    use({
        'L3MON4D3/luasnip',
        requires = {
            'rafamadriz/friendly-snippets',

        },
    })


    --- Telescope
    use({
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-lua/popup.nvim',
            'nvim-telescope/telescope-ui-select.nvim',
        },
    })

    use({
        'nvim-telescope/telescope-project.nvim',
        requires = {
            'nvim-telescope/telescope.nvim',
        },
    })

    --- Navigation like boss
    use { 'is0n/fm-nvim' }


    -- Commenting

    use { "numToStr/Comment.nvim" }


    use { "aserowy/tmux.nvim", }
    --- Treesitter
    use({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',

    })

    use({ 'nvim-treesitter/nvim-treesitter-textobjects' })
    -- Treesitter utils

    use { 'windwp/nvim-ts-autotag' }
    use { 'p00f/nvim-ts-rainbow' }
    use { 'JoosepAlviste/nvim-ts-context-commentstring' }
    -- Dev div tools
    use({
        'editorconfig/editorconfig-vim',
        'kylechui/nvim-surround',
        'RRethy/vim-illuminate',
        'b0o/schemastore.nvim',
        'windwp/nvim-autopairs',
        'simrat39/rust-tools.nvim',
        'norcalli/nvim-colorizer.lua',

    })
    use {
        'sindrets/diffview.nvim',
        cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
        config = [[require('diffview').setup()]]
    }
    use({
        'kevinhwang91/nvim-bqf',
        config = [[require('bqf').setup()]],
        ft = { "qf" }
    })

    -- Packer
    -- Git
    use({
        'lewis6991/gitsigns.nvim',
        requires = 'nvim-lua/plenary.nvim',
    })

    -- Colors and nice stuff
    use({
        'marko-cerovac/material.nvim',
        'kyazdani42/nvim-web-devicons',
    })

    -- Statusline
    use { "tamton-aquib/staline.nvim" }

    -- Notify
    use({ 'rcarriga/nvim-notify' })


    -- Markdown
    use({ 'davidgranstrom/nvim-markdown-preview' })

    -- Div
    use({
        'lukas-reineke/indent-blankline.nvim',

    })
    -- Language spesific
    use { "ray-x/go.nvim" }
    use { "ray-x/guihua.lua", after = "go.nvim" }

    use { 'gpanders/nvim-parinfer', ft = { 'scheme', 'racket' } }

    if packer_bootstrap then
        require('packer').sync()
    end
end)

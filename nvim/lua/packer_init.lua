local fn = vim.fn
-- Automatically install packer
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
local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  command = "source <afile> | PackerSync",
  group = packer_group,
  pattern = "packer_init.lua",
})

local status_ok, packer = pcall(require, "packer")

if not status_ok then
  return
end

packer.init({
  profile = {
    enalbe = true,
  }
  ,
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "single" })
    end,
  },
})
return packer.startup(function(use)
  use { "wbthomason/packer.nvim" } -- manages itself
  use { "lewis6991/impatient.nvim" } -- improve startup time
  use { "antoinemadec/FixCursorHold.nvim", run = function() vim.g.curshold_updatime = 1000 end } -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
  use { "nvim-lua/plenary.nvim" } -- needed for other plugins to work
  use { "kyazdani42/nvim-web-devicons", config = function() require('plugins.devicons') end, }
  use {
    "nvim-treesitter/nvim-treesitter", -- syntax highlighting
    run = ":TSUpdate",
    requires = {
      'windwp/nvim-ts-autotag', -- for autotag () {}
      'p00f/nvim-ts-rainbow', -- rainbow pairs
      'JoosepAlviste/nvim-ts-context-commentstring', -- for commenting
    },
    config = function() require 'plugins.treesitter'
    end,
  }

  use { 'windwp/nvim-autopairs', event = "InsertCharPre", after = "nvim-cmp",
    config = function() require('plugins.autopairs') end }
  -- surround text
  use {
    "kylechui/nvim-surround",
    config = function()
      require('plugins.surround')
    end,
    event = { "InsertEnter" },
    keys = { 'c' }
  }
  -- THEME
  use {
    "EdenEast/nightfox.nvim",
    config = function()
      require("colorschemes.nightfox")
    end,
    run = ':lua require("nightfox").compile()',
  }
  -- Telescope
  use { 'ibhagwan/fzf-lua',
    -- optional for icon support
    cmd = "Fzf",
    requires = { 'kyazdani42/nvim-web-devicons' }
  }
  -- use {
  --   "nvim-telescope/telescope.nvim",
  --   after = { "plenary.nvim" },
  --   requires = {
  --     { "nvim-telescope/telescope-project.nvim" },
  --     'cljoly/telescope-repo.nvim',
  --     { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
  --     "nvim-telescope/telescope-file-browser.nvim",
  --   },
  --   config = function()
  --     require("plugins.telescope")
  --   end,
  -- }
  -- LSP --
  -- lsp configurations
  use {
    "neovim/nvim-lspconfig",
    config = function()
      require("lsp")
    end,
    requires = { { "jose-elias-alvarez/typescript.nvim", },
      { "williamboman/mason.nvim",
        requires = { "williamboman/mason-lspconfig.nvim" }
      } }
  }

  -- see function signatures when writing args
  use { "ray-x/lsp_signature.nvim", event = "InsertEnter", after = "nvim-lspconfig",
    config = function() require('lsp.lsp-signatures') end }
  -- formatting and diagnostic settings
  use { "jose-elias-alvarez/null-ls.nvim", config = function() require('lsp.null-ls') end,
    requires = { "nvim-lua/plenary.nvim" } }
  -- better lsp actions
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function() require('plugins.lspsaga')
    end,
    after = { "nvim-lspconfig" }
  })
  -- I3 config syntax highlight
  -- JAVASCRIPT
  -- RUST
  -- use({ 'simrat39/rust-tools.nvim'}) -- extra capability for rust lang
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
  use { 'hrsh7th/nvim-cmp', event = 'InsertEnter', config = "require('plugins.cmp')" }
  use { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp', after = 'cmp-nvim-lua' }
  use { 'hrsh7th/cmp-buffer', after = 'cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-path', after = 'cmp-buffer' }
  use { 'hrsh7th/cmp-cmdline', after = 'cmp-path' }
  use { 'L3MON4D3/LuaSnip', requires = { { 'rafamadriz/friendly-snippets', after = { "nvim-cmp" } },
    { "saadparwaiz1/cmp_luasnip", after = { "nvim-cmp" } }
  }, event = "InsertEnter" }

  -- for prime
  -- use({
  --   "theprimeagen/harpoon",
  --   requires = { "nvim-lua/plenary.nvim" },
  --   config = function() require('plugins.configs.harpoon') end
  -- })

  -- autosuggestion ai
  use({
    "github/copilot.vim",
    config = function()
      require('plugins.copilot')
    end,
    cmd = { "Copilot" },
  })
  -- lualine at bottom
  -- use {
  --   "nvim-lualine/lualine.nvim",
  --   requires = { "kyazdani42/nvim-web-devicons", },
  --   opt = true,
  --   config = function()
  --     require('plugins.configs.lualine')
  --   end,
  -- }
  -- color the colors like #33214 that looks orange
  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("plugins.colorizer")
    end, after = "nvim-treesitter",
    event = { "BufRead", "BufNewFile" },
    ft = { "html", "css", "json", "yaml", "conf" },
  }
  -- can recognize projects when it sees
  use {
    "ahmedkhalf/project.nvim",
    config = function()
      require("plugins.project")
    end,
    --requires = { "nvim-telescope/telescope.nvim" }
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
  use { 'is0n/fm-nvim', cmd = { 'Fzf', 'Nnn', 'Lazygit' },
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
  -- oyun



  use {
    "alec-gibson/nvim-tetris",
    cmd = "Tetris",
  }
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
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim', config = function() require('plugins.neogit') end,
    cmd = { "Neogit" } }


  use { 'kevinhwang91/nvim-bqf', ft = 'qf' }
  use {
    'sindrets/diffview.nvim',
    cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
    after = 'nvim-web-devicons',
  }
  -- calculate startup time
  --
  use({
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  })
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)

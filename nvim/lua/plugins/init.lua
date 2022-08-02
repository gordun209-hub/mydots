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
  pattern = "init.lua",
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
  use { "lewis6991/impatient.nvim" } -- improve startup time

  use { "antoinemadec/FixCursorHold.nvim" } -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
  use { "nvim-lua/plenary.nvim" } -- needed for other plugins to work
  use { "kyazdani42/nvim-web-devicons", config = function() require('plugins.configs.devicons') end, }
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function() require('plugins.configs.treesitter') end,
    requires = {
      'windwp/nvim-ts-autotag',
      { 'windwp/nvim-autopairs', config = function() require('plugins.configs.autopairs') end },
      'p00f/nvim-ts-rainbow',
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
  }
  --use { "JoosepAlviste/nvim-ts-context-commentstring"  }
  --use { "windwp/nvim-ts-autotag" } -- auto closing tags
  -- use { "windwp/nvim-autopairs",
  --  config = function() require('plugins.configs.autopairs') end, }
  --use { 'p00f/nvim-ts-rainbow'  } -- rainbow brackets
  use {
    "kylechui/nvim-surround",
    config = function()
      require('plugins.configs.surround')
    end,
    event = { "BufWinEnter", "BufNewFile" }
  }
  -- THEME
  use {
    "EdenEast/nightfox.nvim",
    config = function()
      require("colorschemes.nightfox").setup()
    end,
    run = ':lua require("nightfox").compile()',
  }
  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-project.nvim",
      'cljoly/telescope-repo.nvim',
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function()
      require("plugins.configs.telescope")
    end,
  }
  -- LSP --
  use {
    "neovim/nvim-lspconfig",
    config = function()
      require("lsp")
    end,
    requires = { "jose-elias-alvarez/typescript.nvim" }
  }
  use "ray-x/lsp_signature.nvim"
  use { "jose-elias-alvarez/null-ls.nvim", config = function() require('lsp.null-ls') end,
    requires = { "nvim-lua/plenary.nvim" } }
  -- new nvim-lsp-installer
  use { "williamboman/mason.nvim", requires = {
    { "williamboman/mason-lspconfig.nvim" }, config = function() require('lsp.mason') end,
  }, }
  use { "b0o/schemastore.nvim", config = function() require('lsp.settings.jsonls') end } -- generate schema stores
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function() require('plugins.configs.lspsaga')
    end,
    after = { "nvim-lspconfig" }
  })
  -- I3
  use { 'mboughaba/i3config.vim', ft = 'i3config' } -- i3 config file syntax
  -- JAVASCRIPT
  use { 'jose-elias-alvarez/typescript.nvim' } -- extra capability for typescript
  use { 'vuki656/package-info.nvim', event = { "BufRead package.json" }, requires = "MunifTanjim/nui.nvim",
    config = function() require("plugins.configs.package-info") end }
  -- RUST
  -- use({ 'simrat39/rust-tools.nvim'}) -- extra capability for rust lang
  use {
    'saecki/crates.nvim',
    tag = 'v0.2.1',
    event = { "BufRead Cargo.toml" },
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require('crates').setup()
    end,
  }
  -- LISP
  use { 'eraserhd/parinfer-rust', opt = true, ft = { "racket", "scheme" } }
  -- AUTOCOMPLETE
  use { 'saadparwaiz1/cmp_luasnip', after = "LuaSnip" }
  use { 'L3MON4D3/LuaSnip', requires = { 'rafamadriz/friendly-snippets' }, } -- snippets
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
    },
    config = function()
      require "plugins.configs.cmp"
    end,
  }
  -- Marks

  use({
    "theprimeagen/harpoon",
    requires = { "nvim-lua/plenary.nvim" },
    config = function() require('plugins.configs.harpoon') end
  })


  use({
    "github/copilot.vim",
    config = function()
      require('plugins.configs.copilot')
    end,
    event = { "InsertEnter" }
  })
  use {
    "nvim-lualine/lualine.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    opt = true,
    config = function()
      require("plugins.configs.lualine")
    end,
  }
  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("plugins.configs.colorizer")
    end, after = "nvim-treesitter",
    event = { "BufRead", "BufNewFile" }
  }
  use {
    "ahmedkhalf/project.nvim",
    config = function()
      require("plugins.configs.project")
    end,
  }
  use {
    'numToStr/Navigator.nvim',
    config = function()
      require('Navigator').setup({
        auto_save = 'current'
      })
    end,
    event = "BufRead"
  }

  use({
    'karb94/neoscroll.nvim',
    event = 'WinScrolled',
    config = function()
      require('neoscroll').setup({ hide_cursor = false })
    end,
  })
  -- use { "aserowy/tmux.nvim",
  --   config = function() require('plugins.configs.tmux') end, }

  use { "RRethy/vim-illuminate" }
  use {
    "luukvbaal/nnn.nvim",
    config = function()
      require("plugins.configs.nnn").setup()
    end,
  }
  use {
    "numToStr/Comment.nvim",
    config = function()
      require("plugins.configs.comment")
    end,
    --  after = "joosepalviste/nvim-ts-context-commentstring",
    event = 'BufRead',
  }

  -- use({ 'andweeb/presence.nvim', config = function() require("presence"):setup({
  --     auto_update = true,
  --   })
  -- end, event = "BufWinEnter" })

  use({
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  })
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)

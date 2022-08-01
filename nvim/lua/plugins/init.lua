local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth", "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
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
  -- use { "nathom/filetype.nvim", config = function() require('filetype').setup() end }
  use({ "nvim-lua/plenary.nvim" }) -- needed for other plugins to work
  use { "kyazdani42/nvim-web-devicons", config = function() require('plugins.configs.devicons') end } -- icons for other plugins
  use { 'Shatur/neovim-session-manager', config = "require('plugins.configs.session-manager')" } -- Session Management
  use { 'folke/which-key.nvim', config = function() require('plugins.configs.whichkey') end, event = "BufWinEnter" } -- keymap helper
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function() require('plugins.configs.treesitter') end,
  })
  use({ "JoosepAlviste/nvim-ts-context-commentstring", after = { "nvim-treesitter" } })
  use { 'nvim-treesitter/nvim-treesitter-textobjects', after = { 'nvim-treesitter' } }
  use { 'RRethy/nvim-treesitter-textsubjects', after = { 'nvim-treesitter' } }
  use { "windwp/nvim-ts-autotag", after = { "nvim-treesitter" } } -- auto closing tags
  use({ "windwp/nvim-autopairs", event = { 'InsertCharPre' },
    config = function() require('plugins.configs.autopairs') end,
    after = { 'nvim-treesitter', "nvim-cmp" }, })
  use { 'p00f/nvim-ts-rainbow', after = { 'nvim-treesitter' } } -- rainbow brackets
  use({
    "kylechui/nvim-surround",
    config = function()
      require('plugins.configs.surround')
    end,
    event = { "BufWinEnter", "BufNewFile" }
  })
  -- THEME
  use({
    "EdenEast/nightfox.nvim",
    config = function()
      require("colorschemes.nightfox").setup()
    end,
    run = ':lua require("nightfox").compile()',
  })
  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-node-modules.nvim",
      "nvim-telescope/telescope-project.nvim",
      'cljoly/telescope-repo.nvim',
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      "nvim-telescope/telescope-file-browser.nvim",
      { 'nvim-telescope/telescope-github.nvim', },
      { 'nvim-telescope/telescope-ui-select.nvim', },
      { 'nvim-telescope/telescope-packer.nvim' },
    },
    config = function()
      require("plugins.configs.telescope")
    end,
  }

  -- LSP --
  use({
    "neovim/nvim-lspconfig",
    config = function()
      require("lsp")
    end,
  })
  -- signature
  use {
    'ray-x/lsp_signature.nvim',
    config = function() require('lsp.lsp-signatures') end,
    after = 'nvim-lspconfig'
  }
  use({ "jose-elias-alvarez/null-ls.nvim", config = function() require('lsp.null-ls') end,
    requires = { "nvim-lua/plenary.nvim" } })

  -- new nvim-lsp-installer
  use { "williamboman/mason.nvim", requires = {
    { "williamboman/mason-lspconfig.nvim" }, config = function() require('lsp.mason') end,
  }, }
  use({ "b0o/schemastore.nvim", config = function() require('lsp.settings.jsonls') end }) -- generate schema stores
  use { 'jose-elias-alvarez/typescript.nvim' } -- extra capability for typescript
  use { 'rmagatti/goto-preview', config = function() require('plugins.configs.goto-preview') end } -- better preview
  use({ "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu", }) -- better code action

  -- GITHUB PLUGINS --
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('plugins.configs.gitsigns') end, }

  use({
    "mbbill/undotree",
    config = function() require('plugins.configs.undo-tree') end,
  })
  use { 'kdheepak/lazygit.nvim', cmd = { "LazyGit", "LazyGitConfig" }, }
  -- LANGUAGE SPESIFIC PLUGINS
  -- JAVASCRIPT
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
  use({ 'eraserhd/parinfer-rust', ft = { "racket", "scheme" } })
  -- AUTOCOMPLETE
  use({ 'hrsh7th/nvim-cmp', config = function() require('plugins.configs.cmp') end })
  use { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp', after = 'cmp-nvim-lua' }
  use("andersevenrud/cmp-tmux")
  use { 'hrsh7th/cmp-buffer', after = 'cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-path', after = 'cmp-buffer' }
  use { "mtoohey31/cmp-fish", ft = "fish" }
  use { 'hrsh7th/cmp-cmdline', after = 'cmp-path' }
  use { 'hrsh7th/cmp-calc', after = 'cmp-cmdline' }
  use({ 'David-Kunz/cmp-npm', requires = 'nvim-lua/plenary.nvim',
    config = function() require('plugins.configs.cmp-npm') end })
  use { 'saadparwaiz1/cmp_luasnip', after = "LuaSnip" }
  use { 'L3MON4D3/LuaSnip', requires = { 'rafamadriz/friendly-snippets', event = "InsertEnter" }, } -- snippets


  use({
    "AckslD/nvim-neoclip.lua",
    config = function()
      require("plugins.configs.neoclip").setup()
    end,
    event = { "TextYankPost" },
    requires = {
      { "nvim-telescope/telescope.nvim" },
      { "tami5/sqlite.lua" },
    },
  })



  -- -- Bookmarks
  -- use("MattesGroeger/vim-bookmarks")
  --
  -- -- Bookmarks sstelescope integration
  -- use({
  --   "tom-anders/telescope-vim-bookmarks.nvim",
  --   config = function()
  --     require("telescope").load_extension("vim_bookmarks")
  --   end,
  --   requires = {
  --     { "nvim-telescope/telescope.nvim" },
  --     { "MattesGroeger/vim-bookmarks" },
  --   },
  -- })

  use({
    "github/copilot.vim",
    config = function()
      require('plugins.configs.copilot')
    end,
  })
  -- UI PART OF PLUGINS
  use({ "lukas-reineke/indent-blankline.nvim", config = function() require('plugins.configs.indentline').setup() end,
    event = 'BufRead', })
  use({
    "romgrk/barbar.nvim",
    config = function()
      require("plugins.configs.barbar").setup()
    end,
    requires = "kyazdani42/nvim-web-devicons",
  })
  use({
    "nvim-lualine/lualine.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    after = { "nvim-navic", "alpha-nvim" },
    config = function()
      require("plugins.configs.lualine").setup()
    end,
  })
  -- UTILITIES
  --  use { "windwp/nvim-spectre", config = function() require('plugins.configs.spectre') end }
  use({ "ThePrimeagen/harpoon", requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('plugins.configs.harpoon') end })
  use({
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig",
    config = function() require('plugins.configs.navic') end
  })
  use { 'declancm/cinnamon.nvim', config = function() require('plugins.configs.cinnamon') end }
  use({
    "folke/trouble.nvim",
    config = function() require('plugins.configs.trouble') end,
    wants = "nvim-web-devicons",
    after = {
      'nvim-lspconfig'
    },
  })
  use({ 'stevearc/dressing.nvim', requires = 'MunifTanjim/nui.nvim',
    config = function() require("plugins.configs.dressing") end })
  use({
    "rcarriga/nvim-notify",
    requires = { "nvim-telescope/telescope.nvim" },
    event = "VimEnter",
    config = function()
      require("plugins.configs.notify")
    end
  })
  use({
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("plugins.configs.colorizer")
    end, after = "nvim-treesitter",
    event = { "BufRead", "BufNewFile" }
  })
  use({
    "ahmedkhalf/project.nvim",
    config = function()
      require("plugins.configs.project")
    end,
    requires = { { "nvim-telescope/telescope.nvim" } },
  })
  use({ "aserowy/tmux.nvim",
    config = function() require('plugins.configs.tmux') end, })

  use({ "RRethy/vim-illuminate", config = function() require('plugins.configs.illuminate') end })
  use({
    "luukvbaal/nnn.nvim",
    config = function()
      require("plugins.configs.nnn").setup()
    end,
  })
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("plugins.configs.comment")
    end,
    requires = "joosepalviste/nvim-ts-context-commentstring",
    event = 'BufWinEnter',
  })

  use({ 'andweeb/presence.nvim', config = function() require("presence"):setup({
      auto_update = true,
    })
  end, event = "BufWinEnter" })
  --hlargs
  use({
    "m-demare/hlargs.nvim",
    requires = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("hlargs").setup()
    end,
  })



  use({
    "danymat/neogen",
    config = function()
      require("neogen").setup({ snippet_engine = "luasnip" })
    end,
    requires = "nvim-treesitter/nvim-treesitter",
  })




  use({ "goolord/alpha-nvim", config = function() require('plugins.configs.alpha') end,
    requires = { "kyazdani42/nvim-web-devicons" } })

  -- use({
  --   -- calc startup time
  --   "dstein64/vim-startuptime",
  --   cmd = "StartupTime",
  -- })
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)

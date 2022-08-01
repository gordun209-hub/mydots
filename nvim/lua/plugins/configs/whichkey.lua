local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    ["<leader>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "center", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  --show_help = true, -- show help message on the command line when the popup is visible
  -- triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}
local diag_opts = {
  mode = "n",
  prefix = "]",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}
local diag_mappings = {
  d = { "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", "prev diagniostics" }
}
local diag_mappings_2 = {
  d = { "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", "prev diagniostics" }

}
local diag_opts_2 = {
  mode = "n",
  prefix = "[",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local surround_opts = {
  mode = "n",
  prefix = "s",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,

}
local surround_mappings = {
  name = "Surround",
  ["."] = { "<cmd>lua require('surround').repeat_last()<cr>", "Repeat" },
  a = { "<cmd>lua require('surround').surround_add(true)<cr>", "Add" },
  d = { "<cmd>lua require('surround').surround_delete()<cr>", "Delete" },
  r = { "<cmd>lua require('surround').surround_replace()<cr>", "Replace" },
  q = { "<cmd>lua require('surround').toggle_quotes()<cr>", "Quotes" },
  b = { "<cmd>lua require('surround').toggle_brackets()<cr>", "Brackets" },
}


local m_opts = {
  mode = "n", -- NORMAL mode
  prefix = "m",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local m_mappings = {
  -- a = { "<cmd>silent BookmarkAnnotate<cr>", "Annotate" },
  -- c = { "<cmd>silent BookmarkClear<cr>", "Clear" },
  -- b = { "<cmd>silent BookmarkToggle<cr>", "Toggle" },
  m = { '<cmd>lua require("harpoon.mark").add_file()<cr>', "Harpoon" },
  ["."] = { '<cmd>lua require("harpoon.ui").nav_next()<cr>', "Harpoon Next" },
  [","] = { '<cmd>lua require("harpoon.ui").nav_prev()<cr>', "Harpoon Prev" },
  -- l = { "<cmd>lua require('user.bfs').open()<cr>", "Buffers" },
  -- j = { "<cmd>silent BookmarkNext<cr>", "Next" },
  s = { "<cmd>Telescope harpoon marks<cr>", "Search Files" },
  -- k = { "<cmd>silent BookmarkPrev<cr>", "Prev" },
  -- S = { "<cmd>silent BookmarkShowAll<cr>", "Prev" },
  -- s = {
  --   "<cmd>lua require('telescope').extensions.vim_bookmarks.all({ hide_filename=false, prompt_title=\"bookmarks\", shorten_path=false })<cr>",
  --  "Show",
  -- },
  x = { "<cmd>BookmarkClearAll<cr>", "Clear All" },
  [";"] = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', "Harpoon UI" },
}

local mappings = {

  K       = { "<cmd> lua require('goto-preview').goto_preview_definition()<cr>", "preview definition" },
  ["gpi"] = { "<cmd>lua require('goto-preview').goto_preview_implementation()<cr>", "preview implementation" },
  ["gP"]  = { "<cmd>lua require('goto-preview').close_all_win()<cr>", "preview close all" },
  R       = { "<cmd>lua require('goto-preview').goto_preview_references()<cr>", "preview references" },
  n       = { "<cmd>NnnPicker<cr>", "nnn" },
  v       = { "<cmd>vsplit<cr>", "vsplit" },
  h       = { "<cmd>split<cr>", "split" },
  ["/"]   = { '<cmd>lua require("Comment.api").toggle_current_linewise()<CR>', "Comment" },

  -- ["zz"] = { "<cmd>ZenMode<cr>", "Zen" },
  -- ["gy"] = "Link",


  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },



  s = {
    name = "Session",
    s = { "<cmd>SaveSession<cr>", "Save" },
    r = { "<cmd>RestoreSession<cr>", "Restore" },
    x = { "<cmd>DeleteSession<cr>", "Delete" },
    f = { "<cmd>Autosession search<cr>", "Find" },
    d = { "<cmd>Autosession delete<cr>", "Find Delete" },
  },

  -- r = {
  --   name = "Replace/Spectre",
  --   r = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
  --   w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
  --   f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
  -- },
  f = {
    name = "Find/Telescope",
    b = { "<cmd>Telescope buffers<cr>", "Find buffer" },
    B = { "<cmd>Telescope vim_bookmarks all<cr>", "Find bookmarks" },
    u = { "<cmd>Telescope buffers<cr>", "Find buffer" },
    g = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    C = { "<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>",
      "Colorscheme", },
    f = { "<cmd>Telescope find_files<cr>", "Find files" },
    t = { "<cmd>lua require('plugins.configs.telescope').telescope_grep()<cr>", "Find Text" },
    s = { "<cmd>Telescope grep_string<cr>", "Find String" },
    S = { "<cmd>lua require('plugins.configs.telescope').grep_string_visual()<cr>", "visual grep string" },
    h = { "<cmd>Telescope help_tags<cr>", "Help" },
    H = { "<cmd>Telescope highlights<cr>", "Highlights" },
    i = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
    l = { "<cmd>Telescope resume<cr>", "Last Search" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    L = { "<cmd>Telescope treesitter<cr>", "Treesitter" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    c = { "<cmd>lua require('plugins.configs.telescope').command_history()<cr>", "Commands" },
    m = { "<cmd>Telescope marks<cr>", "Marks" },
    p = { "<cmd>Telescope projects<cr>", "Open projects" },
    P = { "<cmd>lua require('plugins.configs.telescope').project_files()<cr>", "Open projects" },

    q = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
  },

  g = {
    name = "Git",
    l = { "<cmd>LazyGit<CR>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>lua require('plugins.configs.telescope').my_git_commits()<cr>", "Checkout commit" },
    C = { "<cmd>lua require('plugins.configs.telescope').my_git_bcommits()<cr>", "Checkout buffer commit" },

    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Diff",
    },
  },

  b = {
    name = "Buffer",
    b = { '<cmd>BufferMovePrevious<CR>', 'Move back' },
    c = { '<cmd>BufferCloseAllButCurrent<CR>', 'Close but current' },
    d = { '<cmd>BufferOrderByDirectory<CR>', 'Order by directory' },
    f = { '<cmd>bfirst<CR>', 'First buffer' },
    l = { '<cmd>BufferCloseBuffersLeft<CR>', 'Close Left' },
    r = { '<cmd>BufferCloseBuffersRight<CR>', 'Close Right' },
    n = { '<cmd>BufferMoveNext<CR>', 'Move next' },
    p = { '<cmd>BufferPick<CR>', 'Pick Buffer' },
  },
  l = {
    name = "LSP",
    t = {
      name = "Toggle diagnostic",
      s = { "<cmd>vim.diagnostic.show(nil, 0)<cr>", "Show diagnostic for buffer" },
      h = { "<cmd>vim.diagnostic.show(nil, 0)<cr>", "Hide diagnostic for buffer" },
      S = { "<cmd>vim.diagnostic.show()<cr>", "Show diagnostic for all buffers" },
      H = { "<cmd>vim.diagnostic.hide()<cr>", "Hide diagnostic for all buffers" },
    },
    a = { "<cmd> CodeActionMenu<cr>", "Code Action" },
    d = { "<cmd>Trouble<cr>", "Diagnostics" },
    h = {
      "<cmd>lua vim.lsp.buf.signature_help()<cr>",
      "Signature help",
    },
    D = {
      "<cmd>Telescope diagnostics<cr>",
      "Workspace Diagnostics (Telescope)",
    },
    w = {
      "<cmd>Telescope lsp_workspace_diagnostics<cr>",
      "Workspace Diagnostics",
    },

    n = {
      "<cmd>lua vim.diagnostic.goto_next()<cr>",
      "Next Diagnostic",
    },
    p = {
      "<cmd>lua vim.diagnostic.goto_prev()<cr>",
      "Prev Diagnostic",
    },
    k = {
      "<cmd>lua vim.diagnostic.open_float(nil, {source = 'always'})<cr>",
      "Show line diagnostic",
    },

    c = {
      name = "Codelens",
      ["r"] = { "<cmd>lua vim.lsp.codelens.run()<cr>", "Run" },
      ["d"] = { "<cmd>lua vim.lsp.codelens.display()<cr>", "Display" },
      ["u"] = { "<cmd>lua vim.lsp.codelens.refresh()<cr>", "Update" },
    },

    K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "hover" },
    f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    R = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
  },




  T = {
    name = "Treesitter",
    h = { "<cmd>TSHighlightCapturesUnderCursor<cr>", "Highlight" },
    p = { "<cmd>TSPlaygroundToggle<cr>", "Playground" },
    r = { "<cmd>TSToggle rainbow<cr>", "Rainbow" },
  },
}

local vopts = {
  mode = "v", -- VISUAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local vmappings = {
  ["/"] = { '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', "Comment" },
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
which_key.register(m_mappings, m_opts)
which_key.register(diag_mappings_2, diag_opts_2)
which_key.register(diag_mappings, diag_opts)
which_key.register(surround_mappings, surround_opts)

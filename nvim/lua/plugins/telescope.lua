  require('telescope').setup({
    defaults = {
      selection_caret = ' ',
      file_ignore_patterns = {
    -- git
    ".git\\",
    -- tags
    "TAGS",
    "%.TAGS",
    "tags",
    "%.tags",
    "gtags%.files",
    "GTAGS",
    "GRTAGS",
    "GPATH",
    "GSYMS",
                          "/node_modules*",
    "cscope%.files",
    "cscope%.out",
    "cscope%.in%.out",
    "cscope%.po%.out",
    -- python
    "__pycache__\\",
    ".*%.py[cod]",
    ".*$py%.class",
                          "public",
    "%.Python",
    "build\\",
    "develop-eggs\\",
    "dist\\",
    "downloads\\",
    "eggs\\",
    "%.eggs\\",
    "lib\\",
    "lib64\\",
    "parts\\",
    "sdist\\",
    "var\\",
    "wheels\\",
    "share\\python-wheels\\",
    ".*%.egg-info\\",
    "%.installed%.cfg",
    ".*%.egg",
    "MANIFEST",
    "%.env",
    "%.venv",
    "env\\",
    "venv\\",
    "ENV\\",
    "env%.bak\\",
    "venv%.bak\\",
    -- images
    "%.jpg",
    "%.jpeg",
    "%.jpe",
    "%.jif",
    "%.jfif",
    "%.jfi",
    "%.jp2",
    "%.j2k",
    "%.jpf",
    "%.jpx",
    "%.jpm",
    "%.mj2",
    "%.jxr",
    "%.hdp",
    "%.wdp",
    "%.gif",
    "%.raw",
    "%.webp",
    "%.png",
    "%.apng",
    "%.mng",
    "%.tiff",
    "%.tif",
    "%.svg",
    "%.svgz",
    "%.pdf",
    "%.xbm",
    "%.bmp",
    "%.dib",
    "%.ico",
    "%.3dm",
    "%.max",
    -- fonts
    "%.fnt",
    "%.fon",
    "%.otf",
    "%.ttf",
    "%.woff",
    "%.woff2",
    -- latex
    "%.fdb_latexmk",
    "%.synctex",
    "%.synctex%(busy%)",
    "%.synctex%.gz",
    "%.synctex%.gz%(busy%)",
    "%.pdfsync",
},

      layout_config = {
        horizontal = { prompt_position = 'top', results_width = 0.6 },
        vertical = { mirror = false },
      },
      sorting_strategy = 'ascending',
      file_previewer = require('telescope.previewers').vim_buffer_cat.new,
      grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
      qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    },
    extensions = {
    },
  })
  require'telescope'.load_extension('project')
  --require('telescope').load_extension('dotfiles')
  --require('telescope').load_extension('gosource')
  require('telescope').load_extension('file_browser')


local status_ok, material = pcall(require, "material")

if not status_ok then
	return
end
vim.g.material_style = "deep ocean"

local colors = require("material.colors")

local nvimtree = true

material.setup({

	contrast = {
		sidebars = nvimtree,
		floating_windows = false, -- Enable contrast for floating windows
		line_numbers = true, -- Enable contrast background for line numbers
		sign_column = false, -- Enable contrast background for the sign column
		cursor_line = false, -- Enable darker background for the cursor line
		non_current_windows = false, -- Enable darker background for non-current windows
		popup_menu = false, -- Enable lighter background for the popup menu
	},
	italics = {
		comments = true, -- Enable italic comments
		keywords = true, -- Enable italic keywords
		functions = false, -- Enable italic functions
		strings = false, -- Enable italic strings
		variables = false, -- Enable italic variables
	},
	contrast_filetypes = { -- Specify which filetypes get the contrasted (darker) background
		"terminal", -- Darker terminal background
		"packer", -- Darker packer background
	},
	high_visibility = {
		lighter = false, -- Enable higher contrast text for lighter style
		darker = true, -- Enable higher contrast text for darker style
	},
	disable = {
		colored_cursor = false, -- Disable the colored cursor
		borders = false, -- Disable borders between verticaly split windows
		background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
		term_colors = false, -- Prevent the theme from setting terminal colors
		eob_lines = true, -- Hide the end-of-buffer lines
	},
	async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)
	custom_highlights = {
		NvimTreeWinSeparator = {
			bg = colors.bg,
			fg = colors.bg,
		},
		StatusLine = {
			bg = colors.bg,
		},
		TelescopeNormal = { bg = colors.bg_alt },
		TelescopePreviewBorder = {
			bg = colors.bg_alt,
			fg = colors.bg_alt,
		},
		TelescopePromptBorder = {
			bg = colors.bg_alt,
			fg = colors.bg_alt,
		},
		TelescopePromptTitle = {
			bg = colors.bg_alt,
			fg = colors.fg,
		},
		TelescopeResultsBorder = {
			bg = colors.bg_alt,
			fg = colors.bg_alt,
		},
	},
})

vim.cmd("colorscheme material")

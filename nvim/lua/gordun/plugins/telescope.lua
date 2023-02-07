local Util = require("gordun.util")
local M = {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
		"debugloop/telescope-undo.nvim",
		"tom-anders/telescope-vim-bookmarks.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	cmd = { "Telescope" },
	keys = {
		{ "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
		{ "<leader>/", Util.telescope("live_grep"), desc = "Find in Files (Grep)" },
		{ "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
		{ "<leader><space>", Util.telescope("files"), desc = "Find Files (root dir)" },
		-- find
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
		{ "<leader>ff", Util.telescope("files"), desc = "Find Files (root dir)" },
		{ "<leader>fF", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
		{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
		-- git
		{ "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
		{ "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
		-- search
		{ "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
		{ "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
		{ "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
		{ "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
		{ "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
		{ "<leader>sg", Util.telescope("live_grep"), desc = "Grep (root dir)" },
		{ "<leader>sG", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
		{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
		{ "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
		{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
		{ "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
		{ "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
		{ "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
		{ "<leader>sw", Util.telescope("grep_string"), desc = "Word (root dir)" },
		{ "<leader>sW", Util.telescope("grep_string", { cwd = false }), desc = "Word (cwd)" },
		{
			"<leader>uC",
			Util.telescope("colorscheme", { enable_preview = true }),
			desc = "Colorscheme with preview",
		},
		{
			"<leader>ss",
			Util.telescope("lsp_document_symbols", {
				symbols = {
					"Class",
					"Function",
					"Method",
					"Constructor",
					"Interface",
					"Module",
					"Struct",
					"Trait",
					"Field",
					"Property",
				},
			}),
			desc = "Goto Symbol",
		},
	},
}

M.config = function()
	local telescope = require("telescope")
	local config = {
		defaults = {
			path_display = { truncate = 3 },
			mappings = {
				i = {
					["<esc>"] = require("telescope.actions").close,
					["<S-Up>"] = require("telescope.actions").preview_scrolling_up,
					["<S-Down>"] = require("telescope.actions").preview_scrolling_down,
					["<PageDown>"] = require("telescope.actions").cycle_history_next,
					["<PageUp>"] = require("telescope.actions").cycle_history_prev,
				},
			},
			vimgrep_arguments = {
				"rg",
				"-L",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--hidden",
				"--trim",
				"--glob=!.git/",
				"--glob=!.yarn/",
				"--glob=!package-lock.json",
				"--glob=!yarn.lock",
			},
			prompt_prefix = "❯ ",
			selection_caret = "❯ ",
			entry_prefix = "  ",
			initial_mode = "insert",
			selection_strategy = "reset",
			sorting_strategy = "descending",
			scroll_strategy = "cycle",
			layout_strategy = "horizontal",
			layout_config = {
				prompt_position = "bottom",
				horizontal = { preview_width = 0.6, results_width = 0.8 },
				width = 0.95,
				height = 0.95,
				preview_cutoff = 120,
			},
			file_ignore_patterns = { "node_modules", "^.git/" },
			winblend = 0,
			border = {},
			borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			color_devicons = true,
			file_previewer = require("telescope.previewers").vim_buffer_cat.new,
			grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
			qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
			-- preview = {
			-- 	check_mime_type = true,
			-- 	filesize_limit = 0.5,
			-- 	timeout = 200,
			-- 	treesitter = true,
			-- 	msg_bg_fillchar = "╱",
			-- },
		},
		pickers = { find_files = { hidden = true } },
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			},
			live_grep_args = {
				auto_quoting = true,
				mappings = {
					i = {
						["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
						["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({ postfix = " --iglob " }),
					},
				},
			},
			undo = {
				use_delta = false,
				use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
				side_by_side = false,
				diff_context_lines = vim.o.scrolloff,
				entry_format = "state #$ID, $STAT, $TIME",
				mappings = {
					i = {
						-- IMPORTANT: Note that telescope-undo must be available when telescope is configured if
						-- you want to replicate these defaults and use the following actions. This means
						-- installing as a dependency of telescope in it's `requirements` and loading this
						-- extension from there instead of having the separate plugin definition as outlined
						-- above.
						["<cr>"] = require("telescope-undo.actions").yank_additions,
						["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
						["<C-cr>"] = require("telescope-undo.actions").restore,
					},
				},
			},
		},
	}

	telescope.setup(config)
	telescope.load_extension("file_browser")
	telescope.load_extension("live_grep_args")
	telescope.load_extension("undo")
	telescope.load_extension("fzf")
	telescope.load_extension("vim_bookmarks")

	local grep_string_visual = function()
		local builtin = require("telescope.builtin")
		local visual_selection = function()
			local save_previous = vim.fn.getreg("a")
			vim.api.nvim_command('silent! normal! "ay')
			local selection = vim.fn.trim(vim.fn.getreg("a"))
			vim.fn.setreg("a", save_previous)
			return vim.fn.substitute(selection, [[\n]], [[\\n]], "g")
		end
		builtin.live_grep({
			default_text = visual_selection(),
		})
	end
end

return M

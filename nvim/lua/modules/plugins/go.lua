local u = require('utils')

--- on_attach
local on_attach = function(client, bufnr)
    -- commands
    u.buf_command(bufnr, 'LspDiagPrev', vim.diagnostic.goto_prev)
    u.buf_command(bufnr, 'LspDiagNext', vim.diagnostic.goto_next)
    u.buf_command(bufnr, 'LspDiagLine', vim.diagnostic.open_float)
    u.buf_command(bufnr, 'LspDiagQuickfix', vim.diagnostic.setqflist)
    u.buf_command(bufnr, 'LspSignatureHelp', vim.lsp.buf.signature_help)
    u.buf_command(bufnr, 'LspTypeDef', vim.lsp.buf.type_definition)
    u.buf_command(bufnr, 'LspDef', vim.lsp.buf.definition)
    u.buf_command(bufnr, 'LspRangeAct', vim.lsp.buf.code_action)
    u.buf_command(bufnr, 'LspAct', vim.lsp.buf.code_action)
    u.buf_command(bufnr, 'LspRename', function()
        vim.lsp.buf.rename()
    end)
    if client.name == 'rust-analyzer' then
        -- hover_with_actions has been deprecated from rust-tools settings
        u.buf_command(bufnr, 'LspHover', ':RustHoverActions<CR>')
    else
        u.buf_command(bufnr, 'LspHover', vim.lsp.buf.hover)
    end

    --- bindings
    u.buf_map(bufnr, 'n', '<leader>rn', ':LspRename<CR>')
    u.buf_map(bufnr, 'n', 'gd', ':LspDef<CR>')
    u.buf_map(bufnr, 'n', 'K', ':LspHover<CR>')
    u.buf_map(bufnr, 'n', '[d', ':LspDiagPrev<CR>')
    u.buf_map(bufnr, 'n', ']d', ':LspDiagNext<CR>')
    u.buf_map(bufnr, 'n', 'gl', ':LspDiagLine<CR>')
    u.buf_map(bufnr, 'n', '<leader>q', ':LspDiagQuickfix<CR>')
    u.buf_map(bufnr, 'i', 'gs', '<cmd>LspSignatureHelp<CR>')
    vim.keymap.set("n", "<leader>fa", "<cmd>lua vim.lsp.buf.format({async=true})<CR>")
    --- telescope
    u.buf_map(bufnr, 'n', '<leader>lr', ':Telescope lsp_references<CR>')
    u.buf_map(bufnr, 'n', '<leader>gd', ':Telescope lsp_type_definitions<CR>')
    u.buf_map(bufnr, 'n', '<leader>ca', '<cmd>LspAct<CR>')
    u.buf_map(bufnr, 'n', '<leader>CA', '<cmd>LspRangeAct<CR>')


    require('illuminate').on_attach(client)
end
require('go').setup(

    {
        goimport = "gopls", -- if set to 'gopls' will use gopls format, also goimport
        fillstruct = "gopls",
        gofmt = "gofumpt", -- if set to gopls will use gopls format
        max_line_len = 120,
        tag_transform = false,
        test_dir = "",
        comment_placeholder = "   ",
        icons = { breakpoint = "🧘", currentpos = "🏃" }, -- set to false to disable
        -- this option
        verbose = false,
        log_path = vim.fn.expand("$HOME") .. "/tmp/gonvim.log",
        lsp_cfg = true, -- false: do nothing
        -- true: apply non-default gopls setup defined in go/lsp.lua
        -- if lsp_cfg is a table, merge table with with non-default gopls setup in go/lsp.lua, e.g.
        lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
        lsp_on_attach = on_attach, -- nil: do nothing
        -- if lsp_on_attach is a function: use this function as on_attach function for gopls,
        -- when lsp_cfg is true
        lsp_keymaps = true, -- true: apply default lsp keymaps
        lsp_codelens = false,
        lsp_diag_hdlr = true, -- hook lsp diag handler
        lsp_inlay_hints = {
            enable = true,

            -- Only show inlay hints for the current line
            only_current_line = false,

            -- Event which triggers a refersh of the inlay hints.
            -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
            -- not that this may cause higher CPU usage.
            -- This option is only respected when only_current_line and
            -- autoSetHints both are true.
            only_current_line_autocmd = "CursorHold",

            -- whether to show variable name before type hints with the inlay hints or not
            -- default: false
            show_variable_name = true,

            -- prefix for parameter hints
            parameter_hints_prefix = " ",
            show_parameter_hints = true,

            -- prefix for all the other hints (type, chaining)
            other_hints_prefix = "=> ",

            -- whether to align to the lenght of the longest line in the file
            max_len_align = false,

            -- padding from the left if max_len_align is true
            max_len_align_padding = 1,

            -- whether to align to the extreme right or not
            right_align = false,

            -- padding from the right if right_align is true
            right_align_padding = 6,

            -- The color of the hints
            highlight = "Comment",
        },
        gopls_remote_auto = true,
        gocoverage_sign = "█",
        sign_priority = 7,
        dap_debug = true,
        dap_debug_gui = true,
        dap_debug_keymap = true, -- true: use keymap for debugger defined in go/dap.lua
        -- false: do not use keymap in go/dap.lua.  you must define your own.
        -- windows: use visual studio style of keymap
        dap_vt = true, -- false, true and 'all frames'
        textobjects = true,
        gopls_cmd = nil, --- you can provide gopls path and cmd if it not in PATH, e.g. cmd = {  "/home/ray/.local/nvim/data/lspinstall/go/gopls" }
        build_tags = "", --- you can provide extra build tags for tests or debugger
        test_runner = "go", -- one of {`go`, `richgo`, `dlv`, `ginkgo`}
        verbose_tests = true, -- set to add verbose flag to tests
        run_in_floaterm = false, -- set to true to run in float window.
        luasnip = false, -- set true to enable included luasnip
    }
)

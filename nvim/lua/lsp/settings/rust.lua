local srv_settings = {
    ['rust-analyzer'] = {
        updates = { channel = 'stable' },
        notifications = { cargoTomlNotFound = false },
        assist = {
            importGroup = true,
            importPrefix = 'by_crate',
        },
        callInfo = {
            full = true,
        },
        cargo = {
            allFeatures = true,
            autoreload = true,
            loadOutDirsFromCheck = true,
        },
        checkOnSave = {
            command = 'clippy',
            allFeatures = true,
        },
        completion = {
            addCallArgumentSnippets = true,
            addCallParenthesis = true,
            postfix = {
                enable = true,
            },
            autoimport = {
                enable = true,
            },
        },
        diagnostics = {
            enable = true,
            enableExperimental = true,
        },
        hoverActions = {
            enable = true,
            debug = true,
            gotoTypeDef = true,
            implementations = true,
            run = true,
            linksInHover = true,
        },
        inlayHints = {
            chainingHints = true,
            parameterHints = true,
            typeHints = true,
        },
        lens = {
            enable = true,
            debug = true,
            implementations = true,
            run = true,
            methodReferences = true,
            references = true,
        },
        procMacro = {
            enable = true,
        },
    },
}

local M = {
    setup = function(on_attach, capabilities)
        local rust_opts = {
            tools = {
                autoSetHints = true,
                hover_with_actions = true,
                runnables = {
                    use_telescope = true,
                },
                inlay_hints = {
                    only_current_line = false,
                    ony_current_line_autocmd = "CursorHold",
                    show_parameter_hints = true,
                    parameter_hints_prefix = "<- ",
                    other_hints_prefix = "=> ",
                    highlight = "Comment",
                },
                hover_actions = {
                    -- the border that is used for the hover window
                    -- see vim.api.nvim_open_win()
                    border = {
                        { "╭", "FloatBorder" },
                        { "─", "FloatBorder" },
                        { "╮", "FloatBorder" },
                        { "│", "FloatBorder" },
                        { "╯", "FloatBorder" },
                        { "─", "FloatBorder" },
                        { "╰", "FloatBorder" },
                        { "│", "FloatBorder" },
                    },

                    -- whether the hover action window gets automatically focused
                    auto_focus = false,
                },
            },
            -- lsp
            server = {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = srv_settings,
            },
        }
        require('rust-tools').setup(rust_opts)
    end,
}

return M

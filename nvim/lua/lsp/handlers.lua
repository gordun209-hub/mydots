local present3, navic = pcall(require, "nvim-navic")

local M = {}
M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end


  local codes = {
    -- Lua
    no_matching_function = {
      message = " Can't find a matching function",
      "redundant-parameter",
      "ovl_no_viable_function_in_call",
    },
    empty_block = {
      message = " That shouldn't be empty here",
      "empty-block",
    },
    missing_symbol = {
      message = " Here should be a symbol",
      "miss-symbol",
    },
    expected_semi_colon = {
      message = " Please put the `;` or `,`",
      "expected_semi_declaration",
      "miss-sep-in-table",
      "invalid_token_after_toplevel_declarator",
    },
    redefinition = {
      message = " That variable was defined before",
      icon = " ",
      "redefinition",
      "redefined-local",
      "no-duplicate-imports",
      "@typescript-eslint/no-redeclare",
      "import/no-duplicates"
    },
    no_matching_variable = {
      message = " Can't find that variable",
      "undefined-global",
      "reportUndefinedVariable",
    },
    trailing_whitespace = {
      message = "  Whitespaces are useless",
      "trailing-whitespace",
      "trailing-space",
    },
    unused_variable = {
      message = "  Don't define variables you don't use",
      icon = "  ",
      "unused-local",
      "@typescript-eslint/no-unused-vars",
      "no-unused-vars"
    },
    unused_function = {
      message = "  Don't define functions you don't use",
      "unused-function",
    },
    useless_symbols = {
      message = " Remove that useless symbols",
      "unknown-symbol",
    },
    wrong_type = {
      message = " Try to use the correct types",
      "init_conversion_failed",
    },
    undeclared_variable = {
      message = " Have you delcared that variable somewhere?",
      "undeclared_var_use",
    },
    lowercase_global = {
      message = " Should that be a global? (if so make it uppercase)",
      "lowercase-global",
    },
    -- Typescript
    no_console = {
      icon = "  ",
      "no-console",
    },
    -- Prettier
    prettier = {
      icon = "  ",
      "prettier/prettier"
    }
  }

  vim.diagnostic.config({
    severity_sort = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    virtual_text = false
  })
end
local function lsp_highlight_document(client)
  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then
    return
  end
  illuminate.on_attach(client)
end

-----------------------------------------------------------------


-------------------------------------------------------------------
---  -----------------------------------------------------------------
M.on_attach = function(client, bufnr)
  lsp_highlight_document(client)
  if client.supports_method("textDocument/documentSymbol") then
    navic.attach(client, bufnr)
  end

end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- capabilities.textDocument.completion.completionItem.resolveSupport = {
--   properties = {
--     "documentation",
--     "detail",
--     "additionalTextEdits",
--   },
-- }
return M

--------------------------------------------------------------------
--

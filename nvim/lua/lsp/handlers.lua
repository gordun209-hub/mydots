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



  vim.diagnostic.config {
    virtual_text = {
      source = "always",
      prefix = "ﱣ ",
      spacing = 6,
    },
    float = {
      source = "always",
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
  }
end

local function lsp_highlight_document(client, bufnr)
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = function()
        vim.lsp.buf.document_highlight()
      end,
      buffer = bufnr,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      callback = function()
        vim.lsp.buf.clear_references()
      end,
      buffer = bufnr,
    })
  end
end

-- local function lsp_highlight_document(client)
-- if client.server_capabilities.document_highlight then
-- local status_ok, illuminate = pcall(require, "illuminate")
-- if not status_ok then
-- return
-- end
-- illuminate.on_attach(client)
-- end
-- end

M.on_attach = function(client, bufnr)
  lsp_highlight_document(client)
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

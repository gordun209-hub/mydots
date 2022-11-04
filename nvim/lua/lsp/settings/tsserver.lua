local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')

local on_attach = function(client, bufnr)
  -- client.server_capabilities.documentFormattingProvider = false
  -- client.server_capabilities.documentRangeFormattingProvider = false
--  client.server_capabilities.document_formatting = false
--  client.server_capabilities.document_range_formatting = false
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
end

M.capabilities = capabilities;
M.on_attach = on_attach;

return M

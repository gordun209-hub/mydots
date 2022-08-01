local lsp = require("lspconfig")

local capabilities = require("lsp.handlers").capabilities

lsp.jsonls.setup({
  capabilities = capabilities,
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
  end,
  settings = {
    json = {
      validate = { enable = true },
      schemas = require('schemastore').json.schemas(),
    },
  },
})

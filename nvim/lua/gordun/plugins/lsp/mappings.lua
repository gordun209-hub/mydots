local M = {}
local ht = require("haskell-tools")
local def_opts = { noremap = true, silent = true }

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
-- Enable completion triggered by <c-x><c-o>

function M.on_attach(client, buffer)
  local opts = { noremap = true, silent = true }
  vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)
  if client.name == "hls" then
    vim.keymap.set("n", "<space>cr", vim.lsp.codelens.run, opts)
    vim.keymap.set("n", "<space>hs", ht.hoogle.hoogle_signature, opts)
    vim.keymap.set("n", "<leader>rr", ht.repl.toggle, def_opts)
    -- roggle a GHCi repl for the current buffer
    vim.keymap.set("n", "<leader>rf", function()
      ht.repl.toggle(vim.api.nvim_buf_get_name(0))
    end, def_opts)
    vim.keymap.set("n", "<leader>rq", ht.repl.quit, def_opts)
  end

  if client.name == "rust-analyzer" then
    local rt = require("rust-tools")
    vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = buffer })
    vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = buffer })
  end
  -- Mappings.
  local bufopts = { noremap = true, silent = true, buffer = buffer }
  vim.keymap.set("n", "<leader>G", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "<leader>g", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<C-n>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<space>fa", function()
    vim.lsp.buf.format({ async = true })
  end, bufopts)
end

return M

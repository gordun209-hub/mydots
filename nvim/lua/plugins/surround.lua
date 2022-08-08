local status_ok, surround = pcall(require, "nvim-surround")
if not status_ok then
  return
end

surround.setup {
  keymaps = { -- vim-surround style keymaps
    insert = "<C-g>s",
    insert_line = "<C-g>S",
    normal = "s",
    normal_cur = "ss",
    normal_line = "S",
    normal_cur_line = "SS",
    visual = "s",
    visual_line = "gS",
    delete = "ds",
    change = "cs",
  },
  -- highlight_motion = { -- Highlight before inserting/changing surrounds
  --   duration = 0,
  -- },
}

-- local opts = { noremap = true, silent = true }
-- local keymap = vim.api.nvim_set_keymap

-- keymap("n", "<leader>'", [[ysiw']], opts)


vim.cmd[[nmap <leader>' siw']]


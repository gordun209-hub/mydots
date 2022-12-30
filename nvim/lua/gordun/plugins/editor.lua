vim.g.neo_tree_remove_legacy_commands = 1

return {

  -- fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = { { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" } },
    config = true,
  },
  -- which-key
}

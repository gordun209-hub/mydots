return {
  {
    "numToStr/Navigator.nvim",
    cmd = { "NavigatorLeft", "NavigatorRight", "NavigatorUp", "NavigatorDown" },
    config = function()
      require("Navigator").setup()
    end,
  },
}

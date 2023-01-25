local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
    spec = {

        { import = "gordun.plugins" },
    },

    install = { colorscheme = { "falcon" } },
    defaults = {
        lazy = true,
    },

    checker = {
        enabled = true,
    },

    change_detection = {
        enabled = true,
        notify = false,
    },

    ui = {
        icons = {
            cmd = " ",
            config = " ",
            event = " ",
            ft = " ",
            import = " ",
            init = " ",
            keys = " ",
            plugin = " ",
            runtime = " ",
            source = " ",
            start = " ",
            task = " ",
        },
    },
    diff = {
        cmd = "git",
    },
})

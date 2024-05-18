local install_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(install_path) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        install_path,
    })
end
vim.opt.rtp:prepend(install_path)

require("lazy").setup({
    { import = "CodeNvim/plugin" },
}, {
    install = { colorscheme = { "habamax.nvim" } },
    defaults = {
        lazy = true,
    },
    lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json",
})


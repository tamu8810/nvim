local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

vim.fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path
})

local status, packer = pcall(require, "packer")

if (not status) then
    print("Run the packer installation script")
    require("plugin.packer_install")
end

vim.cmd [[ packadd packer.nvim ]]

packer.startup(function(use)
	use "wbthomason/packer.nvim"
    use "nvim-lua/plenary.nvim"
    use "nvim-tree/nvim-web-devicons"
    use "MunifTanjim/nui.nvim"
    use "navarasu/onedark.nvim"
    use "akinsho/bufferline.nvim"
    use "nvim-lualine/lualine.nvim"
    use "lukas-reineke/indent-blankline.nvim"
    use "windwp/nvim-autopairs"
    use "nvim-tree/nvim-tree.lua"
    use "nvim-telescope/telescope.nvim"
end)

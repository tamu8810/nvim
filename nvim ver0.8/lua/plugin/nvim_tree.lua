local status, nvim_tree = pcall(require, "nvim-tree")
if (not status) then return end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.nvim_tree_respect_buf_cwd = 1

local config = {}

config.disable_netrw = true
config.hijack_netrw = true

config.view = {
    width = 25,
    cursorline = false
}

config.update_focused_file = {
    enable = true,
    update_cwd = true
}

config.renderer = {
    indent_width = 2,
    root_folder_label = ":~:s?$?",
    indent_markers = {
        enable = true,
        inline_arrows = false,
        icons = {
            corner = "└",
            edge = "│",
            item = "│",
            bottom = " ",
            none = " "
        }
    },
    icons = {
        show = {
            folder_arrow = false
        }
    }
}

nvim_tree.setup(config)

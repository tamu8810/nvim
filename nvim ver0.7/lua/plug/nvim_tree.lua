local function config()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.g.nvim_tree_respect_buf_cwd = 1

    local config = {}

    config.disable_netrw = true
    config.hijack_netrw = true

    config.view = {
        width = 25
    }

    config.renderer = {
        indent_markers = {
            enable = true,
            inline_arrows = false
        }
    }

    require("nvim-tree").setup(config)

    -- highlight
    vim.cmd("hi NvimTreeIndentMarker guifg=#3b4252")

    -- keymap
    vim.keymap.set("n", "<c-e>", "<cmd>lua require('nvim-tree.api').tree.toggle({ focus = false })<cr>")

    -- auto close
    local function is_modified_buffer_open(buffers)
        for _, v in pairs(buffers) do
            if v.name:match("NvimTree_") == nil then
                return true
            end
        end
        return false
    end

    vim.api.nvim_create_autocmd("BufEnter", {
        nested = true,
        callback = function()
            if
                #vim.api.nvim_list_wins() == 1
                and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil
                and is_modified_buffer_open(vim.fn.getbufinfo({ bufmodified = 1 })) == false
            then
                vim.cmd("quit")
            end
        end,
    })
end

return {
    "nvim-tree/nvim-tree.lua",
    lazy = true,
    keys = "<c-e>",
    config = config,
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    }
}

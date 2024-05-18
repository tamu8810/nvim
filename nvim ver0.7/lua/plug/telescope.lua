local function config()
    local telescope = require("telescope")
    local action = require("telescope.actions")
    
    local config = {}

    config.sorting_strategy = "ascending"

    config.layout_config = {
        vertical = {
            height = 0.5,
            width = 0.6,
            prompt_position = "top"
        }
    }

    config.mappings = {
        i = {
            ["<c-p>"] = action.close,
            ["<c-j>"] = action.move_selection_next,
            ["<c-k>"] = action.move_selection_previous,
            ["<c-o>"] = action.select_default,
            ["<c-v>"] = action.select_vertical,
            ["<c-h>"] = action.select_horizontal
        },
        n = {
            ["<c-p>"] = action.close,
            ["<c-j>"] = action.move_selection_next,
            ["<c-k>"] = action.move_selection_previous,
            ["<c-o>"] = action.select_default,
            ["<c-v>"] = action.select_vertical,
            ["<c-h>"] = action.select_horizontal,
            ["+"] = action.add_selection,
            ["-"] = action.remove_selection
        }
    }

    config.layout_strategy = "vertical"

    config.prompt_prefix = "󰍉 "
    config.selection_caret = " "
    config.entry_prefix = " "
    config.multi_icon = "󰄬 "

    telescope.setup({ defaults = config })

    vim.keymap.set("n", "<c-p>", "<cmd>Telescope fd<cr>")
end

return {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    keys = "<c-p>",
    config = config,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons"
    }
}

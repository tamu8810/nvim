local status, telescope = pcall(require, "telescope")
if (not status) then return end

local config = {}

config.prompt_prefix = "󰍉 "
config.selection_caret = " "
config.entry_prefix = " "
config.multi_icon = "󰄬 "

local action = require("telescope.actions")

config.mappings = {
    i = {
        ["<C-p>"] = action.close,
        ["<C-j>"] = action.move_selection_next,
        ["<C-k>"] = action.move_selection_previous,
        ["<C-o>"] = action.select_default,
        ["<C-v>"] = action.select_vertical,
        ["<C-h>"] = action.select_horizontal
    },
    n = {
        ["<C-p>"] = action.close,
        ["<C-j>"] = action.move_selection_next,
        ["<C-k>"] = action.move_selection_previous,
        ["<C-o>"] = action.select_default,
        ["<C-v>"] = action.select_vertical,
        ["<C-h>"] = action.select_horizontal,
        ["+"] = action.add_selection,
        ["-"] = action.remove_selection
    }
}

telescope.setup({ defaults = config })

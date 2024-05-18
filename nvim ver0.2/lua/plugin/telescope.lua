local function custom()
  local telescope = require("telescope")
  local action = require("telescope.actions")

  telescope.setup({
    defaults = {
      sorting_strategy = "ascending",
      layout_config = {
        vertical = {
          height = 0.5,
          width = 0.6,
          prompt_position = "top"
        }
      },
      mappings = {
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
      },
      layout_strategy = 'vertical',
      prompt_prefix = "󰍉 ",
      selection_caret = "  ",
      entry_prefix = " ",
      multi_icon = "󰄬 ",
    },
  })
end

return {
  "nvim-telescope/telescope.nvim",
  lazy = true,
  event = "CmdlineEnter",
  cmd = "Telescope",
  config = custom,

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons"
  }
}

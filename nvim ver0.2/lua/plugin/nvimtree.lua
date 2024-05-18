local function custom()
  local nvimtree = require("nvim-tree")
  local nvimtree_api = require("nvim-tree.api")

  -- @brief : Disable netrw
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  -- @brief : Auto move directory
  vim.g.nvim_tree_respect_buf_cwd = 1

  nvimtree.setup({

    -- @brief : Sort setting
    sort_by = "extension",

    -- @brief : Ui setting
    view = {
      side = "right",
      width = 25,
      signcolumn = "yes"
    },

    -- brief : Focused setting
    update_focused_file = {
      enable = true,
      update_cwd = true
    },

    -- @brief : Renderer setting
    renderer = {
      indent_width = 1,
    },
  })

  -- @brief : Auto close command
  vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
      if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
  })

  -- @brief : Startup open
  nvimtree_api.tree.toggle({ focus = false })

end

return {
  "nvim-tree/nvim-tree.lua",
  lazy = true,
  event = "VimEnter",
  config = custom,

  dependencies = {
    "nvim-tree/nvim-web-devicons"
  }
}

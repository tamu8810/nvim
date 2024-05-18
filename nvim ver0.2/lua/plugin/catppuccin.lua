local function custom()
  local catppuccin = require("catppuccin")

  -- @brief : Catppuccin's setup configs
  catppuccin.setup({

    -- @brief : Select flavour
    -- @param : Latte, Frappe, Macchiato, Mocha
    flavour = "Frappe",

    -- @brief : Toggle background transparency
    transparent_background = true,

    -- @brief : Setting of font style
    no_bold = true,
    no_italic = true,
    no_underline = true,

    -- @brief : Highlight support for other plugins
    integrations = {
      cmp = true,
      nvimtree = true,
      treesitter = true
    }
  })

  -- Load colorscheme
  catppuccin.load()
end

return {
  "catppuccin/nvim",

  -- @brief : Change plugin name
  name = "catppuccin",
  priority = 1000,

  -- @brief : Whether to lazy load and its setting
  lazy = false,

  -- @brief : Plugin config
  config = custom
}

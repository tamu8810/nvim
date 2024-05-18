local utils = require("tamu8810.utils")

return {
  {
    "rcarriga/nvim-notify",
    opts = {
      fps = 60,
      timeout = 300,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      render = "compact",
      stages = "fade_in_slide_out",
      top_down = false,
    },
  },
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    event = "VeryLazy",
    opts = {
      presets = {
        bottom_search = true,
        command_palette = true,
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "echasnovski/mini.bufremove",
    },
    event = "VeryLazy",
    opts = function()
      local bufferline = require("bufferline")
      local bufremove = require("mini.bufremove")
      local palette = require("onedark.palette").dark
      return {
        options = {
          close_command = function(n) bufremove.delete(n, false) end,
          right_mouse_command = function(n) bufremove.delete(n, false) end,
          modified_icon = "",
          indicator = { style = "none" },
          separator_style = { "", "" },
          style_preset = {
            bufferline.style_preset.no_italic,
            bufferline.style_preset.no_bold,
          },
        },
        highlights = {
          modified = {
            fg = palette.fg,
          },
          modified_selected = {
            fg = palette.fg,
          },
          modified_visible = {
            fg = palette.fg,
          }
        },
      }
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "VeryLazy",
    opts = {
      indent = {
        char = "▏",
        tab_char = "▏",
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          "help",
          "lazy",
          "mason",
        },
      },
    },
  },
  {
    "echasnovski/mini.indentscope",
    version = "*",
    event = "VeryLazy",
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "lazy",
          "mason"
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
    opts = {
      mappings = {
        object_scope = "",
        object_scope_with_border = "",
        goto_top = "",
        goto_bottom = "",
      },
      symbol = "▏",
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    config = function()
      utils.which_key_register()
    end,
  },
}

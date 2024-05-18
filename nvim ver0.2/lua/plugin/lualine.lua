local function custom()
  local colors = {
    dark = "#303446",
    black = "#414559",
    blue = "#BABBF1",
    grey = "#838BA7",
    yellow = "#EEBEBE",
    red = "#EA999C"
  }

  local frappe = {
    normal = {
      a = { fg = colors.black, bg = colors.blue, gui = "bold" },
      b = { fg = colors.black, bg = colors.red },
      c = { fg = colors.grey,  bg = colors.black },
      z = { fg = colors.black, bg = colors.yellow }
    },
    insert  = {
      a = { fg = colors.black, bg = colors.blue, gui = "bold" },
      b = { fg = colors.black, bg = colors.red },
      c = { fg = colors.grey,  bg = colors.black },
      z = { fg = colors.black, bg = colors.yellow }
    },
    visual  = {
      a = { fg = colors.black, bg = colors.blue, gui = "bold" },
      b = { fg = colors.black, bg = colors.red },
      c = { fg = colors.grey,  bg = colors.black },
      z = { fg = colors.black, bg = colors.yellow }
    },
    replace = {
      a = { fg = colors.black, bg = colors.blue, gui = "bold" },
      b = { fg = colors.black, bg = colors.red },
      c = { fg = colors.grey,  bg = colors.black },
      z = { fg = colors.black, bg = colors.yellow }
    },
    inactive = {
      a = { fg = colors.white, bg = colors.dark },
      b = { fg = colors.white, bg = colors.dark },
      c = { fg = colors.black, bg = colors.dark }
    }
  }

  local mode_map = {
    ["n"] = " NORMAL",
    ["no"] = " O-PENDING",
    ["nov"] = " O-PENDING",
    ["noV"] = " O-PENDING",
    ["no\22"] = " O-PENDING",
    ["niI"] = " NORMAL",
    ["niR"] = " NORMAL",
    ["niV"] = " NORMAL",
    ["nt"] = " NORMAL",
    ["ntT"] = " NORMAL",
    ["v"] = " VISUAL",
    ["vs"] = " VISUAL",
    ["V"] = " V-LINE",
    ["Vs"] = " V-LINE",
    ["\22"] = " V-BLOCK",
    ["\22s"] = " V-BLOCK",
    ["s"] = " SELECT",
    ["S"] = " S-LINE",
    ["\19"] = " S-BLOCK",
    ["i"] = " INSERT",
    ["ic"] = " INSERT",
    ["ix"] = " INSERT",
    ["R"] = " REPLACE",
    ["Rc"] = " REPLACE",
    ["Rx"] = " REPLACE",
    ["Rv"] = " V-REPLACE",
    ["Rvc"] = " V-REPLACE",
    ["Rvx"] = " V-REPLACE",
    ["c"] = " COMMAND",
    ["cv"] = " EX",
    ["ce"] = " EX",
    ["r"] = " REPLACE",
    ["rm"] = " MORE",
    ["r?"] = " CONFIRM",
    ["!"] = " SHELL",
    ["t"] = " TERMINAL"
  }

  require("lualine").setup({
    options = {
      theme = frappe,
      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" }
    },
    sections = {
     lualine_a = {
        {
          "mode",
          icon = ""
        }
      },
      lualine_b = {
        "branch"
      },
      lualine_c = {
        function()
          return "%p%% %l:%c"
        end
      },
      lualine_x = {
        function()
          return "%{&fenc!=#''?&fenc:&enc}"
        end
      },
      lualine_y = {
        {
          "filetype",
          colored = false,
          icon_only = true,
          padding = { left = 1, right = 0 }
        },
        { 
          "filename",
          file_status = false,
          newfile_status = false,
        }
      },
      lualine_z = {
        {
          "filename",
          file_status = false,
          newfile_status = false,
          path = 4,
          icon = "󰉖"
        }
      }
    }
  })
end

return {
  "nvim-lualine/lualine.nvim",
  lazy = true,
  event = "VimEnter",
  config = custom,

  dependencies = {
    "nvim-tree/nvim-web-devicons"
  }
}

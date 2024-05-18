-- Lazy Init -------------------------------------------------------

local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazy_path) then
  vim.fn.system({
    "git", "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazy_path
  })
end

vim.opt.rtp:prepend(lazy_path)

-- Catppuccin Config ---------------------------------------------

local function config_catppuccin()
  local configs = {}

  configs.flavour = "frappe"

  --configs.transparent_background = true

  configs.no_bold = true
  configs.no_italic = true
  configs.no_underline = true

  configs.integrations = {
    treesitter = true
  }

  require("catppuccin").setup(configs)
  require("catppuccin").load()
end

-- Treesitter Config ---------------------------------------------

local function config_treesitter()
  local configs = {}

  configs.highlight = {
    enable = true,
  }

  require("nvim-treesitter.configs").setup(configs)
end

-- Noice Config --------------------------------------------------

local function config_noice()
  local configs = {}

  configs.messages = {
    view = "mini",
    view_error = "mini",
    view_warn = "mini",
    view_history = "mini"
  }

  configs.notify = {
    enabled = false
  }

  require("noice").setup(configs)
end

-- Lualine Config ------------------------------------------------

local function config_lualine()
  local configs = {}

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

  configs.options = {
    theme = frappe,
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" }
  }

  configs.sections = {
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
      {
        function()
          return "%3p%% %3l:%3c%="
        end
      },
      {
        "diagnostics",
        sources = { "nvim_lsp" },
        symbols = { error = " ", warn = " ", info = " " },
        diagnostics_color = {
          color_error = { fg = "#e78284" },
          color_warn = { fg = "#e5c890" },
          color_info = { fg = "#7bbeb6" },
        },
        padding = { left = 30, right = 30 },
      },
    },
    lualine_x = {
      function()
        return "󰅡 tamu"
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
        symbols = {
          unnamed = "file",
          newfile = "new"
        }
      }
    },
    lualine_z = {
      {
        "filename",
        file_status = false,
        newfile_status = false,
        path = 4,
        symbols = {
          unnamed = "dir",
          newfile = "dir"
        },
        icon = "󰉖"
      }
    }
  }

  require("lualine").setup(configs)
end

-- Nvimtree Config ------------------------------------------------

local function config_nvimtree()
  local configs = {}

  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
  vim.g.nvim_tree_respect_buf_cwd = 1

  configs.sort_by = "extension"

  configs.view = {
    side = "left",
    width = 25,
    signcolumn = "yes"
  }

  configs.update_focused_file = {
    enable = true,
    update_cwd = true
  }

  configs.renderer = {
    indent_width = 1
  }

  require("nvim-tree").setup(configs)
  require("nvim-tree.api").tree.toggle({ focus = false })
end

-- Telescope Config ----------------------------------------------

local function config_telescope()
  local configs = {}
  local action = require("telescope.actions")

  configs.defaults = {
    sorting_strategy = "ascending",
    layout_config = {
      vertical = {
        height = 0.9,
        width = 0.6,
        preview_cutoff = 30,
        prompt_position = "bottom"
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
        ["-"] = action.remove_selection,
      }
    },
    layout_strategy = "vertical",
    prompt_prefix = "󰍉 ",
    selection_caret = "  ",
    entry_prefix = " ",
    multi_icon = "󰄬 "
  }

  require("telescope").setup(configs)
end

-- Lsp Config ----------------------------------------------------

local function config_lsp()
  require("mason").setup()
  require("mason-lspconfig").setup_handlers({
    function(server)
      local opt = {
        capabilities = require("cmp_nvim_lsp").default_capabilities(
          vim.lsp.protocol.make_client_capabilities()
        )
      }
      require("lspconfig")[server].setup(opt)
    end
  })
end

-- Cmp Config ----------------------------------------------------

local function config_cmp()
  local cmp = require("cmp")
  local map = require("cmp").mapping

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "vsnip" },
      { name = "buffer" },
      { name = "path" }
    },
    mapping = map.preset.insert {
      ["<tab>"] = map.confirm { select = true }
    },
    experimental = {
      ghost_text = true
    },
    window = {
      completion = cmp.config.window.bordered {
        scrollbar = false
      }
    }
  })
  cmp.setup.cmdline({ "/", "?" }, {
    mapping = map.preset.cmdline(),
    sources = {
      { name = "buffer" }
    }
  })
  cmp.setup.cmdline(":", {
    mapping = map.preset.cmdline(),
    sources = {
      { name = "cmdline" },
      { name = "path" }
    }
  })
end
-- Toggleterm Config ----------------------------------------------

local function config_toggleterm()
  local configs = {}

  local powershell_options = {
    shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
    shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
    shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
    shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
    shellquote = "",
    shellxquote = "",
  }

  for option, value in pairs(powershell_options) do
    vim.opt[option] = value
  end

  configs.direction = "float"

  require("toggleterm").setup(configs)
end

-- Indentblankline Config -----------------------------------------

local function config_indentblankline()
  local configs = {}

  configs.debounce = 100
  configs.indent = { char = "▏" }
  configs.scope = { enabled = false }
  configs.viewport_buffer = { min = 30, max = 100 }

  require("ibl").setup(configs)
end

-- Lazy Config ---------------------------------------------------

local plugin_list = {
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    config = config_catppuccin
  },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    version = false,
    build = ":TSUpdate",
    event = "VimEnter",
    config = config_treesitter,
  },
  {
    "folke/noice.nvim",
    event = "VimEnter",
    config = config_noice,
    dependencies = {
      "MunifTanjim/nui.nvim"
    }
  },
  {
    "nvim-lualine/lualine.nvim",
    lazy = true,
    event = "VimEnter",
    config = config_lualine,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    }
  },
  {
    "nvim-tree/nvim-tree.lua",
    lazy = true,
    event = "VimEnter",
    config = config_nvimtree,
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    }
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = true,
    event = "VimEnter",
    config = config_indentblankline
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    lazy = true,
    event = "VimEnter",
  },
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    event = "CmdlineEnter",
    cmd = "Telescope",
    config = config_telescope,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons"
    }
  },
  {
    "neovim/nvim-lspconfig",
    --lazy = true,
    --event = "VimEnter",
    config = config_lsp,
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    }
  },
  {
    "hrsh7th/nvim-cmp",
    lazy = true,
    event = { "InsertEnter", "CmdlineEnter" },
    config = config_cmp,
    dependencies = {
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-vsnip"
    }
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = true,
    event = "VimEnter",
    config = config_toggleterm
  }
}

local lazy_option = {
  install = {
    missing = false,
    colorscheme = { "catppuccin" }
  },
  checker = {
    enabled = true,
    notify = false
  },
  change_detection = {
    notify = false
  },
  readme = {
    enabled = false,
    skip_if_doc_exists = false
  },
  ui = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
  }
}

require("lazy").setup({ plugin_list }, { lazy_option })

-- Options -------------------------------------------------------

local set_global = vim.api.nvim_set_option
local set_window = vim.api.nvim_win_set_option
local set_buffer = vim.api.nvim_buf_set_option
local set_autocmd = vim.api.nvim_create_autocmd
local set_augroup = vim.api.nvim_create_augroup

set_global("encoding", "utf-8")
set_global("fileencoding", "utf-8")
set_global("clipboard", "unnamedplus")

set_global("background", "dark")
set_global("termguicolors", true)

set_global("guicursor", "a:block")

set_global("laststatus", 3)
set_global("showmode", false)

set_global("smartcase", true)
set_global("ignorecase", true)

set_window(0, "number", true)
set_window(0, "signcolumn", "yes")
set_window(0, "cursorline", true)

set_window(0, "wrap", false)
set_window(0, "sidescroll", 5)

set_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = "*",
	group = set_augroup("buffer_set_options", {}),
	callback = function()
		set_buffer(0, "tabstop", 2)
		set_buffer(0, "shiftwidth", 0)
		set_buffer(0, "expandtab", true)
	end
})

set_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}),
  pattern = "NvimTree_*",
  callback = function()
    local layout = vim.api.nvim_call_function("winlayout", {})
    if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then vim.cmd("confirm quit") end
  end
})


-- Keymaps -------------------------------------------------------

local set_keymap = vim.api.nvim_set_keymap
local set_option = { silent = true, noremap = true }

set_keymap("t", "<esc>", "<c-\\><c-n>", set_option)
set_keymap("t", "<c-;>", "<c-\\><c-n>", set_option)
set_keymap("n", "<c-;>", "<esc>", set_option)
set_keymap("i", "<c-;>", "<esc>", set_option)
set_keymap("v", "<c-;>", "<esc>", set_option)
set_keymap("c", "<c-;>", "<esc>", set_option)
set_keymap("s", "<c-;>", "<esc>", set_option)

set_keymap("n", "<tab>", "<cmd> bn <cr>", set_option)
set_keymap("n", "<s-tab>", "<cmd> bp <cr>", set_option)

set_keymap("n", "*", "*N", set_option)
set_keymap("n", "<c-n>", "<cmd> noh <cr>", set_option)

set_keymap("n", "<c-e>", "<cmd> lua require('nvim-tree.api').tree.toggle({ focus = false }) <cr>", set_option)

set_keymap("n", "<c-p>", "<cmd> Telescope fd <cr>", set_option)
set_keymap("n", "<c-l>", "<cmd> Telescope current_buffer_fuzzy_find <cr>", set_option)

set_keymap("n", "<c-t>", "<cmd> ToggleTerm <cr>", set_option)
set_keymap("t", "<c-t>", "<cmd> ToggleTerm <cr>", set_option)

-- Commandsl -----------------------------------------------------

--vim.cmd("highlight Cursorline guibg=NONE ctermbg=NONE")

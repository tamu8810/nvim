local function custom()
  local cmp = require("cmp")
  local map = require("cmp").mapping

  vim.cmd("highlight! FloatBorder guibg=NONE guifg=#8caaee")

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
      ["<Tab>"] = map.confirm {
        select = true
      }
    },
    experimental = {
      ghost_text = true
    },
    window = {
      completion = cmp.config.window.bordered {
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        scrollbar = false
      }
    }
  })

  cmp.setup.cmdline({ "/", "?" }, {
    mapping = map.preset.cmdline(),
    sources = {
      { name = "buffer" },
    }
  })

  cmp.setup.cmdline(":", {
    mapping = map.preset.cmdline(),
    sources = {
      { name = "cmdline" },
      { name = "path" },
    }
  })
end

return {
  "hrsh7th/nvim-cmp",
  lazy = true,
  event = { "InsertEnter", "CmdlineEnter" },
  config = custom,

  dependencies = {
    "hrsh7th/vim-vsnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-vsnip"
  }
}

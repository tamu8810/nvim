local function config()
    local cmp = require("cmp")
    local map = require("cmp").mapping

    local default_config = {}
    local cmdline_config = {}
    local search_config = {}

    -- snippet
    default_config.snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end
    }

    -- source
    default_config.sources = {
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "buffer" }
    }
    cmdline_config.sources = {
        { name = "cmdline" },
        { name = "path" }
    }
    search_config.sources = {
        { name = "buffer" }
    }

    -- mapping
    default_config.mapping = map.preset.insert {
        ["<tab>"] = map.confirm {
            select = true
        }
    }
    cmdline_config.mapping = map.preset.cmdline()
    search_config.mapping = map.preset.cmdline()

    -- other
    default_config.experimental = {
        ghost_text = true
    }

    default_config.window = {
        scrollbar = false
    }

    cmp.setup(default_config)
    cmp.setup.cmdline({ ":" }, cmdline_config)
    cmp.setup.cmdline({ "/", "?" }, search_config)
end

return {
    "hrsh7th/nvim-cmp",
    lazy = true,
    event = { "InsertEnter", "CmdlineEnter" },
    config = config,
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp"
    }
}

return {
    {
        "echasnovski/mini.bufremove",
        event = "VeryLazy",
    },
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        opts = function()
            local bufferline = require("bufferline")
            local bufremove = require("mini.bufremove")
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
        "nvim-lualine/lualine.nvim",
        --event = "VeryLazy",
        opts = {
        },
    },
}


return {
    {
        "navarasu/onedark.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("onedark").setup({
                code_style = {
                    comments = "none",
                },
                colors = {
                    bright_orange = "#ff8800",
                },
                highlights = {
                    Delimiter = { fg = "$red" },
                    TSConstructor = { fg = "$red" },
                    TSPunctDelimiter = { fg = "$red" },
                    TSPunctBracket = { fg = "$red" },
                    ["@constructor"] = { fg = "$red" },
                    ["@punctuation.bracket"] = { fg = "$red" },
                    ["@punctuation.delimiter"] = { fg = "$red" },
                },
            })
            require("onedark").load()
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        build = ":TSUpdate",
    },
}


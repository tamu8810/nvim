local function config()
    -- use nord theme
    local highlight = require("nord").bufferline.highlights({
        italic = false,
        bold = false
    })

    local config = {}

    config.options = {
        modified_icon = "",
        indicator = {
            style = "none"
        },
        separator_style = { "", "" },
        show_buffer_close_icons = false,

        -- filetype setting
        offsets = {
            {
                filetype = "NvimTree",
                text = "Files",
                highlight = "Directory",
                separator = false
            }
        }
    }

    config.highlights = highlight

    require("bufferline").setup(config)
end

return {
    "akinsho/bufferline.nvim",
    lazy = true,
    event = "BufEnter",
    config = config,
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    }
}

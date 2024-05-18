local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

local config = {}

config.options = {
    modified_icon = "",
    indicator = {
        style = "none"
    },
    separator_style = { "", "" },
    style_preset = {
        bufferline.style_preset.no_italic,
        bufferline.style_preset.no_bold
    },
    offsets = {
        {
            filetype = "NvimTree",
            text = "Files",
            highlight = "Directory"
        }
    }
}

config.highlights = {
    modified = {
        fg = "#ABB2BF"
    },
    modified_selected = {
        fg = "#ABB2BF"
    },
    modified_visible = {
        fg = "#ABB2BF"
    }
}

bufferline.setup(config)

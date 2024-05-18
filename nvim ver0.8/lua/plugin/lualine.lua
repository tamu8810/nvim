local status, lualine = pcall(require, "lualine")
if (not status) then return end

local color = {
    bg = "#2C323C",
    fg = "#ABB2BF",
    red = "#BBC2CF",
    yellow = "#E5C07B",
    green = "#98C379",
    blue = "#61AFEF",
    light_blue = "#56B6C2"
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end
}

local config = {
    options = {
        theme = {
            normal = { c = { fg = color.fg, bg = color.bg } },
            inactive = { c = { fg = color.fg, bg = color.bg } }
        },
        component_separators = "",
        section_separators = ""
    },
    sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    inactive_secions = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    }
}

local function add_left_section(component)
    table.insert(config.sections.lualine_c, component)
end
local function add_right_section(component)
    table.insert(config.sections.lualine_x, component)
end

add_left_section {
    function()
        return "▊"
    end,
    color = { fg = color.blue },
    padding = { left = 0, right = 1 }
}
add_left_section {
    function()
        return ""
    end,
    color = { fg = color.green },
    padding = { right = 1 }
}
add_left_section {
    "filesize",
    cond = conditions.buffer_not_empty
}
add_left_section {
    "filetype",
    colored = true,
    icon_only = true,
    padding = { left = 1, right = 0 }
}
add_left_section {
    function()
        return "%t"
    end,
    cond = conditions.buffer_not_empty,
    color = { fg = color.light_blue }
}
add_left_section {
    function()
        return "%2l:%2c"
    end
}
add_left_section {
    "progress",
    color = { fg = color.fg, gui = "bold" },
    padding = { left = 0 }
}
add_left_section {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = " ", warn = " ", info = " " },
    diagnostics_color = {
        color_error = { fg = color.red },
        color_warn = { fg = color.yellow },
        color_info = { fg = color.cyan },
    },
    padding = { left = 2 }
}

add_left_section {
    function()
        return "%="
    end
}

add_right_section {
    "o:encoding",
    fmt = string.upper,
    cond = conditions.hide_in_width,
    color = { fg = color.light_blue }
}
add_right_section {
    function()
        return "%{&filetype}"
    end,
    color = { fg = color.yellow }
}
add_right_section {
    "fileformat",
    fmt = string.upper,
    icons_enabled = false,
    color = { fg = color.light_blue }
}
add_right_section {
  function()
    return "▊"
  end,
  color = { fg = color.blue },
  padding = { left = 1 },
}

lualine.setup(config)

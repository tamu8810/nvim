local status, lualine = pcall(require, 'lualine')
if (not status) then return end

local colors = {
  color3   = '#2c3043',
  color6   = '#a1aab8',
  color7   = '#82aaff',
  color8   = '#ae81ff',
  color0   = '#092236',
  color1   = '#ff5874',
  color2   = '#c3ccdc',
}

local theme = {
  replace = {
    a = { fg = colors.color0, bg = colors.color1 },
    b = { fg = colors.color2, bg = colors.color3 },
  },
  inactive = {
    a = { fg = colors.color6, bg = colors.color3 },
    b = { fg = colors.color6, bg = colors.color3 },
    c = { fg = colors.color6, bg = colors.color3 },
  },
  normal = {
    a = { fg = colors.color0, bg = colors.color7 },
    b = { fg = colors.color2, bg = colors.color3 },
    c = { fg = colors.color2, bg = colors.color3 },
  },
  visual = {
    a = { fg = colors.color0, bg = colors.color8 },
    b = { fg = colors.color2, bg = colors.color3 },
  },
  insert = {
    a = { fg = colors.color0, bg = colors.color2 },
    b = { fg = colors.color2, bg = colors.color3 },
  },
}

local config = {}

config.options = {
  theme = theme,
  icons_enabled = true,
  section_separators = ''
}

config.sections = {
  lualine_a = { 'mode', '%M' },
  lualine_b = { '%t' },
  lualine_c = {},
  lualine_x = {},
  lualine_y = { 'location', 'filetype', 'encoding' },
  lualine_z = {}
}

lualine.setup(config)

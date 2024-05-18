local status, ts = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

local config = {}

config.highlight = {
  enable = true,
  disable = {}
}

config.indent = {
  enable = true,
  disable = {}
}

config.autotag = {
  enable = true
}

config.source_installed = {
  'lua',
  'cpp',
  'json',
  'toml',
  'yaml',
  'markdown',
  'html',
  'css',
  'php',
  'javascript',
  'typescript'
}

ts.setup(config)

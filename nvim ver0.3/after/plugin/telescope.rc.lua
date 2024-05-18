local status, telescope = pcall(require, 'telescope')
if (not status) then return end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local fb_actions = require('telescope').extensions.file_browser.actions

local config = {}

config.defaults = {
  mappings = {
    i = {
      ['<C-p>'] = actions.close
    },
    n = {
     ['<C-p>'] = actions.close
    }
  }
}

config.extensions = {
  file_browser = {
    theme = 'dropdown'
  }
}

telescope.setup(config)
telescope.load_extension('file_browser')

vim.keymap.set('n', ';f', function()
  builtin.fd()
end)
vim.keymap.set('n', ';g', function()
  builtin.live_grep()
end)
vim.keymap.set('n', ';b', function()
  builtin.buffers()
end)
vim.keymap.set('n', ';e', function()
  telescope.extensions.file_browser.file_browser({
    hidden = true,
    layout_config = { height = 40 }
  })
end)

local status, cmp = pcall(require, 'cmp')
if (not status) then return end

local mapping = require('cmp').mapping

local config = {}

config.mapping = mapping.preset.insert({
  ['<C-j>'] = mapping.select_next_item(),
  ['<C-k>'] = mapping.select_prev_item(),
  ['<Tab>'] = mapping.confirm { select = true }
})

config.sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  { name = 'buffer' }
})

config.experimental = {
  ghost_text = true
}

config.window = {
  completion = cmp.config.window.bordered {
    scrollbar = false
  }
}

cmp.setup(config)

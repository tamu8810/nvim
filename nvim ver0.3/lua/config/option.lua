vim.cmd [[ set shortmess+=I ]]

-- encoding
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- clipboard
vim.opt.clipboard:prepend { 'unnamed', 'unnamedplus' }

-- backup
vim.opt.backup = false

-- numberline
vim.opt.number = true
vim.opt.signcolumn = 'yes'

-- statusline
vim.opt.laststatus = 3
vim.opt.showmode = false

-- tab/indent
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.smarttab = true
vim.opt.expandtab = true

-- wrap
vim.opt.wrap = false
vim.opt.sidescroll = 5

-- search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- prefix
vim.keymap.set('n', 's', '<Nop>')       --> Window split.
vim.keymap.set('n', '<Space>', '<Nop>') --> Window move.

vim.keymap.set('n', 'x', '"_x')

vim.keymap.set('n', 'ss', '<Cmd>split<CR>')
vim.keymap.set('n', 'sv', '<Cmd>vsplit<CR>')
vim.keymap.set('n', 'sd', '<Cmd>close<CR>')

vim.keymap.set('n', '<Space>', '<C-w>w')
vim.keymap.set('n', 'sh', '<C-w>h')
vim.keymap.set('n', 'sj', '<C-w>j')
vim.keymap.set('n', 'sk', '<C-w>k')
vim.keymap.set('n', 'sl', '<C-w>l')

vim.keymap.set('n', '*', '*N')

-- test
vim.keymap.set('n', '<C-e>', '<Cmd>Explore<CR>')

local status, telescope = pcall(require, 'telescope')
if (not status) then return end

local builtin = require('telescope.builtin')

telescope.setup({
	defaults = {
		layout_strategy = 'cursor'
	}
})

vim.keymap.set('n', '<C-p>', '<Cmd>lua require("telescope.builtin").fd(require("telescope.themes").get_ivy())<CR>')

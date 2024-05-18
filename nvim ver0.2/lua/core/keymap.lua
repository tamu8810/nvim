local keymap = vim.api.nvim_set_keymap
local option = { silent = true, noremap = true }

-- @brief : Escape key
keymap("t", "<esc>", "<c-\\><c-n>", option)
keymap("t", "<c-;>", "<c-\\><c-n>", option)
keymap("n", "<c-;>", "<esc>", option)
keymap("i", "<c-;>", "<esc>", option)
keymap("v", "<c-;>", "<esc>", option)
keymap("c", "<c-;>", "<esc>", option)
keymap("s", "<c-;>", "<esc>", option)

-- @brief : Buffer move key
keymap("n", "<tab>", "<cmd> bn <cr>", option)
keymap("n", "<s-tab>", "<cmd> bp <cr>", option)

-- @brief : Window move key
keymap("n", ";w", "<c-w>", option)
keymap("n", "<c-w>", "<cmd> lua require('smart-splits').start_resize_mode() <cr>", option)

-- @brief : Telescope key
keymap("n", "<c-p>", "<cmd> Telescope fd <cr>", option)

-- @brief : Nvimtree key
keymap("n", "<c-e>", "<cmd> lua require('nvim-tree.api').tree.toggle({focus = false}) <cr>", option)

-- @brief : Toggleterm key
keymap("n", "<c-t>", "<cmd> ToggleTerm <cr>", option)

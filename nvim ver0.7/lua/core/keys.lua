-- escape
vim.keymap.set("n", "<c-[>", "<esc>")
vim.keymap.set("i", "<c-[>", "<esc>")
vim.keymap.set("v", "<c-[>", "<esc>")
vim.keymap.set("c", "<c-[>", "<esc>")
vim.keymap.set("t", "<c-[>", "<c-\\><c-n>")

-- split window
vim.keymap.set("n", "ss", "<cmd>split<cr>")
vim.keymap.set("n", "sv", "<cmd>vsplit<cr>")
vim.keymap.set("n", "sd", "<cmd>close<cr>")
vim.keymap.set("n", "so", "<cmd>only<cr>")

-- move on window
vim.keymap.set("n", "<space>", "<c-w>w")
vim.keymap.set("n", "sh", "<c-w>h")
vim.keymap.set("n", "sj", "<c-w>j")
vim.keymap.set("n", "sk", "<c-w>k")
vim.keymap.set("n", "sl", "<c-w>l")

-- search
vim.keymap.set("n", "*", "*N")

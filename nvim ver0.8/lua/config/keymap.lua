vim.g.mapleader = ";"
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")
vim.keymap.set("t", "<C-[>", "<C-\\><C-n>")
vim.keymap.set("n", "<S-u>", "<C-r>")
vim.keymap.set("n", "ss", "<Cmd>split<CR>")
vim.keymap.set("n", "sv", "<Cmd>vsplit<CR>")
vim.keymap.set("n", "sc", "<Cmd>close<CR>")
vim.keymap.set("n", "so", "<Cmd>only<CR>")
vim.keymap.set("n", "sh", "<C-w>h")
vim.keymap.set("n", "sj", "<C-w>j")
vim.keymap.set("n", "sk", "<C-w>k")
vim.keymap.set("n", "sl", "<C-w>l")
vim.keymap.set("n", "<Space>", "<C-w>w")
vim.keymap.set("n", "*", "*N")

local status, bufferline = pcall(require, "bufferline")

if status then
    vim.keymap.set("n", "<TAB>", "<Cmd>BufferLineCycleNext<CR>")
    vim.keymap.set("n", "<S-TAB>", "<Cmd>BufferLineCyclePrev<CR>")
    vim.keymap.set("n", "<Leader>bp", "<Cmd>BufferLineTogglePin<CR>")
end

local status, nvim_tree = pcall(require, "nvim-tree")

if status then
    vim.keymap.set("n", "<C-e>", "<Cmd>lua require('nvim-tree.api').tree.toggle({ focus = false })<CR>")
end

local status, telescope = pcall(require, "telescope")

if status then
    vim.keymap.set("n", "<C-p>", "<Cmd>lua require('telescope.builtin').find_files()<CR>")
end

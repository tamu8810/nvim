local global = vim.api.nvim_set_option
local window = vim.api.nvim_win_set_option
local buffer = vim.api.nvim_buf_set_option
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

---------------------
-- Global Settings --
---------------------

-- @brief : Setting of encoding
global("encoding", "utf-8")
global("fileencoding", "utf-8")

-- @brief : Setting of clipboard
global("clipboard", "unnamedplus")

-- @brief : Setting of display color
global("background", "dark")
global("termguicolors", true)

-- @brief : Setting of search style
global("smartcase", true)
global("ignorecase", true)

-- @brief : Setting of statusline
global("laststatus", 3)
global("showmode", false)

---------------------
-- Window Settings --
---------------------

-- @brief : Setting of numberline
window(0, "number", true)
window(0, "signcolumn", "yes")

-- @brief : Setting of cursorline
window(0, "cursorline", true)

-- @brief : Setting of wrap
window(0, "wrap", false)
window(0, "sidescroll", 5)

---------------------
-- Buffer Settings --
---------------------

-- @brief : Setting of tab
autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = "*",
  group = augroup("buffer_set_options", {}),
  callback = function()
    buffer(0, "tabstop", 2)
    buffer(0, "shiftwidth", 0)
    buffer(0, "expandtab", true)
  end
})

-----------------
-- Vim Command --
-----------------

-- @brief : Change highlight color
vim.cmd("highlight Cursorline guibg=NONE ctermbg=NONE")

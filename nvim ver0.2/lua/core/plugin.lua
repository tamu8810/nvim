-- @brief : Lazy install path
local lazybase = "C:/Users/tamu/.local/share/neovim/lazy"
local lazypath = lazybase .. "/lazy.nvim"

-- @brief : Install Lazy if it is not installed
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath
  })
end

-- @brief : Add Lazy's path to Neovim
vim.opt.rtp:prepend(lazypath)

-- @brief : Lazy setup
require("lazy").setup({ { import = "plugin" } }, {

  -- @brief : Install directory setting
	root = lazybase,

  -- @brief : Install setting
	install = {
    missing = false,
		colorscheme = { "catppuccin-Mocha" }
	},

  -- @brief : Checker setting
  checker = {
    enabled = true,
    notify = false
  },

  -- @brief : detection setting
  change_detection = {
    notify = false
  },

  -- @brief : Ui setting
  ui = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    title = "  Lazy.nvim  ",
    title_pos = "center"
  },

  -- @brief : Readme file setting
  readme = {
    enabled = false,
    skip_if_doc_exists = false
  }
})

require("tamu8810.utils").prepend_lazy()

require("lazy").setup({ { import = "tamu8810/plugins" } }, {
  defaults = { lazy = true },
  install = { colorscheme = { "onedark" } },
  rtp = {
    disabled_plugins = { "tohtml", "gzip", "zipPlugin", "netrwPlugin", "tarPlugin" },
  },
  lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json",
})

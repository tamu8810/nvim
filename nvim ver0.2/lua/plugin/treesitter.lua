local function custom()
  require("nvim-treesitter.configs").setup({
    highlight = {
      enable = true,
      disable = {},
    }
  })
end

return {
  "nvim-treesitter/nvim-treesitter",
  lazy = true,
  event = "VeryLazy",
  config = custom
}

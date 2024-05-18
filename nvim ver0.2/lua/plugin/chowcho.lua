local function custom()
  require("chowcho").setup({
    text_color = "#8caaee",
    border_style = "rounded",
    active_border_color = "#ef9f76"
  })
end

return {
  "tkmpypy/chowcho.nvim",
  lazy = true,
  event = "VeryLazy",
  config = custom
}

local function custom()
  local bufferline = require("bufferline")

  bufferline.setup({
    options = {
      mode = "buffers",
      tab_size = 15,
      close_command = "bd %d",
      right_mouse_command = "bd %d",
      left_mouse_command = "buffer %d",
      diagnostics = "nvim_lsp",
      indicator = {
        style = "none"
      },
      style_preset = {
        bufferline.style_preset.no_italic,
        bufferline.style_preset.no_bold
      },
      separator_style = { "|", "|" }
    },
  })
end

return {
  "akinsho/bufferline.nvim",
  lazy = true,
  event = "VimEnter",
  config = custom
}

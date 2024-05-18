local function custom()
  require("smart-splits").setup({
    ignored_buftypes = { 'NvimTree' },
    default_amount = 1
  })
end

return {
  "mrjones2014/smart-splits.nvim",
  lazy = true,
  event = "VeryLazy",
  config = custom
}

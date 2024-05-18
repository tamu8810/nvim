local function config()
    require("Comment").setup()
end

return {
    "numToStr/Comment.nvim",
    lazy = true,
    event = "BufEnter",
    config = config
}

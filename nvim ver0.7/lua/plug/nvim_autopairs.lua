local function config()
    require("nvim-autopairs").setup()
end

return {
    "windwp/nvim-autopairs",
    lazy = true,
    event = "InsertEnter",
    config = config
}

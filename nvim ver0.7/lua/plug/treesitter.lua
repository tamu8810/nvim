local function config()
    local config = {}

    -- highlight setting
    config.highlight = {
        enable = true
    }

    require("nvim-treesitter.configs").setup(config)
end

return {
    "nvim-treesitter/nvim-treesitter",
    lazy = true,
    event = "BufEnter",
    config = config
}

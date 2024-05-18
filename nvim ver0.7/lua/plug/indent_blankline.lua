local function config()
    local config = {}

    config.indent = {
        char = "▏"
    }

    config.scope = {
        enabled = false
    }

    require("ibl").setup(config)
end

return {
    "lukas-reineke/indent-blankline.nvim",
    lazy = true,
    event = "BufEnter",
    config = config
}

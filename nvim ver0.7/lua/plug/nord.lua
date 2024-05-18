local function config()
    -- font style
    vim.g.nord_bold = false
    vim.g.nord_italic = false

    -- contrast
    vim.g.nord_contrast = true

    -- load the colorscheme
    require("nord").set()
end

return {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
    config = config
}

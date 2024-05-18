local function config()
    local config = {}

    config.direction = "float"

    require("toggleterm").setup(config)

    vim.keymap.set("n", "<c-t>", "<cmd>ToggleTerm<cr>")
    vim.keymap.set("t", "<c-t>", "<cmd>ToggleTerm<cr>")
end

return {
    "akinsho/toggleterm.nvim",
    config = config
}

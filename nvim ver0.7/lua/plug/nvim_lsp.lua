local function config()
    require("mason").setup()
    require("mason-lspconfig").setup_handlers({
        function(server)
            local opt = {
                capabilities = require("cmp_nvim_lsp").default_capabilities(
                    vim.lsp.protocol.make_client_capabilities()
                )
            }
            require("lspconfig")[server].setup(opt)
        end
    })
end

return {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = "VeryLazy",
    config = config,
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim"
    }
}

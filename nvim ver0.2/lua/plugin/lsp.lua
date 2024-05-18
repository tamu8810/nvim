local function custom()
  require("mason").setup({})
  require("mason-lspconfig").setup_handlers({
    function(server)
      local opt = {
        capabilities = require("cmp_nvim_lsp").default_capabilities(
          vim.lsp.protocol.make_client_capabilities()
        )
      }
      require("lspconfig")[server].setup({opt})
    end
  })
end

return {
  "neovim/nvim-lspconfig",
  lazy = true,
  event = "VeryLazy",
  config = custom,

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim"
  }
}

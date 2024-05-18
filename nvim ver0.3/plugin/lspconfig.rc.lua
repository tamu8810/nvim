local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end
local status2, mason = pcall(require, 'mason')
if (not status) then return end
local status3, lspconfig = pcall(require, 'mason-lspconfig')
if (not status) then return end

local capabilities = require('cmp_nvim_lsp').default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

mason.setup()
lspconfig.setup_handlers({ function(server)
  local option = {
    capabilities = capabilities
  }
  nvim_lsp[server].setup(option)
end })

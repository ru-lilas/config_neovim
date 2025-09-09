return{
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local capabilities = cmp_nvim_lsp.default_capabilities()
      lspconfig.pyright.setup{
    capabilities = capabilities,
    }
      lspconfig.clangd.setup{
    capabilities = capabilities,
    }
    end,
}

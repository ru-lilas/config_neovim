return {
  {
    -- mason.nvim
    "mason-org/mason.nvim",
    opts = {}
  },
  {
    -- mason-lspconfig.nvim
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "bashls",
        "pyright",
        "clangd"
      },
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
  },
}

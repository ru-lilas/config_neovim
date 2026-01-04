return {
  "neovim/nvim-lspconfig",
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local util = require("lspconfig.util")

    vim.lsp.config("pyright", {
      capabilities = capabilities,
    })

    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
        },
      },
    })

    vim.lsp.config("clangd", {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
        },
      },
    })

    vim.lsp.config("texlab", {
      -- ここが重要：子ファイルから開いても thesis.tex を探してそこをルートにする
      -- root_dir = util.root_pattern(".texlabroot", ".latexmkrc", "thesis.tex", ".git"),
      settings = {
        texlab = {
          -- 依存関係の解析を深めるための設定
          build = {
            onSave = false,
          },
          -- 補完のためのインデックス作成設定
          chktex = { onOpenAndSave = true },
          -- 依存関係が複雑な場合に有効
          diagnostics = {
            -- これが重要：undefined reference のチェックを有効にしているか
            checkSectionLabels = true,
            -- 再解析を頻繁に行わせる
            delay = 300,
          },
          -- （もし out/ ディレクトリなどに出している場合はそこを指定）
          auxDirectory = ".",
          -- .bibファイルが存在するディレクトリ
          bibDirectory = { "references" },
        },
        Lua = {
          diagnostics = { globals = { "vim" } },
        },
      },
    })
  end,
}


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
          runtime = {
            version = "Lua JIT",
          },
          workspace = {
            checkThirdParty = false,
            library = vim.api.nvim_get_runtime_file("", true),
          },
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
      -- root_dir = util.root_pattern(".texlabroot", ".latexmkrc", "thesis.tex", ".git"),
      settings = {
        texlab = {
          -- 依存関係の解析を深めるための設定
          build = {
            onSave = false,
          },
          -- 補完のためのインデックス作成設定
          -- 警告がたくさん出るので無効にする(20260428)
          chktex = {
            onOpenAndSave = true,
            onEdit = true,
            additionalArgs = {
              "-n8",
              "-n2",
              "-n9",
              "-n24",
              "-n26",
              "-n11",
              "-n38",
              "-n35",
              "-n3",
              "-n1",
              "-n36",
              "-n39",
            },
          },
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


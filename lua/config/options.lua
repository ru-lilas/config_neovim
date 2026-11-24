local o = vim.opt

-- 行番号の表示
o.number = true
o.relativenumber = true
o.scrolloff = 3

-- タブとインデントの設定
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.softtabstop = -1

o.termguicolors = true

o.helplang = "ja"

-- 
o.ignorecase = true
o.wrap = false
o.whichwrap = 'b,s,h,l,<,>,[,],~'

-- use system clipboard
o.clipboard = "unnamedplus"
-- hover window
vim.lsp.handlers["textDocument/definition"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {
    border = "rounded", -- "single", "double", "shadow", または {"╔","═","╗","║","╝","═","╚","║"} のように配列指定も可能
  }
)

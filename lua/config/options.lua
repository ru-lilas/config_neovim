local opt = vim.opt

-- 開くターミナルとしてbashを選択
vim.o.shell ="/bin/bash"

-- 行番号の表示
opt.number = true
opt.relativenumber = false
opt.scrolloff = 3

-- タブとインデントの設定
opt.tabstop = 4
opt.shiftwidth = 2
opt.expandtab = true

opt.termguicolors = true

-- 
opt.ignorecase = true
opt.wrap = false
opt.whichwrap = 'b,s,h,l,<,>,[,],~'

-- use system clipboard

vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = require("vim.ui.clipboard.osc52").paste("+"),
    ['*'] = require("vim.ui.clipboard.osc52").paste("*"),
  },
}

-- hover window
vim.lsp.handlers["textDocument/definition"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {
    border = "rounded", -- "single", "double", "shadow", または {"╔","═","╗","║","╝","═","╚","║"} のように配列指定も可能
  }
)

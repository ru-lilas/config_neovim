local keymap = vim.keymap
keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", { noremap = true, silent = true })

-- 現在のバッファを閉じて次のバッファへ移動
keymap.set('n', '<leader>bd', ':bnext<bar>bd #<CR>', { noremap = true, silent = true, desc = 'Close and move to next buffer' })

-- 現在のバッファを閉じて前のバッファへ移動
keymap.set('n', '<leader>bp', ':bprevious<bar>bd #<CR>', { noremap = true, silent = true, desc = 'Close and move to previous buffer' })

-- カーソル上にある変数の名前を書き換える
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })

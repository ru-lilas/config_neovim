local keymap = vim.keymap
keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", { noremap = true, silent = true })

-------------------------------------
-- Barbar
-- See `:help barbar.txt`
-------------------------------------
vim.keymap.set('n', '<leader>d', '<Cmd>BufferClose<CR>', { desc = "Close current buffer in barbar" })
vim.keymap.set('n', 'gL', '<Cmd>BufferCloseAllButCurrent<CR>', { desc = "Close all but current buffer in barbar" })
vim.keymap.set('n', 'gp', '<Cmd>BufferPrevious<CR>', { desc = "Go to previous buffer in barbar" })
vim.keymap.set('n', 'gn', '<Cmd>BufferNext<CR>', { desc = "Go to next buffer in barbar" })

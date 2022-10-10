-------------------------------------
-- Barbar
-- See `:help barbar.txt`
-------------------------------------
-- Set barbar's options
require'bufferline'.setup {
  -- Enable/disable animations
  animation = true,

  -- Enable/disable auto-hiding the tab bar when there is a single buffer
  auto_hide = false,

  -- Enable/disable current/total tabpages indicator (top right corner)
  tabpages = true,

  -- Enable/disable close button
  closable = true,

  -- Enables/disable clickable tabs
  --  - left-click: go to buffer
  --  - middle-click: delete buffer
  clickable = true,

  -- Excludes buffers from the tabline
  exclude_ft = {'qf'},
  -- exclude_name = ['package.json'],

  -- Enable/disable icons
  -- if set to 'numbers', will show buffer index in the tabline
  -- if set to 'both', will show buffer index and icons in the tabline
  icons = 'both',

  -- If set, the icon color will follow its corresponding buffer
  -- highlight group. By default, the Buffer*Icon group is linked to the
  -- Buffer* group (see Highlighting below). Otherwise, it will take its
  -- default value as defined by devicons.
  icon_custom_colors = false,

  -- Configure icons on the bufferline.
  icon_separator_active = '▎',
  icon_separator_inactive = '▎',
  icon_close_tab = '',
  icon_close_tab_modified = '●',
  icon_pinned = '車',

  -- If true, new buffers will be inserted at the end of the list.
  -- Default is to insert after current buffer.
  insert_at_end = false,

  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 2,

  -- Sets the maximum buffer name length.
  maximum_length = 30,

  -- If set, the letters for each buffer in buffer-pick mode will be
  -- assigned based on their name. Otherwise or in case all letters are
  -- already assigned, the behavior is to assign letters in order of
  -- usability (see order below)
  semantic_letters = true,

  -- New buffer letters are assigned in this order. This order is
  -- optimal for the qwerty keyboard layout but might need adjustement
  -- for other layouts.
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

  -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
  -- where X is the buffer number. But only a static string is accepted here.
  no_name_title = nil,
}

vim.keymap.set('n', '<leader>d', '<Cmd>BufferClose<CR>', { desc = "Close current buffer in barbar" })
vim.keymap.set('n', 'gL', '<Cmd>BufferCloseAllButCurrent<CR>', { desc = "Close all but current buffer in barbar" })
vim.keymap.set('n', 'gp', '<Cmd>BufferPrevious<CR>', { desc = "Go to previous buffer in barbar" })
vim.keymap.set('n', 'gn', '<Cmd>BufferNext<CR>', { desc = "Go to next buffer in barbar" })

-- Move between barbar buffers
vim.keymap.set("n", "g1", ":BufferGoto 1<CR>", { desc = "Go to 1st buffer in barbar" })
vim.keymap.set("n", "g2", ":BufferGoto 2<CR>", { desc = "Go to 2nd buffer in barbar" })
vim.keymap.set("n", "g3", ":BufferGoto 3<CR>", { desc = "Go to 3rd buffer in barbar" })
vim.keymap.set("n", "g4", ":BufferGoto 4<CR>", { desc = "Go to 4th buffer in barbar" })
vim.keymap.set("n", "g5", ":BufferGoto 5<CR>", { desc = "Go to 5th buffer in barbar" })
vim.keymap.set("n", "g6", ":BufferGoto 6<CR>", { desc = "Go to 6th buffer in barbar" })
vim.keymap.set("n", "g7", ":BufferGoto 7<CR>", { desc = "Go to 7th buffer in barbar" })
vim.keymap.set("n", "g8", ":BufferGoto 8<CR>", { desc = "Go to 8th buffer in barbar" })
vim.keymap.set("n", "g9", ":BufferGoto 9<CR>", { desc = "Go to 9th buffer in barbar" })

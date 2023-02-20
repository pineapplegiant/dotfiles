-- Maps.lua
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
local keymap = vim.keymap


-- Leader Combinations
vim.g.mapleader = " "
vim.g.localmapleader = "\\"

-- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- Remap for dealing with word wrap
keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap.set('n', '<leader>s', ':update<CR>', { desc = 'QuickSave with space key' })
keymap.set('n', '<C-S>', ':update<CR>', { desc = 'QuickSave with control key' })
keymap.set('n', '<leader>q', ':q!<CR>', { desc = 'An attempt at quitting vim' })
keymap.set('n', ',<leader>', ':nohlsearch<CR>', { desc = 'Turn off highlighted search' })
keymap.set('n', '<leader>d', ':bdelete!<CR>', { desc = 'Close the current buffer' })
-- keymap.set('n', '<leader>j', 'J', { desc = 'Use leader J as default J' })

-- Copying & Pasting
keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Copy into system clipboard' })
keymap.set({ 'n', 'v' }, '<leader>p', '"+p', { desc = 'Paste from system clipboard' })


-- Cycle brackets
keymap.set({ 'n', 'v', }, ',,', '%', { desc = 'Cycle through brackets with comma', remap = true })

keymap.set('n', '<leader>?', ':!open dict://<cword><cr><cr>',
	{ desc = 'Open word under Cursor in dictionary app', silent = true })
keymap.set('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>', { desc = 'Move current directory' })

-- Quick Tricks
keymap.set('n', '<F10>', ':source $MYVIMRC<CR>', { desc = 'Source VIMRC' })
-- keymap.set('n', '<F6>', '<C-R>=lua print(os.date("%A %B %d, %Y"))<CR>', { desc = "Quick Timestamp" })
keymap.set('n', '<F6>', ':r !date', { desc = "Quick Timestamp" })
keymap.set('n', ',gcc', ':!tmux send-keys -t1 "\\!! " ENTER <CR><CR>', { desc = 'Run last command in tmux window' })

-- U to redo
keymap.set('n', 'U', '<C-R>', { desc = 'Redo last change' })

-- Increment/decrement
keymap.set('n', '+', '<C-a>', { desc = 'Increment number under cursor' })
keymap.set('n', '-', '<C-x>', { desc = 'Decrement number under cursor' })

-- Front and end of line movement
keymap.set({ 'n', 'v', }, 'B', '^', { desc = 'Move to the Beginning of the line' })
keymap.set({ 'n', 'v', }, 'E', '$', { desc = 'Move to the End of the line' })
keymap.set({ 'n', 'v', }, 'Y', 'y$', { desc = 'Yank to the end of the line' })


-- Align blocks easier
keymap.set('v', '<C-J>', ":m '>+1<CR>gv=gv", { desc = 'Indent blocks visually, better' })
keymap.set('v', '<C-K>', ":m '<-2<CR>gv=gv", { desc = 'De-indent blocks visually, better' })
keymap.set('v', '<', '<gv', { desc = 'De-Indent lines of code with visual selection' })
keymap.set('v', '>', '>gv', { desc = 'Indent lines of code with visual selection' })

-- Buffers
keymap.set('n', 'gb', ':ls<CR>:b<Space>', { desc = 'List buffers, and jump to them ' })
keymap.set('n', 'gs', ':browse oldfiles<CR>', { desc = 'Browse old opened files' })
keymap.set('n', 'gn', ':bn<CR>', { desc = 'Cycle next buffer' })
keymap.set('n', 'gp', ':bp<CR>', { desc = 'Cycle previous buffer' })

-- Terminal
keymap.set('t', 'hh', '<C-\\><C-n>', { desc = 'Exit normal mode when using terminal inside nvim' })

-- Old Snippets
keymap.set('n', ',mock', ':-1read $XDG_CONFIG_HOME/nvim/snippets/mock.txt<CR>A', { desc = 'Mock snippet' })
keymap.set('n', ',html', ':-1read $XDG_CONFIG_HOME/nvim/snippets/skeleton.html<CR>7jf>a', { desc = 'Base HTML' })
keymap.set('n', ',css', ':-1read $XDG_CONFIG_HOME/nvim/snippets/cssComment.css<CR>jA', { desc = 'CSS Block Comment' })
keymap.set('n', ',csss', ':-1read $XDG_CONFIG_HOME/nvim/snippets/reset.css<CR>', { desc = 'Reset CSS' })
keymap.set('n', ',block', ':read $XDG_CONFIG_HOME/nvim/snippets/block.txt<CR>jA', { desc = 'Block Snippet' })
keymap.set('n', ',yaml', ':-1read $XDG_CONFIG_HOME/nvim/snippets/yaml.md<CR>', { desc = 'YAML snippet' })
keymap.set('n', ',mlk', ':read $XDG_CONFIG_HOME/nvim/snippets/mlk.txt<CR>', { desc = 'MLK Speech Snippet' })
keymap.set('n', ',snap', ':read $XDG_CONFIG_HOME/nvim/snippets/snap.md<CR>', { desc = 'Snap keymap' })

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

-- Close quickfix menu after selecting choice
vim.api.nvim_create_autocmd( "FileType", {
		pattern = {"qf"},
		command = [[nnoremap <silent><buffer> <CR> <CR>:cclose<CR>]]})

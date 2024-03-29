-- Maps.lua
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
local keymap = vim.keymap

vim.g.mapleader = " "
vim.g.localmapleader = "\\"

-- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- Remap for dealing with word wrap
keymap.set("n", "k", "v:count ? 'k' : 'gk'", { expr = true, silent = true })
keymap.set("n", "j", "v:count ? 'j' : 'gj'", { expr = true, silent = true })

-- keymap.set('n', '<leader>s', ':update<CR>', { desc = 'QuickSave with space key' })
keymap.set("n", "<C-S>", ":update<CR>", { desc = "QuickSave with control key" })
keymap.set("n", "<leader>q", ":q!<CR>", { desc = "An attempt at quitting vim" })
keymap.set("n", ",<leader>", "<cmd>:nohlsearch<CR>", { desc = "Turn off highlighted search" })
keymap.set("n", "<leader>d", ":bdelete!<CR>", { desc = "Close the current buffer" })
-- keymap.set('n', '<leader>j', 'J', { desc = 'Use leader J as default J' })

-- Copying & Pasting
keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy from Vim into system clipboard" })
keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard into Vim" })

-- Cycle brackets
keymap.set({ "n", "v" }, ",,", "%", { desc = "Cycle through brackets with comma", remap = true })

keymap.set(
	"n",
	"<leader>?",
	":!open dict://<cword><cr><cr>",
	{ desc = "Open word under Cursor in dictionary app", silent = true }
)
keymap.set("n", "<leader>cd", ":cd %:p:h<CR>:pwd<CR>", { desc = "Move current directory" })

-- Quick Tricks
-- keymap.set("n", "<F10>", ":source $MYVIMRC<CR>", { desc = "Source VIMRC" })

-- keymap.set('n', '<F6>', '<C-R>=lua print(os.date("%A %B %d, %Y"))<CR>', { desc = "Quick Timestamp" })
keymap.set({"n", "i"}, "<F6>", "<C-R>=strftime('%Y-%m-%dT%H:%M:%S%z')<CR>", { desc = "Golang time convention" })
keymap.set({"n", "i"}, "<F7>", "<ESC>:r !date<CR>", { desc = "Quick Timestamp" })

keymap.set("n", ",gcc", ':!tmux send-keys -t1 "\\!! " ENTER <CR><CR>', { desc = "Run last command in tmux window" })

-- U to redo instead of C-R
keymap.set("n", "U", "<C-R>", { desc = "Redo last change" })

-- Increment/decrement
-- keymap.set("n", "+", "<C-a>", { desc = "Increment number under cursor" })
-- keymap.set("n", "-", "<C-x>", { desc = "Decrement number under cursor" })

-- Front and end of line movement
keymap.set({ "n", "v" }, "B", "g^", { desc = "Move to the Beginning of the line" })
keymap.set({ "n", "v" }, "E", "g$", { desc = "Move to the End of the line" })
keymap.set({ "n", "v" }, "Y", "y$", { desc = "Yank to the end of the line" })

-- Align blocks easier
keymap.set("v", "<C-J>", ":m '>+1<CR>gv=gv", { desc = "Indent blocks visually, better" })
keymap.set("v", "<C-K>", ":m '<-2<CR>gv=gv", { desc = "De-indent blocks visually, better" })
keymap.set("v", "<", "<gv", { desc = "De-Indent lines of code with visual selection" })
keymap.set("v", ">", ">gv", { desc = "Indent lines of code with visual selection" })

-- Buffers
keymap.set("n", "gb", ":ls<CR>:b<Space>", { desc = "List buffers, and jump to them " })
keymap.set("n", "gs", ":browse oldfiles<CR>", { desc = "Browse old opened files" })
keymap.set("n", "gn", ":bn<CR>", { desc = "Cycle next buffer" })
keymap.set("n", "gp", ":bp<CR>", { desc = "Cycle previous buffer" })

-- Terminal
keymap.set("t", "hh", "<C-\\><C-n>", { desc = "Exit normal mode when using terminal inside nvim" })

-- Old Snippets
-- keymap.set("n", ",html", ":-1read $XDG_CONFIG_HOME/nvim/snippets/skeleton.html<CR>7jf>a", { desc = "Base HTML" })
-- keymap.set("n", ",css", ":-1read $XDG_CONFIG_HOME/nvim/snippets/cssComment.css<CR>jA", { desc = "CSS Block Comment" })
keymap.set("n", ",css", ":-1read $XDG_CONFIG_HOME/nvim/snippets/reset.css<CR>", { desc = "Reset CSS" })
keymap.set("n", ",block", ":read $XDG_CONFIG_HOME/nvim/snippets/block.txt<CR>jA", { desc = "Block Snippet" })
-- keymap.set("n", ",yaml", ":-1read $XDG_CONFIG_HOME/nvim/snippets/yaml.md<CR>", { desc = "YAML snippet" })
keymap.set("n", ",mlk", ":read $XDG_CONFIG_HOME/nvim/snippets/mlk.txt<CR>", { desc = "MLK Speech Snippet" })

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

-- Close quickfix menu after selecting choice
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "qf" },
	command = [[nnoremap <silent><buffer> <CR> <CR>:cclose<CR>]],
})

keymap.set("n", "gx", [[:silent execute '!open ' . shellescape(expand('<cfile>'), 1)<CR>]], opts)

-- Macros
keymap.set("n", "Q", "@qj", { desc = "Run q Macro on current line" })
keymap.set("x", "Q", "norm @q<CR>", { desc = "Run q Macro on selection" })

-- Base.lua
-- For more info on general settings run `:h vim.opt`
--    example logging: `print(vim.inspect(vim.opt.wildignore:get()))`]]

-- viml/lua scope reference:
--    general settings: `vim.o` -- Things you'd normally set with `set`
--    window:           `viw.wo`
--    buffer:           `vim.bo`
--    global:           `vim.g` -- Things you would set with `let`

-- shortcut
local set = vim.opt

-- Disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Sensible Settings
set.number = true -- Show line numbers
vim.wo.number = true -- Show line numbers
set.backspace = { "start", "eol", "indent" } -- Allow backspace in insert mode
set.termguicolors = true -- set termguicolors to enable highlight groups
set.cursorline = true -- Show cursorline
set.background = "dark" -- Tell nvim we're using a dark theme
set.lazyredraw = false -- Makes vim redraw while performing macros

-- Don't show the mode, since it's already in the status line
set.showmode = false

-- views can only be fully collapsed with the global statusline
set.laststatus = 3

-- Casing
set.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
set.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
set.wildignorecase = true -- Ignore casing when completing file names and directories

set.spelllang = "en_us" -- US engwish
set.signcolumn = "yes" -- show sign column so that text doesn't shift
set.mouse = "a" -- Enabling Mouse support

set.tabstop = 2 -- Tabs become '' spaces
set.shiftwidth = 2 -- Indentation width
set.softtabstop = 2 -- Tab becomes 4 spaces in Vim operations
set.autoindent = true -- Keep Indent generally when using <CR> or hitting o
set.smartindent = true -- Editor will be smart about indenting or not
set.cindent = true
set.expandtab = true -- Setting expandtabs means no \t ever again
set.numberwidth = 3 -- Padding of space in the side number column

set.backupskip = { "/tmp/*", "/private/tmp/*" }
set.inccommand = "split" -- shows effects of command incrementally
set.hlsearch = true -- Mantain highlights on previous search
set.incsearch = true -- Show incremental searching

set.scrolloff = 3 -- Distance cursor stays from the bottom of the screen
set.wrap = false -- Don't wrap lines when they are too long

-- Enable break indent
set.breakindent = true -- Make wrapped text better?
set.title = true -- Show all the info on the title

-- Wildmenu
set.wildmode = "longest,list,full" -- First tab complete to longest string second tab will complete to first full match and open the wildmenu
set.wildmenu = true -- Set autocomplete for the command menu

-- Split windows
set.splitbelow = true -- Horizontal split default opens at bottom
set.splitright = true -- Vertical splitting a window default open to the right
set.swapfile = false -- Idk what swapfiles are, so no i dont want it sir

-- vim.opt.listchars = { space = '·' }
set.list = true

-- Show trailing spaces, but keep tabs as blank spaces
set.listchars:append("space: ")
set.listchars:append("trail:⋅")
set.listchars:append("tab:   ")


set.updatetime = 250 -- Decrease update time
set.timeoutlen = 300 -- Decrease mapped sequence wait time
set.completeopt = "menuone,noselect" -- Set completeopt to have a better completion experience

--set.wilcharm = "<C-z>"       -- Keypress to start expansion when in a Macro
-- set.colorcolumn=99999       -- Fix indentblankline
-- set.backup = false             -- don't create backup files

-- Ignore these filetypes when trying to navigate files
set.wildignore = {
	"*.swp",
	"*.bak",
	"*.pyc",
	"*.class",
	"*.sln",
	"*.Master",
	"*.csproj",
	"*.csproj",
	".user",
	"*.cache",
	"*.dll",
	"*.pdb",
	"*.min.*",
	"*/.git/**/*,*/.hg/**/*,*/.svn/**/*",
	"tags",
	"*.tar.*",
	"*/node_modules/*",
}

-- Explicitly set utf-8 encoding bc why not?
vim.scriptencoding = "utf-8"
set.encoding = "utf-8"
set.fileencoding = "utf-8"

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Turn off The Cursor line in insert and when navigating away from window
local cursor_line_on_augroup = vim.api.nvim_create_augroup("cursor_line_on", { clear = true })
local cursor_line_off_augroup = vim.api.nvim_create_augroup("cursor_line_off", { clear = true })

-- -- Set Cursor Line On when leaving Insert mode
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
	group = cursor_line_on_augroup,
	desc = "Turn on cursor line",
	callback = function()
		vim.opt.cursorline = true
	end,
})

-- -- Cursor Line off when Exting Insert Mode
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
	group = cursor_line_off_augroup,
	desc = "Turn off cursor line",
	callback = function()
		vim.opt.cursorline = false
	end,
})

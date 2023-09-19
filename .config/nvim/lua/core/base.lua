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

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Sensible Settings
vim.wo.number = true -- Show line numbers
set.backspace = { "start", "eol", "indent" } -- Allow backspace in insert mode
set.lazyredraw = false -- Makes vim redraw while performing macros
set.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
set.spelllang = "en_us" -- US engwish
set.mouse = "a" -- Enabling Mouse support
set.autoindent = true -- Keep Indent generally when using <CR> or hitting o
set.smartindent = true -- Editor will be smart about indenting or not
set.expandtab = true -- Setting expandtabs means no \t ever again
set.tabstop = 2 -- Tab becomes 4 spaces
set.softtabstop = 2 -- Tab becomes 4 spaces in Vim operations
set.shiftwidth = 2 -- How many columns of whitespace a "level of indentation" \t is worth


set.numberwidth = 3 -- Padding of space in the side number column
set.backupskip = { "/tmp/*", "/private/tmp/*" }
set.inccommand = "split" -- shows effects of command incrementally
set.hlsearch = true -- Mantain highlights on previous search
set.incsearch = true -- Show incremental searching
set.scrolloff = 3 -- Distance cursor stays from the bottom of the screen
set.wrap = false -- Don't wrap lines when they are too long
set.breakindent = true -- Make wrapped text better?
set.title = true -- Show all the info on the title
set.wildmode = "longest,list,full" -- First tab complete to longest string second tab will complete to first full match and open the wildmenu
set.wildmenu = true -- Set autocomplete for the command menu
set.splitbelow = true -- Horizontal split default opens at bottom
set.splitright = true -- Vertical splitting a window default open to the right
set.swapfile = false -- Idk what swapfiles are, so no i dont want it sir

-- vim.opt.listchars = { space = '·' }
set.list = true

-- Show trailing spaces, but keep tabs as blank spaces
set.listchars:append("space: ")
set.listchars:append("trail:⋅")
set.listchars:append("tab:   ")

set.wildignorecase = true -- Ignore casing when completing file names and directories

set.updatetime = 250 -- Decrease update time
vim.wo.signcolumn = "yes"
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

--&t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
--&t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

--autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

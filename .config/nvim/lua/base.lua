-- [[ Base settings
-- For more info on general settings run `:h vim.opt`
--    example logging: `print(vim.inspect(vim.opt.wildignore:get()))`]]

-- [[ viml/lua scope reference:
--    general settings: `vim.o` -- Things you'd set with set
--    window:           `viw.wo`
--    buffer:           `vim.bo`
--    global:           `vim.g` -- Things you would set with let ]]

-- Shortcuts
local set = vim.opt

-- Sensible Settings
vim.wo.number = true           -- Show line numbers
--set.termguicolors = true     -- If term supports ui color then enable
set.cursorline = true          -- Show cursorline
set.backspace = { 'start', 'eol', 'indent' } -- Allow backspace in insert mode
set.lazyredraw = false         -- Makes vim redraw while performing macros
set.ignorecase = true          -- Case insensitive searching UNLESS /C or capital in search
set.spelllang = en_us          -- US engwish
set.mouse = "a"                -- Enabling Mouse support
set.autoindent = true          -- Keep Indent generally when using <CR> or hitting o
set.smartindent = true         -- Editor will be smart about indenting or not
set.expandtab = true           -- Use spaces instead of tabs
set.tabstop = 4                -- Tab becomes 4 spaces
set.softtabstop = 4            -- Tab becomes 4 spaces in Vim operations
set.shiftwidth = 4             -- Number of spaces for indentation
set.numberwidth = 4            -- Padding of space in the side number column
set.backupskip = { '/tmp/*', '/private/tmp/*' }
set.inccommand = 'split'       -- shows effects of command incrementally
set.hlsearch = true            -- Mantain highlights on previous search
set.incsearch = true           -- Show incremental searching
set.scrolloff = 5              -- Distance cursor stays from the bottom of the screen
set.wrap = true                -- Don't wrap lines when they are too long
set.breakindent = true         -- Make wrapped text better?
set.title = true               -- Show all the info on the title
set.wildmode="longest,list,full" -- First tab complete to longest string second tab will complete to first full match and open the wildmenu
set.wildmenu = true            -- Set autocomplete for the command menu
set.splitbelow = true          -- Horizontal split default opens at bottom
set.splitright = true          -- Vertical splitting a window default open to the right
set.swapfile = false           -- Idk what swapfiles are, so no i dont want it sir
set.list = true                -- Show trailing spaces
set.listchars = { space = '·', tab = '▸\\'}
set.wildignorecase = true      -- Ignore casing when completing file names and directories

vim.g.clipboard = {name}
--set.wilcharm = "<C-z>"       -- Keypress to start expansion when in a Macro
-- set.colorcolumn=99999       -- Fix indentblankline
-- set.backup = false             -- don't create backup files

-- Ignore these filetypes when trying to navigate files
set.wildignore = {'*.swp', '*.bak', '*.pyc',
                  '*.class', '*.sln', '*.Master',
                  '*.csproj', '*.csproj', '.user',
                  '*.cache', '*.dll', '*.pdb',
                  '*.min.*', '*/.git/**/*,*/.hg/**/*,*/.svn/**/*',
                  'tags', '*.tar.*', '*/node_modules/*'
}

-- Explicitly set utf-8 encoding bc why not?
vim.scriptencoding = 'utf-8'
set.encoding = 'utf-8'
set.fileencoding = 'utf-8'

-- Undercurl...?
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

--&t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
--&t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

-- Autocommands `:h nvim_create_autocmd()`

-- Turn off The Cursor line in insert and when navigating away from window
local cursor_line_on_augroup = vim.api.nvim_create_augroup('cursor_line_on', {clear = true})
local cursor_line_off_augroup = vim.api.nvim_create_augroup('cursor_line_off', {clear = true})

-- Set Cursor Line On when leaving Insert mode
vim.api.nvim_create_autocmd({'InsertLeave' ,'WinEnter'}, {
  group = cursor_line_on_augroup,
  desc = 'Turn on cursor line',
  callback = function()
    vim.opt.cursorline = true
  end
})

-- Cursor Line off when Exting Insert Mode
vim.api.nvim_create_autocmd({'InsertEnter', 'WinLeave'}, {
  group = cursor_line_off_augroup,
  desc = 'Turn off cursor line',
  callback = function()
    vim.opt.cursorline = false
  end
})


-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

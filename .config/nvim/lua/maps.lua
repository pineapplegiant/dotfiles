-- Mappings
local keymap = vim.keymap


-- Leader Combinations
vim.g.mapleader = " "
vim.g.localmapleader = "\\"

keymap.set('n', '<leader>s', ':update<CR>',      {desc = 'QuickSave'})
keymap.set('n', '<C-S>', ':update<CR>',          {desc = 'QuickSave'})
keymap.set('n', '<leader>q', ':q!<CR>',          {desc = 'An attempt at quitting vim'})
keymap.set('n', ',<leader>', ':nohlsearch<CR>',  {desc = 'Turn off highlighted search'})
keymap.set('n', '<leader>d', ':bdelete!<CR>',    {desc = 'Close the current buffer'})
keymap.set('n', '<leader>j', 'J',                {desc = 'Use leader J as default J'})
keymap.set('', '<leader>p', '"+p',               {desc = 'Paste from system clipboard'})
keymap.set('', '<leader>y', '"+y',               {desc = 'Copy into system clipboard' })
keymap.set('n', '<leader>?', ':!open dict://<cword><cr><cr>', {desc = 'Open word under Cursor in dictionary app', silent = true})
keymap.set('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>',        {desc = 'Move current directory'})


-- Quick Tricks
keymap.set('n', '<F10>', ':source $MYVIMRC<CR>', {desc = 'Source VIMRC'})
keymap.set({'n', 'v', 'i'}, '<F6>', '<C-R>=strftime("%A %B %d, %Y")<CR>', {desc = "Quick Timestamp"})
keymap.set('n', ',gcc', ':!tmux send-keys -t1 "\\!! " ENTER <CR><CR>', {desc = 'Run last command in tmux window'})

-- Remap J and K to move down blocks
keymap.set({'n', 'v'}, 'J', '}', {desc = 'Jump down faster between blocks'})
keymap.set({'n', 'v'}, 'K', '{', {desc = 'Jump up faster between blocks'})

-- U to redo
keymap.set('n', 'U', '<C-R>', {desc = 'Redo last change'})

-- Increment/decrement
keymap.set('n', '+', '<C-a>', {desc = 'Increment number under cursor'})
keymap.set('n', '-', '<C-x>', {desc = 'Decrement number under cursor'})

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G', {desc = 'Select all text in file'})

-- Front and end of line movement
keymap.set({'n', 'v',}, 'B', '0',  {desc = 'Move to the Beginning of the line'})
keymap.set({'n', 'v',}, 'E', '$',  {desc = 'Move to the End of the line'})
keymap.set({'n', 'v',}, 'Y', 'y$', {desc = 'Yank to the end of the line'})

-- Cycle brackets
keymap.set({'n', 'v',}, ',,', '%', {desc = 'Cycle through brackets with comma'})

-- Align blocks easier
keymap.set('v', '<', '<gv',  {desc = 'Indent lines of code with visual selection'})
keymap.set('v', '>,', '>gv', {desc = 'De-Indent lines of code with visual selection'})

-- Buffers
keymap.set('n', 'gb', ':ls<CR>:b<Space>',     {desc = 'List buffers, and jump to them '})
keymap.set('n', 'gs', ':browse oldfiles<CR>', {desc = 'Browse old opened files'})
keymap.set('n', 'gn', ':bn<CR>',              {desc = 'Cycle next buffer'})
keymap.set('n', 'gp', ':bp<CR>',              {desc = 'Cycle previous buffer'})


-- Terminal
keymap.set('t', 'hh', '<C-\\><C-n>', {desc = 'Exit normal mode when using terminal inside nvim'})

-- TODO: Terminal stuff
function terminalCreate ()
    local time_now = os.date('%Y.%m.%d:%H.%M.%S')
    local terminal_name = "terminal_" .. time_now
    return terminal_name
end
keymap.set('n', '<leader>zb', ':new<CR>:resize 10<CR>:call terminalCreate()<CR>', {desc = 'Create a new terminal at bottom of buffer'})
keymap.set('n', '<leader>zz', 'call terminalCreate()<CR>', {desc = 'Create a new terminal in current page'})
keymap.set('n', '<leader>zv', ':vsplit<CR>:call terminalCreate()<CR>', {desc = 'Create a new terminal in a vertical split'})

-- Old Snippets
keymap.set('n', ',mock', ':-1read $XDG_CONFIG_HOME/nvim/snippets/mock.txt<CR>A', {desc = 'Mock snippet'})
keymap.set('n', ',html', ':-1read $XDG_CONFIG_HOME/nvim/snippets/skeleton.html<CR>7jf>a', {desc = 'Base HTML'})
keymap.set('n', ',css', ':-1read $XDG_CONFIG_HOME/nvim/snippets/cssComment.css<CR>jA', {desc = 'CSS Block Comment'})
keymap.set('n', ',csss', ':-1read $XDG_CONFIG_HOME/nvim/snippets/reset.css<CR>', {desc = 'Reset CSS'})
keymap.set('n', ',block', ':read $XDG_CONFIG_HOME/nvim/snippets/block.txt<CR>jA', {desc = 'Block Snippet'})
keymap.set('n', ',yaml', ':-1read $XDG_CONFIG_HOME/nvim/snippets/yaml.md<CR>',   {desc = 'YAML snippet'})
keymap.set('n', ',mlk', ':read $XDG_CONFIG_HOME/nvim/snippets/mlk.txt<CR>',      {desc = 'MLK Speech Snippet'})
keymap.set('n', ',snap', ':read $XDG_CONFIG_HOME/nvim/snippets/snap.md<CR>',     {desc = 'Snap keymap'})

--TODO: Convert to tab
--    " Expose TrimWhitespace Command to remove spaces
--    command! -nargs=? -range=% -complete=custom,s:TrimCompletionOptions
--      \ TrimWhitespace <line1>,<line2>call s:TrimWhitespace(<f-args>)
--
--    function! s:TrimWhitespace(...) abort
--      let confirm = a:0
--      execute a:firstline . ',' . a:lastline . 's/\s\+$//e' . (confirm ? 'c' : '')
--    endfunction
--
--    function! s:TrimCompletionOptions(A,L,P) abort
--      return "-confirm"
--    endfunction
--
--    function! TabFile() abort
--        set expandtab!
--        %retab!
--    endfunction
--
--    map <F9> :call TabFile()<CR>
--
--
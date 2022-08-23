vim.keymap.set('n', '<C-S-f>',
	':SearchBoxMatchAll clear_matches=false show_matches=true <CR>',
	{ desc = 'Search in File' }
)

vim.keymap.set('n', '<C-r>',
	':SearchBoxReplace exact=true <CR>',
	{ desc = 'Search and Replace in File' }
)

vim.keymap.set('n', ',<leader>', ':SearchBoxClear<CR>',
	{ desc = 'Clear SearchBox Highlights' })

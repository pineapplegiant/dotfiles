vim.api.nvim_set_keymap('n', '<C-f>',
	':SearchBoxMatchAll clear_matches=false <CR>',
	{ desc = 'Search in File' }
)

vim.api.nvim_set_keymap('n', '<C-S-r',
	':SearchBoxReplace<CR>',
	{ desc = 'Search and Replace in File' }
)

-- vim.keymap.set('n', '<leader>s',
-- 	require('searchbox').match_all(),
-- 	{ desc = 'Search in File' }
-- )
--
-- vim.keymap.set('n', '<leader>r',
-- 	function() require('searchbox').replace()
-- 	end,
-- 	{ desc = 'Search and Replace in File' }
-- )
--
vim.api.nvim_set_keymap('n', ',<leader>', ':SearchBoxClear<CR>',
	{ desc = 'Clear SearchBox Highlights' })

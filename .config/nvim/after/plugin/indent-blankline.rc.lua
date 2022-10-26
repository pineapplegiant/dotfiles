-------------------------------------
-- Indent-Blankline
-- See `:help indent_blankline.txt`
-------------------------------------
local status, indent_blankline = pcall(require, 'indent_blankline')
if (not status) then return end

local set = vim.opt

set.list = true

-- Show trailing spaces, but keep tabs as blank spaces
set.listchars:append "trail:⋅"
set.listchars:append "tab:   "


indent_blankline.setup {
	indent_blankline_char = '|',
	indent_blankline_show_end_of_line = true,
	show_trailing_blankline_indent = true,
	indent_blankline_use_treesitter = true,

	show_current_context_start = true,
	filetype_exclude = { "help", "txt", "norg", "md" },
	buftype_exclude = { "terminal", "nofile" },
	-- show_end_of_line = true,
	-- indent_blankline_char_blankline = '',
	-- show_current_context = true,
	-- space_char_blankline = " ",
	-- show_end_of_line = true,
	-- space_char_blankline = " ",
}

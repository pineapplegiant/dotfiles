-------------------------------------
-- Indent-Blankline
-- See `:help indent_blankline.txt`
-------------------------------------
local status, indent_blankline = pcall(require, "indent_blankline")
if (not status) then return end

indent_blankline.setup {
	show_trailing_blankline_indent = false,
}

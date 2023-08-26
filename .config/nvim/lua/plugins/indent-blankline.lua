-------------------------------------
-- Indent-Blankline
-- See `:help indent_blankline.txt`
-------------------------------------
---
return {
	'lukas-reineke/indent-blankline.nvim', -- Add indentation guides
    opts = {
        indent_blankline_char = '|',
        indent_blankline_show_end_of_line = true,
        show_trailing_blankline_indent = true,
        indent_blankline_use_treesitter = true,

        show_current_context_start = true,
        filetype_exclude = { "help", "txt", "norg", "md" },
        buftype_exclude = { "terminal", "nofile" },
        show_end_of_line = true,
        -- indent_blankline_char_blankline = '',
        -- show_current_context = true,
        -- space_char_blankline = " ",
        -- show_end_of_line = true,
        -- space_char_blankline = " ",
    }
}

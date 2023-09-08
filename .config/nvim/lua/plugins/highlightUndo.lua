-------------------------------------
-- https://github.com/tzachar/highlight-undo.nvim
-- highlightUndo.lua
-- See `:help colorizer`
-------------------------------------
return   {
    'tzachar/highlight-undo.nvim',
    config = true,
    opts = {
        duration = 300,
        undo = {
            hlgroup = 'HighlightUndo',
            mode = 'n',
            lhs = 'u',
            map = 'undo',
            opts = {}
            },
        redo = {
            hlgroup = 'HighlightUndo',
            mode = 'n',
            lhs = 'U',
            map = 'redo',
            opts = {}
        },
        highlight_for_count = true,
    },
}

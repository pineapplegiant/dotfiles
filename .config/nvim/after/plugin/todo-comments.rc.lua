-------------------------------------
-- todo-comments.nvim
-- See ``
-------------------------------------
local status, todo_comments = pcall(require, "todo-comments")
if (not status) then return end

todo_comments.setup()

-------------------------------------
-- nvim-colorizer.lua
-- See `:help colorizer`
-------------------------------------
local status, colorizer = pcall(require, 'Colorizer')
if (not status) then return end

colorizer.setup()

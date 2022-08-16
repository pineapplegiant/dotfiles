------------------------------------
-- Autopairs
-- See `:help nvim-autopairs.txt`
-------------------------------------
local status, autopairs = pcall(require, "nvim-autopairs")
if (not status) then return end

autopairs.setup()

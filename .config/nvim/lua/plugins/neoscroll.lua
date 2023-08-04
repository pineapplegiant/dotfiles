-------------------------------------
-- Neoscroll
-- See `:help neoscroll.txt`
-------------------------------------
local status, neoscroll = pcall(require, 'neoscroll')
if (not status) then return end

neoscroll.setup({
	easing_function = "quadratic", -- Default easing function Set any other options as needed
	hide_cursor = true
})

local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '550', nil}}
t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '550', nil}}

-- Use the "circular" easing function
-- t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '500', [['circular']]}}
-- t['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '500', [['circular']]}}

-- Pass "nil" to disable the easing animation (constant scrolling speed)
t['<C-y>'] = {'scroll', {'-0.10', 'false', '100', nil}}
t['<C-e>'] = {'scroll', { '0.10', 'false', '100', nil}}

-- When no easing function is provided the default easing function (in this case "quadratic") will be used
t['zt']    = {'zt', {'300'}}
t['zz']    = {'zz', {'300'}}
t['zb']    = {'zb', {'300'}}

require('neoscroll.config').set_mappings(t)

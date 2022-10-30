-- Highlights.lua

-- shortcuts
local set = vim.opt
local cmd = vim.api.nvim_command

set.cursorline = true -- Show cursorline
set.termguicolors = true -- If term supports ui color then enable
vim.o.background = 'dark' -- Tell nvim we're using a dark theme
--set.winblend = 0 -- Transparency for floating window
--set.pumblend = 5 -- Pseudo transparency for popup-menus

-- SET COLORSCHEME HERE
local gmos_colorscheme = 'catppuccin' -- catppuccin, tokyonight, vscode
local colorscheme_opts = 'mocha' -- ex: {tokyonight: [dark, storm, light] {catppuccin: [latte, frappe, macchiato, mocha]}

-- Colorscheme Error Wrapper
local function try_color_scheme(theme, theme_opts)
	local color_theme_string = "colorscheme " .. theme

	-- Optional theme opts
	if theme_opts ~= nil then
		if theme == 'tokyonight' then
			vim.g.tokyonight_style = theme_opts
		end
		if theme == 'catppuccin' then
			vim.g.catppuccin_flavour = theme_opts
		end
	end

	vim.cmd(color_theme_string)
end

if pcall(try_color_scheme, gmos_colorscheme, colorscheme_opts) then
	--"no errors in loading colorscheme"
else
	print("Colorscheme", gmos_colorscheme, "is not installed")
end



-- Autocommands `:h nvim_create_autocmd()`

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = '*',
})

-- Turn off The Cursor line in insert and when navigating away from window
local cursor_line_on_augroup = vim.api.nvim_create_augroup('cursor_line_on', { clear = true })
local cursor_line_off_augroup = vim.api.nvim_create_augroup('cursor_line_off', { clear = true })

-- Set Cursor Line On when leaving Insert mode
vim.api.nvim_create_autocmd({ 'InsertLeave', 'WinEnter' }, {
	group = cursor_line_on_augroup,
	desc = 'Turn on cursor line',
	callback = function()
		vim.opt.cursorline = true
	end
})

-- Cursor Line off when Exting Insert Mode
vim.api.nvim_create_autocmd({ 'InsertEnter', 'WinLeave' }, {
	group = cursor_line_off_augroup,
	desc = 'Turn off cursor line',
	callback = function()
		vim.opt.cursorline = false
	end
})

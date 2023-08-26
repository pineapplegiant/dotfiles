-------------------------------------
-- Lualine:
-- See `:help lualine.txt`
-------------------------------------
--local status, lualine = pcall(require, 'lualine')
--if (not status) then return end

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local lualine = require("lualine")
        local lazy_status = require("lazy.status") -- to configure lazy pending updates count

        lualine.setup {
            options = {
                icons_enabled = true,
                --theme = 'spaceduck',
                -- theme = 'tokyonight',
                theme = gmos_colorscheme,
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = true,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { { 'branch', icon = { "" } }, 'diff', 'diagnostics' },
                lualine_c = { 'filename' },
                lualine_x = { { lazy_status.updates, cond = lazy_status.has_updates }, {'encoding'}, {'fileformat'}, {'filetype'} },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = { 'fzf' }
        }
    end
}

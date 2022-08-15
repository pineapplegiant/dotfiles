-- ________    ___      ___  ___   _____ ______    ________   ________
-- |\   ___  \ |\  \    /  /||\  \ |\   _ \  _   \ |\   __  \ |\   ____\
-- \ \  \\ \  \\ \  \  /  / /\ \  \\ \  \\\__\ \  \\ \  \|\  \\ \  \___|
--  \ \  \\ \  \\ \  \/  / /  \ \  \\ \  \\|__| \  \\ \   _  _\\ \  \
--   \ \  \\ \  \\ \    / /    \ \  \\ \  \    \ \  \\ \  \\  \|\ \  \____
--    \ \__\\ \__\\ \__/ /      \ \__\\ \__\    \ \__\\ \__\\ _\ \ \_______\
--     \|__| \|__| \|__|/        \|__| \|__|     \|__| \|__|\|__| \|_______|
--

if vim.g.vscode then
    require('vscode')
else
    -- General Settings
    require('base')

    -- Color
    require('highlights')

    -- Mappings
    require('maps')

    -- Plugins
    require('plugins')


    -- good reference:
    -- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
end


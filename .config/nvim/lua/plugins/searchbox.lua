-------------------------------------
-- Searchbox.nvim
-- Better Search/Replace UI experience
-------------------------------------
return {
    'VonHeikemen/searchbox.nvim',
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    config = function()
    require('searchbox').setup({
          defaults = {
            reverse = false,
            exact = false,
            prompt = ' ',
            modifier = 'plain',
            confirm = 'native',
            clear_matches = true,
            show_matches = true,
          },
          popup = {
            relative = 'win',
            position = {
              row = '7%',
              col = '90%',
            },
            size = 55,
            border = {
              style = 'rounded',
              text = {
                top = ' Search ',
                top_align = 'left',
              },
            },
            win_options = {
              winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
            },
          },
          hooks = {
            before_mount = function(input)
              -- code
            end,
            after_mount = function(input)
              -- code
            end,
            on_done = function(value, search_type)
              -- code
            end
          }
        })
    end,
	keys = {
        -- { "<C-F>", "<Esc><cmd>'<,'>SearchBoxIncSearch visual_mode=true<cr>", mode = "v", desc = "Search for Words in a visual range" },
        -- { "/", "<cmd>SearchBoxMatchAll<CR>", desc = "Search for Words" },
        -- { "<C-F>", "<cmd>SearchBoxMatchAll<CR>", desc = "Search for Words" },
        { "<C-R>", "<cmd>SearchBoxReplace <CR>", desc = "Replace Words" },
    }
}

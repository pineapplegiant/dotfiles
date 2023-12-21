------------------------------------
-- Completion engine - Nvim-cmp
-- Complete the things
-- :h `nvim-cmp`
-------------------------------------

return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer", -- source for text in buffer
        "hrsh7th/cmp-path", -- source for file system paths
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'David-Kunz/cmp-npm',
        'andersevenrud/cmp-tmux',
        "onsails/lspkind.nvim",
        "L3MON4D3/LuaSnip", -- snippet engine
        "saadparwaiz1/cmp_luasnip", -- for autocompletion
        "rafamadriz/friendly-snippets", -- useful snippets
    },

    config = function()
        --   פּ ﯟ   some other good icons
        -- local kind_icons = {
        --     Text = "",
        --     Method = "m",
        --     Function = "",
        --     Constructor = "",
        --     Field = "",
        --     Variable = "",
        --     Class = "",
        --     Interface = "",
        --     Module = "",
        --     Property = "",
        --     Unit = "",
        --     Value = "",
        --     Enum = "",
        --     Keyword = "",
        --     Snippet = "",
        --     Color = "",
        --     File = "",
        --     Reference = "",
        --     Folder = "",
        --     EnumMember = "",
        --     Constant = "",
        --     Struct = "",
        --     Event = "",
        --     Operator = "",
        --     TypeParameter = "",
        -- }

        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")

        -- load vs-code like snippets from plugins (e.g. friendly-snippets)
        require("luasnip.loaders.from_vscode").lazy_load()

        -- load snippets from path/of/your/nvim/config/my-cool-snippets
        require("luasnip.loaders.from_vscode").load({ paths = { "./lua_snippets" } })

        vim.opt.completeopt = "menu,menuone,noselect"
        cmp.setup({
            snippet = {
                expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ["<C-p>"] = cmp.mapping.select_prev_item(), -- previous suggestion
            ["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
            ["<C-e>"] = cmp.mapping.abort(), -- close completion window
            ["<CR>"] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            }),
            ['<TAB>'] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true
            }),
        }),
        -- sources for autocompletion
        sources = cmp.config.sources({
            { name = "nvim_lsp" }, -- lsp
            { name = 'nvim_lua' },
            { name = "luasnip" }, -- snippets
            { name = "buffer" }, -- text within current buffer
            { name = "path" }, -- file system paths
            { name = 'buffer' },
            { name = 'tmux' },
            { name = 'path' },
            { name = 'calc' },
        }),

        -- configure lspkind for vs-code like icons
        formatting = {
          format = lspkind.cmp_format({
            maxwidth = 50,
            ellipsis_char = "...",

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            -- before = function (entry, vim_item)
            --     -- Kind icons
            --     vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            --
            --     -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
            --             --
            --     vim_item.menu = ({
            --         nvim_lsp = "[LSP]",
            --         nvim_lua = "[NVIM_LUA]",
            --         luasnip = "[Snippet]",
            --         buffer = "[Buffer]",
            --         path = "[Path]",
            --     })[entry.source.name]
            --
            --     return vim_item
            -- end,
          })
        },

        -- Set configuration for specific filetype.
        cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources({
                { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
            }, {
                { name = 'buffer' },
            })
        }),
        confirm_opts = {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        },

        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },

        experimental = {
            ghost_text = false,
            native_menu = false,
        },
})
    end,
}

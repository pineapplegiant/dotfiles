------------------------------------
-- Completion engine - Nvim-cmp
-- Complete the things
-- :h `nvim-cmp`
-------------------------------------
local status, cmp = pcall(require, 'cmp')
local kind_status, lspkind = pcall(require, 'lspkind')
local luasnip_status, luasnip = pcall(require, 'luasnip')

if (not status) and (not kind_status) and (not luasnip_status) then return end

local cmp_sources = {
	{ name = 'nvim_lsp' },
	{ name = 'nvim_lua' },
	{ name = 'luasnip' },
	{ name = 'buffer' },
	{ name = 'tmux' },
	{ name = 'path' },
	{ name = 'calc' },
}

-- Check NPM Completion exists
local npmStatus, cmp_npm = pcall(require,'cmp-npm')
if (npmStatus) then
	cmp_npm.setup({})
	table.insert(cmp_sources, {name = 'npm', keyword_length = 4})
end

-- Check Git Completion exists
local gitStatus, cmp_git = pcall(require,'cmp_git')
if (gitStatus) then
	cmp_git.setup({})
	table.insert(cmp_sources, {name = 'git'})
end



--   פּ ﯟ   some other good icons
local kind_icons = {
	Text = "",
	Method = "m",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}


cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		['<TAB>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true
		}),
		-- ["<Tab>"] = function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.select_next_item()
		-- 	elseif luasnip.expand_or_jumpable() then
		-- 		luasnip.expand_or_jump()
		-- 	else
		-- 		fallback()
		-- 	end
		-- end,
		-- ["<S-Tab>"] = function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.select_prev_item()
		-- 	elseif luasnip.jumpable(-1) then
		-- 		luasnip.jump(-1)
		-- 	else
		-- 		fallback()
		-- 	end
		-- end,
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
		  -- Kind icons
		  vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
		  -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
		  vim_item.menu = ({
			nvim_lsp = "[LSP]",
			nvim_lua = "[NVIM_LUA]",
			luasnip = "[Snippet]",
			buffer = "[Buffer]",
			path = "[Path]",
		  })[entry.source.name]
		  return vim_item
		end,
	},
	sources = cmp.config.sources(cmp_sources),

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

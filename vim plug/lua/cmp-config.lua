local cmp = require("cmp")
local npairs = require("nvim-autopairs")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local Rule = require("nvim-autopairs.rule")
local luasnip = require("luasnip")

local icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		local kind_colors = {
			Text = "#abb2bf",
			Method = "#61afef",
			Function = "#61afef",
			Constructor = "#61afef",
			Field = "#d19a66",
			Variable = "#ce7c5e",
			Class = "#e5c07b",
			Interface = "#56b6c2",
			Module = "#c678dd",
			Property = "#d19a66",
			Unit = "#56b6c2",
			Value = "#98c379",
			Enum = "#56b6c2",
			Keyword = "#c678dd",
			Snippet = "#abb2bf",
			Color = "#e06c75",
			File = "#61afef",
			Reference = "#98c379",
			Folder = "#61afef",
			EnumMember = "#56b6c2",
			Constant = "#d19a66",
			Struct = "#e5c07b",
			Event = "#d19a66",
			Operator = "#c678dd",
			TypeParameter = "#56b6c2",
		}

		for kind, color in pairs(kind_colors) do
			vim.api.nvim_set_hl(0, "CmpItemKind" .. kind, { fg = color, italic = true })
		end
	end,
})

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	view = { docs = { auto_open = false } },
	experimental = {
		ghost_text = false,
	},
	mapping = cmp.mapping.preset.insert({
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.confirm({ select = true })
			elseif luasnip.jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
		{ name = "path" },
	}),
	formatting = {
		fields = { "abbr", "kind", "menu" },
		format = function(entry, vim_item)
			local kind = vim_item.kind
			vim_item.kind = string.format(" %s %s", icons[kind] or "󰺴", kind)
			local source = entry.source.name
			function trim(text)
				local max = 40
				if text and text:len() > max then
					text = text:sub(1, max) .. "..."
				end
				return text
			end

			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				buffer = "[Buffer]",
				luasnip = "[Snip]",
				cmdline = "[Cmd]",
				path = "[Path]",
			})[source]

			if source == "vsnip" or "cmdline" or "buffer" or source == "luasnip" or source == "nvim_lsp" then
				vim_item.dup = 0
			end
			return vim_item
		end,
	},
	window = {
		completion = cmp.config.window.bordered({
			winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
			max_height = 10,
			min_height = 1,
			scrollbar = false,
		}),
		documentation = cmp.config.window.bordered({
			winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
			max_height = 10,
			min_height = 1,
			scrollbar = false,
		}),
	},
})

cmp.setup.filetype("markdown", {
	enabled = false,
})

npairs.setup({
	check_ts = true,
	ts_config = {
		python = { "string" },
	},
	disable_filetype = { "TelescopePrompt" },
})
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "path" },
		{ name = "cmdline" },
	},
})

npairs.add_rules({
	Rule("%(.*%)%s*%()$", "", "python"):use_regex(true):set_end_pair_length(0),
})

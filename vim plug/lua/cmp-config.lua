local cmp = require("cmp")
local npairs = require("nvim-autopairs")

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local Rule = require("nvim-autopairs.rule")

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  experimental = {
    ghost_text = false,
  },
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
      { name = "buffer" },
      { name = "path" },
    }, { name = "ultisnips" }),

  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        buffer = "[Buffer]",
        vsnip = "[Snippet]",
      })[entry.source.name]
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
      max_height = 10,
    }),
  },
})

npairs.setup({
  check_ts = true,
  ts_config = {
    python = { "string" },
  },
  disable_filetype = { "TelescopePrompt" },
})

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

npairs.add_rules({
  Rule("%(.*%)%s*%()$", "", "python"):use_regex(true):set_end_pair_length(0),
})

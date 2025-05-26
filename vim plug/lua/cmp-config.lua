local cmp = require("cmp")
local npairs = require("nvim-autopairs")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local Rule = require("nvim-autopairs.rule")
local luasnip = require("luasnip")
-- local log = require("plenary.log").new({
--   plugin = "uthman",
--   level = "debug",
-- })

-- local icons = {
-- 	Text = "",
-- 	Variables = "",
-- 	Snippet = "󰅩",
-- 	Class = "",
-- 	Keyword = "",
-- 	Function = "󰊕",
-- 	Module = "",
-- 	cmdline = "",
-- }

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

      if source == "vsnip" or source == "luasnip" or source == "nvim_lsp" then
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

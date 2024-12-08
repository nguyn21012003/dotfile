return {
  "L3MON4D3/LuaSnip",
  version = "2.*",
  build = "make install_jsregexp",
  config = function()
    local luasnip = require("luasnip")
    local path = vim.fn.stdpath("config") .. "/lua/snippets/python.json"

    -- Load custom snippets if the file exists
    if vim.fn.filereadable(path) == 1 then
      local snippet_data = vim.fn.json_decode(vim.fn.readfile(path))
      local snippets = {}

      for _, snippet in pairs(snippet_data) do
        table.insert(snippets, luasnip.snippet(snippet.prefix, luasnip.text_node(snippet.body)))
      end

      luasnip.add_snippets("python", snippets)
    end
  end,
}

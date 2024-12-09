return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    format = {
      timeout_ms = 3000,
      async = false, -- not recommended to change
      quiet = false, -- not recommended to change
    },
    formatters_by_ft = {
      ["tex"] = { "latexindent" },
      -- can add more here for different languages
    },
  },
}

return {
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    -- opts = {
    --   options = {
    --     mode = "tabs",
    --     -- separator_style = "slant",
    --     show_buffer_close_icons = true,
    --     show_close_icon = true,
    --   },
    -- },
  },
}

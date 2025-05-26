require("noice").setup({
  cmdline = { 
    enabled = true, 
    view = "cmdline_popup", 
  },
  presets = {
    command_palette = false,
  },
  messages = {
    enabled = true,  
    timeout = 1000,
  },
  popupmenu = { 
    enabled = true,
    backend = "cmp"
  },
  lsp = {
    progress = { enabled = true },
    signature = { enabled = false },
    hover = { enabled = true },
  }
})


return {
  {
    "folke/tokyonight.nvim",
    opts = {
      lazy = true,
      transparent = true,
      styles = {
        "moon",
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  -- logo
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
          ██╗███████╗██████╗ ███████╗███╗   ███╗██╗   ██╗
          ██║██╔════╝██╔══██╗██╔════╝████╗ ████║╚██╗ ██╔╝
          ██║█████╗  ██████╔╝█████╗  ██╔████╔██║ ╚████╔╝ 
     ██   ██║██╔══╝  ██╔══██╗██╔══╝  ██║╚██╔╝██║  ╚██╔╝  
     ╚█████╔╝███████╗██║  ██║███████╗██║ ╚═╝ ██║   ██║   
      ╚════╝ ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝   ╚═╝   
]],
        },
      },
    },
  },
}

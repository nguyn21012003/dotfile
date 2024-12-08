return {pkgs={{name="noice.nvim",spec=function()
return {
  -- nui.nvim can be lazy loaded
  { "MunifTanjim/nui.nvim", lazy = true },
  {
    "folke/noice.nvim",
  },
}

end,file="lazy.lua",dir="C:/Users/Nguyen/AppData/Local/nvim-data/lazy/noice.nvim",source="lazy",},{name="plenary.nvim",spec={"nvim-lua/plenary.nvim",lazy=true,},file="community",dir="C:/Users/Nguyen/AppData/Local/nvim-data/lazy/plenary.nvim",source="lazy",},{name="telescope.nvim",spec={"telescope.nvim",specs={{"nvim-lua/plenary.nvim",lazy=true,},},build=false,},file="telescope.nvim-scm-1.rockspec",dir="C:/Users/Nguyen/AppData/Local/nvim-data/lazy/telescope.nvim",source="rockspec",},},version=12,}
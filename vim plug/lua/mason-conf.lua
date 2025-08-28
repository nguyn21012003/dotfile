require("lspconfig").lua_ls.setup({
  settings = {
    Lua = {
      telemetry = {
        enable = false,
      },
    },
  },
  on_init = function(client)
    local join = vim.fs.joinpath
    local path = client.workspace_folders[1].name

    if vim.uv.fs_stat(join(path, ".luarc.json")) or vim.uv.fs_stat(join(path, ".luarc.jsonc")) then
      return
    end

    local nvim_settings = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          [vim.env.VIMRUNTIME] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    }

    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, nvim_settings)
  end,
})

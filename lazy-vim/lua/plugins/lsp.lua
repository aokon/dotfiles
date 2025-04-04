return {
  -- LSP Configuration & Plugins
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "ruby_lsp",
        "standardrb",
        "html",
        "gopls",
        "lua_ls",
      },
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,
        html = function()
          require("lspconfig").html.setup({
            filetypes = { "html", "erb", "html-eex", "eruby" },
          })
        end,
        lua_ls = function()
          local lua_opts = require("lspconfig/configs").lua_ls
          lua_opts.settings.Lua.diagnostics.globals = { "vim" }
          require("lspconfig").lua_ls.setup(lua_opts)
        end,
        gopls = function()
          require("lspconfig").gopls.setup({
            filetypes = { "go", "gomod", "gotpml", "gowork" },
            cmd = { "gopls" },
            root_dir = require("lspconfig.util").root_pattern("go.work", "go.mod", ".git"),
            settings = {
              gopls = {
                completeUnimported = true,
                usePlaceholders = true,
                analyses = {
                  unusedparams = true,
                },
              },
            },
          })
        end,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
  },
}

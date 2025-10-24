return {
  -- LSP Configuration & Plugins
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "ruby_lsp",
        "standardrb",
        "gopls",
        "steep",
        "html",
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
        steep = function()
          require("lspconfig").steep.setup({
            cmd = { "steep", "langserver" },
            filetypes = { "ruby" },
            root_dir = require("lspconfig.util").root_pattern("Steepfile", "Gemfile", ".git"),
          })
        end,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
  },
}

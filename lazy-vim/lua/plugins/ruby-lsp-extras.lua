return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ruby_lsp = {
        -- mason = false,
        -- cmd = { vim.fn.expand("~/.asdf/shims/ruby-lsp") },
        settings = {
          experimental = {
            -- This is successfully passed down to the ruby-lsp server
            typeTracker = true,
          },
        },
      },
    },
  },
}

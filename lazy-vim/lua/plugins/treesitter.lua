return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, _)
      vim.filetype.add({
        extension = {
          jbuilder = "ruby",
          ["text.erb"] = "ruby",
        },
      })
    end,
  },
}

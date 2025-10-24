return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      go = { "gopls" },
      ruby = function(bufnr)
        local root = require("lazyvim.util").root.get({ buf = bufnr })

        if root then
          local rubocop_config_path = root .. "/.rubocop.yml"
          local is_readable = vim.fn.filereadable(rubocop_config_path)
          local has_no_dot_config = vim.fn.filereadable(root .. "/rubocop.yml") == 1

          if is_readable == 1 or has_no_dot_config then
            print("-> Found RuboCop config. Returning 'rubocop'.")
            return { "rubocop" }
          end
        end

        -- Otherwise, default to standardrb.
        print("-> No RuboCop config found. Returning 'standardrb'.")
        return { "standardrb" }
      end,
    },
    formatters = {
      standardrb = {
        -- This is not strictly necessary with the binstubs plugin,
        -- but it makes the execution directory explicit.
        cwd = require("lazyvim.util").root.get,
      },
    },
  },
}

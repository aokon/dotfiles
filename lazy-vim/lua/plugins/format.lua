return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      go = { "gopls" },
      ruby = function(bufnr)
        local root = require("lazyvim.util").root.get({ buf = bufnr })

        print("Found Ruby project root: " .. vim.inspect(root))
        if root then
          local rubocop_config_path = root .. "/.rubocop.yml"
          local is_readable = vim.fn.filereadable(rubocop_config_path)
          local has_no_dot_config = vim.fn.filereadable(root .. "/rubocop.yml") == 1

          -- Debug: Print the path being checked and the result of the check
          -- print("Checking path: " .. rubocop_config_path)
          -- print("Is '.rubocop.yml' readable? (1=yes, 0=no): " .. is_readable)

          if is_readable == 1 or has_no_dot_config then
            print("-> Found config. Returning 'rubocop'.")
            return { "rubocop" }
          end
        end

        -- Otherwise, default to standardrb.
        print("-> Found config. Returning 'standardrb'.")
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

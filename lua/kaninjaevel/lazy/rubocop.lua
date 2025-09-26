return {
  {
    "mfussenegger/nvim-lint",
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        ruby = { "rubocop" },
        haml = { "haml_lint" }
      }

      -- Auto-lint on save and text change
      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
        callback = function()
          lint.try_lint()
        end,
      })

      -- Configure custom haml-lint linter
      lint.linters.haml_lint = {
        cmd = vim.fn.expand("~/.rbenv/shims/haml-lint"),
        stdin = false,
        args = { "--reporter", "json" },
        stream = "stdout",
        ignore_exitcode = true,
        parser = function(output)
          local diagnostics = {}
          local ok, decoded = pcall(vim.json.decode, output)
          if not ok then
            return diagnostics
          end

          for _, file in pairs(decoded.files or {}) do
            for _, offense in pairs(file.offenses or {}) do
              table.insert(diagnostics, {
                lnum = (offense.location.line or 1) - 1,
                col = (offense.location.column or 1) - 1,
                message = offense.message,
                severity = vim.diagnostic.severity.WARN,
                source = "haml-lint",
              })
            end
          end

          return diagnostics
        end,
      }

      -- Make lint errors visible as virtual text
      vim.diagnostic.config({
        virtual_text = {
          prefix = "# ",  -- Makes errors look like comments
          source = "always",
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          ruby = { "rubocop" },
        },
        -- format_on_save disabled for performance
        formatters = {
          rubocop = {
            command = vim.fn.expand("~/.rbenv/shims/rubocop"),
            args = { "--auto-correct", "--format", "quiet", "--stderr", "--stdin", "$FILENAME" },
            timeout = 10000,
          },
        },
      })
    end,
  },
}
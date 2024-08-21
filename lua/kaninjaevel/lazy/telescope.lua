return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.6",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    -- config = function()
    --     local builtin = require('telescope.builtin')
    --     vim.keymap.set('n', '<leader>pt', builtin.find_files, {})
    --     vim.keymap.set('n', '<leader>t', builtin.git_files, {})
    --     vim.keymap.set('n', '<leader>pw', function()
    --         local word = vim.fn.expand("<cword>")
    --         builtin.grep_string({ search = word })
    --     end)
    --     vim.keymap.set('n', '<leader>pWs', function()
    --         local word = vim.fn.expand("<cWORD>")
    --         builtin.live_grep({ search = word })
    --     end)
    --     vim.keymap.set('n', '<leader>ps', function()
    --         builtin.grep_string({ search = vim.fn.input("Grep > ") })
    --     end)
    --     vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
    --     vim.keymap.set('n', '<leader>pf', builtin.live_grep, {})
    -- end
}

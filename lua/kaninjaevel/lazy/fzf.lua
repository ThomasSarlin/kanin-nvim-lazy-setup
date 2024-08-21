return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("fzf-lua").setup({})
        local builtin = require('fzf-lua')
        vim.keymap.set('n', '<leader>pt', builtin.files, {})
        vim.keymap.set('n', '<leader>t', builtin.git_files, {})
        vim.keymap.set('n', '<leader>pf', builtin.live_grep)
        vim.keymap.set('n', '<leader>pw', builtin.grep_cword)
        vim.keymap.set('v', '<leader>pw', builtin.grep_visual)
    end
}

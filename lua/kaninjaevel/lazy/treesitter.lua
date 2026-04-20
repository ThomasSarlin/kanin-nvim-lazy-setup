return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function()
        require("nvim-treesitter").setup({
            install_dir = vim.fn.stdpath("data") .. "/site",
        })

        local ensure_installed = {
            "vimdoc", "javascript", "typescript", "c", "lua", "rust",
            "jsdoc", "bash", "ruby", "vim", "css",
        }

        require("nvim-treesitter").install(ensure_installed)

        vim.api.nvim_create_autocmd("FileType", {
            pattern = {
                "vimdoc", "javascript", "typescript", "typescriptreact",
                "javascriptreact", "c", "lua", "rust", "bash", "sh",
                "ruby", "eruby", "vim", "css", "help",
            },
            callback = function()
                vim.treesitter.start()
                vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}

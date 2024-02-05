local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "go",
    "python",
    "vimdoc",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp", -- css
    "html-lsp", -- htnl
    "typescript-language-server",
    -- "deno",
    "prettier",
    "vetur-vls", -- vuels

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- python
    "pyright",
    "black",

    -- vim
    "vim-language-server", -- lsp name vimls

    -- bash
    "bash-language-server",
    "shfmt",

    -- golang
    "gopls",
    "gofumpt",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
  view = {
    width = 38,
  },
  filters = {
    git_ignored = false,
    dotfiles = true,
  },
}

return M

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
    width = 35,
  },
  filters = {
    git_ignored = false,
    dotfiles = true,
  },
}

M.alpha = function()
  local status_ok, alpha = pcall(require, "alpha")
  if not status_ok then
    return
  end

  local dashboard = require "alpha.themes.dashboard"

  local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
  if is_windows then
    config_path = ":e ~\\AppData\\Local\\nvim\\init.lua<CR>"
  else
    config_path = ":e ~/.config/nvim/init.lua<CR>"
  end
  dashboard.section.buttons.val = {
    dashboard.button("t", "  File browser", ":NvimTreeToggle <CR>"),
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("f", "󰈞  Find file", ":Telescope find_files <CR>"),
    dashboard.button("w", "󰈬  Find text", ":Telescope live_grep <CR>"),
    dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
    dashboard.button("s", " " .. "Restore Session", ':lua require("persistence").load() <cr>'),
    dashboard.button("q", "󰅚  Quit Neovim", ":qa<CR>"),
    -- dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua<CR>"),
  }

  local function footer()
    -- return "恐惧让人寸步难行！"
    return "Fear makes it difficult to move forward!"
  end

  dashboard.section.footer.val = footer()

  dashboard.section.footer.opts.hl = "Type"
  dashboard.section.header.opts.hl = "Include"
  dashboard.section.buttons.opts.hl = "Keyword"

  dashboard.opts.opts.noautocmd = true
  -- alpha.setup(dashboard.opts)
  return dashboard.opts
end

return M

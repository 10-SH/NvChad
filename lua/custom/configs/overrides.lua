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
  indent = { -- 缩进
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

M.nvimtree = {
  filters = {
    enable = true,
    dotfiles = false,
    git_ignored = false,
  },
  view = {
    width = 40,
  },
  renderer = {
    root_folder_label = false,
  },
  diagnostics = {
    enable = false,
  },
}

M.neotree = {
  filesystem = {
    filtered_items = {
      visible = true, -- when true, they will just be displayed differently than normal items
      hide_dotfiles = false,
      hide_gitignored = false,
    },
  },
  source_selector = {
    winbar = true,
    statusline = false,
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
    dashboard.button("o", "  File browser(Neotree)", ":Neotree <CR>"),
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

M.refactor = function()
  local opts = {
    refactor = {
      highlight_definitions = {
        enable = true,
        -- Set to false if you have an `updatetime` of ~100.
        clear_on_cursor_move = true,
      },
      highlight_current_scope = { enable = true },
      -- smart_rename = {
      --   enable = true,
      --   -- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
      --   keymaps = {
      --     smart_rename = "grr",
      --   },
      -- },
      -- navigation = {
      --   enable = true,
      --   -- Assign keymaps to false to disable them, e.g. `goto_definition = false`.
      --   keymaps = {
      --     goto_definition = "gnd",
      --     list_definitions = "gnD",
      --     list_definitions_toc = "gO",
      --     goto_next_usage = "<a-*>",
      --     goto_previous_usage = "<a-#>",
      --   },
      -- },
    },
  }
  return opts
end

M.noice = {
  -- add any options here
  lsp = {
    hover = {
      enabled = false,
    },
    signature = {
      enabled = false,
    },
  },
  cmdline = {
    -- view = "cmdline_propu", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
    view = "cmdline", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
  },
}

M.glance = {
  height = 15, -- Height of the window
  zindex = 42,
  list = {
    position = "left", -- Position of the list window 'left'|'right'
    width = 0.25, -- 33% width relative to the active window, min 0.1, max 0.5
  },
  border = {
    enable = true, -- Show window borders. Only horizontal borders allowed
    top_char = "-",
    bottom_char = "-",
  },
  theme = { -- This feature might not work properly in nvim-0.7.2
    enable = true, -- Will generate colors for the plugin based on your current colorscheme
    mode = "auto", -- 'brighten'|'darken'|'auto', 'auto' will set mode based on the brightness of your colorscheme
  },
}

M.bufferline = {
  options = {
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = true,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      -- return "(" .. count .. ")"
      local icon = level:match "error" and " " or ""
      return " " .. icon .. count
    end,

    indicator = {
      icon = "", -- this should be omitted if indicator style is not 'icon'
      style = "icon",
    },

    offsets = {
      {
        filetype = "NvimTree",
        -- text = "File Explorer",
        text = function()
          return vim.fn.getcwd()
        end,
        highlight = "Directory",
        text_align = "left",
        separator = false,
      },
    },
    always_show_bufferline = false,
  },
}

return M

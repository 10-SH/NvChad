local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  --1-- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  --2-- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  --3--Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup {}
    end,
  },
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "FzfLua",
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup {}
    end,
  },
  {
    "10-SH/nvterm-fork",
    init = function()
      require("core.utils").load_mappings "nvterm"
    end,
    config = function(_, opts)
      require "base46.term"
      require("nvterm").setup(opts)
    end,
  },
  {
    "romgrk/nvim-treesitter-context",
    lazy = false,
    event = { "User FileOpened" },
    config = function()
      require("treesitter-context").setup {}
    end,
  },
  {
    "gen740/SmoothCursor.nvim",
    lazy = false,
    config = function()
      require("smoothcursor").setup()
    end,
  },
  {
    "hedyhli/outline.nvim",
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
      outline_window = {
        width = 22,
      },
    },
  },
  --[[ {
    "mvllow/modes.nvim",
    lazy = false,
    config = function()
      require("modes").setup()
    end,
  }, ]]
  {
    "petertriho/nvim-scrollbar",
    lazy = false,
    config = function()
      require("scrollbar").setup()
    end,
  },
  {
    "dnlhc/glance.nvim",
    lazy = false,
    config = function()
      require("glance").setup {
        border = {
          enable = true, -- Show window borders. Only horizontal borders allowed
          top_char = "―",
          bottom_char = "―",
        },
      }
    end,
  },
  {
    "folke/trouble.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
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
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  {
    "Vonr/align.nvim",
    branch = "v2",
    lazy = false,
    init = function()
      -- Create your mappings here
    end,
  },
  {
    "mhartington/formatter.nvim",
    cmd = "Format",
    config = function()
      require("formatter").setup { filetype = require("custom.configs.formatter").filetypes }
    end,
  },
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependendies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("alpha").setup(overrides.alpha())
      -- require 'alpha'.setup(require 'alpha.themes.startify'.config)
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = false,
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  -- 面包屑
  {
    "Bekaboo/dropbar.nvim",
    lazy = false,
    -- optional, but required for fuzzy finder support
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
  },

  --4-- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },
  {
    "NvChad/nvterm",
    enabled = false,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    enabled = false,
  },

  --5-- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins

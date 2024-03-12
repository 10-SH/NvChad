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
  -- {
  --   类似导航面包屑-已有其他替代
  --   "romgrk/nvim-treesitter-context",
  --   lazy = false,
  --   event = { "User FileOpened" },
  --   config = function()
  --     require("treesitter-context").setup {}
  --   end,
  -- },
  -- {
  --   "gen740/SmoothCursor.nvim",
  --   lazy = false,
  --   config = function()
  --     require("smoothcursor").setup()
  --   end,
  -- },
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
  -- {
  --   "petertriho/nvim-scrollbar",
  --   lazy = false,
  --   config = function()
  --     require("scrollbar").setup()
  --   end,
  -- },
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
  -- {
  --   "Vonr/align.nvim",
  --   branch = "v2",
  --   lazy = false,
  --   init = function()
  --     -- Create your mappings here
  --   end,
  -- },
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
  -- 面包屑 : 需要 > 0.10 , 先注销掉，不然打开neovim之后会又问题
  -- {
  --   "Bekaboo/dropbar.nvim",
  --   lazy = false,
  --   -- optional, but required for fuzzy finder support
  --   dependencies = {
  --     "nvim-telescope/telescope-fzf-native.nvim",
  --   },
  -- },
  {
    -- save session
    -- session file path: c:\\Users\\V15\\AppData\\Local\\nvim-data\\sessions
    "folke/persistence.nvim",
    lazy = false,
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
      -- add any custom options here
    },
  },
  {
    -- 导航面包屑
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    lazy = false,
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
  },
  -- {
  --    -- 展示treesitter语法树
  --   "nvim-treesitter/playground",
  --   lazy = false,
  --   config = function()
  --     require("nvim-treesitter.configs").setup {
  --       enable = true,
  --       disable = {},
  --       updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
  --       persist_queries = false, -- Whether the query persists across vim sessions
  --       keybindings = {
  --         toggle_query_editor = "o",
  --         toggle_hl_groups = "i",
  --         toggle_injected_languages = "t",
  --         toggle_anonymous_nodes = "a",
  --         toggle_language_display = "I",
  --         focus_language = "f",
  --         unfocus_language = "F",
  --         update = "R",
  --         goto_node = "<cr>",
  --         show_help = "?",
  --       },
  --     }
  --   end,
  -- },
  {
    -- 高亮 光标下变量的所有引用及其定义
    "nvim-treesitter/nvim-treesitter-refactor",
    lazy = false,
    config = function()
      require("nvim-treesitter.configs").setup {
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
    end,
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

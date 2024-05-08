local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  --【1】 ********************************************************************************************************
  --Override plugin definition options
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

  --【2】 ********************************************************************************************************
  --override plugin configs
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
    enabled = false,
    opts = overrides.nvimtree,
  },

  --【3】 ********************************************************************************************************
  --Install a plugin
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
    "NvChad/nvterm",
    enabled = false,
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
      require("glance").setup(overrides.glance)
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
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = overrides.noice,
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

  {
    -- 自动保存 session , alpha 界面使用 s 恢复保存的 session。session 文件保存地址 c:\\Users\\V15\\AppData\\Local\\nvim-data\\sessions
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
    opts = {},
  },

  {
    -- 高亮光标下变量的定义及其所有引用
    "nvim-treesitter/nvim-treesitter-refactor",
    lazy = false,
    config = function()
      require("nvim-treesitter.configs").setup(overrides.refactor())
    end,
  },

  {
    "andrewferrier/wrapping.nvim",
    lazy = false,
    config = function()
      require("wrapping").setup()
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    config = function()
      require("nvim-treesitter.configs").setup {
        autotag = {
          enable = true,
        },
      }
    end,
  },

  -- {
  --   -- 只显示当前方法 command: Twilight
  --   "folke/twilight.nvim",
  --   lazy = false,
  --   opts = {},
  -- },

  {
    "jose-elias-alvarez/null-ls.nvim",
    enabled = false,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
  },

  -- 这个插件没有配置好，暂时不用
  {
    "romgrk/barbar.nvim",
    enabled = false,
    lazy = true,
    dependencies = {
      "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
      "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = overrides.barbar,
    version = "^1.0.0", -- optional: only update when a new 1.x version is released
  },

  --4 ********************************************************************************************************
  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

--5 ********************************************************************************************************
-- 示例
-- ===设置某个插件不加载=== === === === ===
-- {
--   "NvChad/nvim-colorizer.lua",
--   enabled = false
-- },

return plugins

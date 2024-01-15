---eeeee MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<leader>h"] = "",
    ["<A-i>"] = "",
    ["<A-h>"] = "",
    ["<A-v>"] = "",
  },
}

M.general = {
  i = {
    -- go to  beginning and end
    ["<C-b>"] = { "<ESC>^i", "Beginning of line" },
    ["<C-e>"] = { "<End>", "End of line" },

    -- navigate within insert mode
  },
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>h"] = { "<C-w>h", "Window left" },
    ["<leader>l"] = { "<C-w>l", "Window right" },
    ["<leader>j"] = { "<C-w>j", "Window down" },
    ["<leader>k"] = { "<C-w>k", "Window up" },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<leader>oe"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

    -- focus
    ["<leader>le"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
  },
}

M.lspconfig = {
  plugin = true,
  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions
  n = {
    -- ["gD"] = {
    ["<leader>dl"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "LSP declaration",
    },

    -- ["gd"] = {
    ["<leader>df"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "LSP definition",
    },

    -- ["K"] = {
    ["<leader>gi"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },

    -- ["gi"] = {
    ["<leader>im"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "LSP implementation",
    },

    -- ["<leader>D"] = {
    ["<leader>tdf"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "LSP definition type",
    },

    -- ["<leader>ra"] = {
    ["<leader>re"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },

    -- ["gr"] = {
    ["<leader>rf"] = {
      function()
        vim.lsp.buf.references()
      end,
      "LSP references",
    },

    -- ["[d"] = {
    ["<leader>pe"] = {
      function()
        vim.diagnostic.goto_prev { float = { border = "rounded" } }
      end,
      "Goto prev",
    },

    -- ["]d"] = {
    ["<leader>ne"] = {
      function()
        vim.diagnostic.goto_next { float = { border = "rounded" } }
      end,
      "Goto next",
    },

    -- --

    -- ["<leader>ls"] = {
    --   function()
    --     vim.lsp.buf.signature_help()
    --   end,
    --   "LSP signature help",
    -- },
    --
    -- ["<leader>ca"] = {
    --   function()
    --     vim.lsp.buf.code_action()
    --   end,
    --   "LSP code action",
    -- },
    --
    -- ["<leader>lf"] = {
    --   function()
    --     vim.diagnostic.open_float { border = "rounded" }
    --   end,
    --   "Floating diagnostic",
    -- },
    --
    -- ["<leader>q"] = {
    --   function()
    --     vim.diagnostic.setloclist()
    --   end,
    --   "Diagnostic setloclist",
    -- },
  },
}

M.nvterm = {
  plugin = true,

  t = {
    -- toggle in terminal mode
    ["<A-f>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    ["<A-t>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<A-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },
  },

  n = {
    -- toggle in normal mode
    ["<A-f>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    ["<A-t>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<A-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },

    -- Run current code file
    ["<F5>"] = {
      function()
        local terminal = require "nvterm.terminal"
        local ft_cmds = {
          python = "python3 " .. vim.fn.expand "%",
          -- c = "gcc " .. vim.fn.expand "%" " -o " .. vim.fn.expand "%",
          c = "gcc " .. vim.fn.expand "%" .. " -o temp && ./temp",
        }
        terminal.send(ft_cmds[vim.bo.filetype], "float")
      end,
      "Run code",
    },
  },
}

-- more keybinds!

return M

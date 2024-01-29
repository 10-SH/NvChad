---eeeee MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<leader>h"] = "",

    ["<A-i>"] = "",
    ["<A-h>"] = "",
    ["<A-v>"] = "",

    ["<C-h>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
    ["<C-l>"] = "",
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
    -- ["<leader>-"] = { "<C-o>", "Old place" },
    -- ["<leader>+"] = { "<C-i>", "New place" },
    ["<leader><F4>"] = { "<Esc>:q<CR>", "quit" },
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
      -- "<CMD>Glance definitions<CR>",
      "LSP definition",
    },

    -- ["gi"] = {
    ["<leader>im"] = {
      -- function()
      --   vim.lsp.buf.implementation()
      -- end,
      -- "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
      "<CMD>Glance implementations<CR>",
      "LSP implementation",
    },

    -- ["<leader>D"] = {
    ["<leader>tdf"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      -- "<CMD>Glance type_definitions<CR>",
      "LSP definition type",
    },

    -- ["gr"] = {
    ["<leader>rf"] = {
      -- function()
      --   vim.lsp.buf.references()
      -- end,
      "<CMD>Glance references<CR>",
      "LSP references",
    },

    -- ["K"] = {
    ["<leader>gi"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },
    -- ["<leader>ra"] = {
    ["<leader>re"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
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

    ["<F5>"] = {
      function()
        local currentFile = vim.fn.expand "%"
        local currentFileWithoutFileType = vim.fn.expand "%:t:r"

        local buildFile = currentFileWithoutFileType -- aaa.c -> aaa
        if vim.g.workspace then
          local buildDirectory = vim.g.workspace
          buildFile = buildDirectory .. currentFileWithoutFileType
        end

        local ft_cmds = {
          python = "python3 " .. currentFile,
          c = "gcc " .. currentFile .. " -o " .. buildFile .. " && " .. buildFile,
          go = "go run " .. currentFile,
        }
        local terminal = require "nvterm.terminal"
        terminal.send(ft_cmds[vim.bo.filetype]) -- terminal.send(ft_cmds[vim.bo.filetype], "float")
      end,
      "Run code",
    },
  },
}

-- more keybinds!

return M

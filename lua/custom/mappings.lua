---eeeee MappingsTable
local M = {}

M.disabled = {
  n = {
      ["<leader>h"] = "",
      ["<C-a>"] = "",
      ["<C-h"] = "",
      ["<C-l"] = "",
      ["<C-j"] = "",
      ["<C-k"] = "",
  }
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
    [">"] = { ">gv", "indent"},
  },
}

M.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    ["<C-/>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },

  v = {
    ["<C>/"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
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

    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help",
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

    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },

    -- ["gr"] = {
    ["<leader>rf"] = {
      function()
        vim.lsp.buf.references()
      end,
      "LSP references",
    },

    ["<leader>lf"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
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

    ["<leader>q"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "Diagnostic setloclist",
    },
  },
}

-- more keybinds!

return M

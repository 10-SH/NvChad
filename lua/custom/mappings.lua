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
    ["<C>/"] = {
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

-- more keybinds!

return M

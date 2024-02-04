local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local diagnostic_config = {
  -- disable virtual text
  -- the message show after the current line.
  virtual_text = false,
  -- show signs
  -- signs = {
  -- active = function()
  --   -- set the style of lsp info
  --   local signs = {
  --     { name = "DiagnosticSignError", text = "" },
  --     -- { name = "DiagnosticSignWarn", text = "" },
  --     { name = "DiagnosticSignWarn", text = "!!!" },
  --     { name = "DiagnosticSignHint", text = "" },
  --     { name = "DiagnosticSignInfo", text = "" },
  --   }
  --   for _, sign in ipairs(signs) do
  --     vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  --   end
  --   return signs
  -- end,
  -- },
  -- update_in_insert = true,
  -- underline = true,
  -- severity_sort = true,
  float = {
    -- focusable = false,
    -- style = "minimal",
    border = "rounded",
    -- source = "always",
    -- header = "",
    -- prefix = "",
  },
}
vim.diagnostic.config(diagnostic_config)

local lspconfig_set = require "lspconfig"
-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "vimls", "pyright", "bashls", "vuels", "gopls" }
for _, lsp in ipairs(servers) do
  lspconfig_set[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

--
-- lspconfig.pyright.setup { blabla}

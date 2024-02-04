local M = {}

local defaults = require "formatter.defaults"

M.filetypes = {}

M.filetypes["lua"] = {
  require("formatter.filetypes.lua").stylua,
}

M.filetypes["c"] = {
  require("formatter.filetypes.c").clangformat,
}

M.filetypes["go"] = {
  require("formatter.filetypes.go").gofumpt,
}

M.filetypes["python"] = {
  require("formatter.filetypes.python").black,
}

local format_file_with_prettier = { "html", "markdown", "css", "json", "vue", "javascript" }
for _, name in ipairs(format_file_with_prettier) do
  M.filetypes[name] = {
    require("formatter.filetypes." .. name).prettier,
  }
end

return M

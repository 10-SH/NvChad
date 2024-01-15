-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--

local autocmd = vim.api.nvim_create_autocmd

-- autocmd("BufRead", {
--   pattern = { "*" },
--   -- command = "silent! wall",
--   command = "lua print('hello word!')",
--   nested = true,
-- })
--
-- autocmd("BufRead", {
--   pattern = { "*" },
--   callback = function ()
--     vim.cmd 'echo "hello world"'
--   end
-- })

autocmd("VimEnter", {
  pattern = { "*" },
  callback = function()
    local dir = vim.fn.fnamemodify(".nvim-settings", ":p")
    if vim.fn.isdirectory(dir) == 0 then
      vim.notify("'.nvim-settings' Directory did not exists", "WARN", { title = "Nvim" })
    else
      local file = vim.fn.expand(dir) .. "workspace.json"
      -- if vim.fn.filereadable(file) then
      local f = io.open(file, "r")

      if f == nil then
        return
      end

      while true do
        local line = f:read()
        if line == nil then
          break
        end
        -- print(line)
        local p = string.find(line, "build=")
        print(p)
        local sub = string.sub(line, 2)
        -- print(sub)
      end
      -- end
    end
  end,
})

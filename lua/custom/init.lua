local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--

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

-- autocmd("VimEnter", {
--   pattern = { "*" },
--   callback = function()
--     -- Settings Directory
--     local workspace = ".workspace"
--     local dir = vim.fn.fnamemodify(workspace, ":p")
--     if vim.fn.isdirectory(dir) == 0 then
--       vim.notify(workspace .. " directory did not exists", vim.log.levels.WARN, { title = "Nvim" })
--       return
--     end
--
--     local file = vim.fn.expand(dir) .. "workspace.json"
--     local f = io.open(file, "r")
--     if f == nil then
--       vim.notify(file .. " file did not exists", vim.log.levels.WARN, { title = "Nvim" })
--       return
--     end
--
--     while true do
--       local line = f:read()
--       if line == nil then
--         break
--       end
--       -- local p = string.find(line, "build=")
--       -- local sub = string.sub(line, 2)
--       local buildFile = io.open(line)
--       if buildFile == nil then
--         vim.notify("The 'build' directory did not exists", vim.log.levels.WARN, { title = "Nvim" })
--         return
--       end
--       vim.g.workspace = line
--     end
--   end,
-- })

autocmd("VimEnter", {
  pattern = { "*" },
  callback = function()
    local workspaceName = ".workspace"
    local settingsFileName = "settings.json"

    -- 给出 workspaceName 的绝对路径
    local workspaceDir = vim.fn.fnamemodify(workspaceName, ":p")
    if vim.fn.isdirectory(workspaceDir) == 0 then
      vim.notify(workspaceName .. " directory did not exists!", vim.log.levels.WARN, { title = "Nvim" })
      return
    end

    local settingsFile = workspaceDir .. settingsFileName
    local f = io.open(settingsFile, "r")
    if f == nil then
      vim.notify(settingsFile .. " file did not exists", vim.log.levels.WARN, { title = "Nvim" })
      return
    end
    local fileCotent = f:read "a"
    f:close()
    local settings = vim.json.decode(fileCotent)

    local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
    if is_windows then
      vim.g.workspace = settings.rootDirectoryWindows .. "\\" .. settings.buildDirectory .. "\\"
    else
      vim.g.workspace = settings.rootDirectoryLinux .. "/" .. settings.buildDirectory .. "/"
    end
    vim.notify(vim.g.workspace, vim.log.levels.INFO, { title = "Nvim" })
  end,
})

-- BufRead 会导致 lsp 失效，不知道为什么?
autocmd("VimEnter", {
  callback = function()
    -- open the tree
    -- require("nvim-tree.api").tree.open()
  end,
})

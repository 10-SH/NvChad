-- VsCode neovim
if vim.g.vscode then
  local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
  vim.g.APP = "vscode"
  if is_windows then
    vim.cmd "source ~/AppData/Local/nvim/lua/custom/keymaps.vim"
  else
    vim.cmd "source ~/config/nvim/lua/custom/keymaps.vim"
  end
else
  require "core"

  local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

  if custom_init_path then
    dofile(custom_init_path)
  end

  require("core.utils").load_mappings()

  local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

  -- bootstrap lazy.nvim!
  if not vim.loop.fs_stat(lazypath) then
    require("core.bootstrap").gen_chadrc_template()
    require("core.bootstrap").lazy(lazypath)
  end

  dofile(vim.g.base46_cache .. "defaults")
  vim.opt.rtp:prepend(lazypath)
  require "plugins"
end

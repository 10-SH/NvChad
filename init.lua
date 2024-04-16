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

  if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here
    -- vim.o.guifont = "Source Code Pro:h11"
    -- vim.o.guifont = "Inconsolata:h13"
    vim.o.guifont = "JetBrainsMono Nerd Font:h11"
    vim.opt.linespace = 0

    vim.g.neovide_padding_top = 0
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_padding_right = 0
    vim.g.neovide_padding_left = 0

    vim.g.neovide_floating_shadow = true
    vim.g.neovide_floating_z_height = 10
    vim.g.neovide_light_angle_degrees = 45
    vim.g.neovide_light_radius = 5
  end
end

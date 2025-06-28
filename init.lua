vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "
-- bootstrap lazy and all plugins
vim.opt.cmdheight = 0
vim.opt.laststatus = 0
vim.wo.relativenumber = true
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
--
-- vim.api.nvim_create_autocmd('CmdlineEnter', {
--     group = vim.api.nvim_create_augroup(
--         'cmdheight_1_on_cmdlineenter',
--         { clear = true }
--     ),
--     desc = 'Don\'t hide the status line when typing a command',
--     command = ':set cmdheight=1',
-- })
--
-- vim.api.nvim_create_autocmd('CmdlineLeave', {
--     group = vim.api.nvim_create_augroup(
--         'cmdheight_0_on_cmdlineleave',
--         { clear = true }
--     ),
--     desc = 'Hide cmdline when not typing a command',
--     command = ':set cmdheight=0',
-- })
--
-- vim.api.nvim_create_autocmd('BufWritePost', {
--     group = vim.api.nvim_create_augroup(
--         'hide_message_after_write',
--         { clear = true }
--     ),
--     desc = 'Get rid of message after writing a file',
--     pattern = { '*' },
--     command = 'redrawstatus',
-- })

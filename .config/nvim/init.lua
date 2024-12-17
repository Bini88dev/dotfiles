require 'core.keymaps' -- Load general options
require 'core.options' -- Load general keymaps
require 'core.snippets' -- Custom code snippets

-- [[ Install `lazy.nvim` plugin manager ]]
-- See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end --@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--  To check the current status of your plugins, run
--   :Lazy
--  You can press `?` in this menu for help. Use `:q` to close the window
--  To update plugins you can run
--   :Lazy update
-- NOTE: Here is where you install your plugins.
require('lazy').setup {
   require 'plugins.colortheme',
   require 'plugins.treesitter',
   require 'plugins.neotree',
   require 'plugins.bufferline',
   require 'plugins.lualine',
   require 'plugins.telescope',
   require 'plugins.alpha',
   require 'plugins.indent-blankline',
   require 'plugins.misc',
   require 'plugins.comment',
--   require 'plugins.lsp',
--   require 'plugins.autocompletion',
--   require 'plugins.none-ls',
--   require 'plugins.gitsigns',
}
-- Setup catppuccin must be called before loading
vim.cmd.colorscheme "catppuccin-mocha"

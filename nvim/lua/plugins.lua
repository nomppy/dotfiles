local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--  'scrooloose/nerdtree-project-plugin'
--  'xuyuanp/nerdtree-git-plugin'
--   'vim-airline/vim-airline'
--   'vim-airline/vim-airline-themes'
-- 'liuchengxu/vim-which-key'

local plugins = {
  {'easymotion/vim-easymotion'},
  {'nvim-tree/nvim-tree.lua'},
  {'nvim-lualine/lualine.nvim'},
  {'vim-airline/vim-airline-themes'},
  {'nvim-telescope/telescope.nvim'},
  {'ryanoasis/vim-devicons'},
  {'folke/which-key.nvim',
  event = "VeryLazy",
--  config = function()
--    require("config.whichkey").setup()
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end, },
  {'ms-jpq/coq_nvim'},
  --{'nvim-treesitter/nvim-treesitter'},

  -- latex
  {'sirver/ultisnips'},
  {'lervag/vimtex'},
  {'tpope/vim-dispatch'},

  -- Programming Support
  {'preservim/nerdcommenter'},
  {'tpope/vim-surround' },
  {'maxmellon/vim-jsx-pretty'},
  {'yggdroot/indentline'},
  {'catppuccin/nvim', name = 'catppuccin', priority = 1000},
}

require("lazy").setup(plugins)
vim.cmd.colorscheme "catppuccin"

--require("nvim-treesitter.configs").setup({
   -- -- this can also be a list of languages
  --ensure_installed = all,
  --auto_install = true,
  --highlight = { enable = true },
--})



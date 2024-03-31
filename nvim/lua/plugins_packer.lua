-- Install Packer automatically if it's not installed(Bootstraping)
-- Hint: string concatenation is done by `..`
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()


-- Reload configurations if we modify plugins.lua
-- Hint
--     <afile> - replaced with the filename of the buffer being manipulated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])


-- Install plugins here - `use ...`
-- Packer.nvim hints
--     after = string or list,           -- Specifies plugins to load before this plugin. See "sequencing" below
--     config = string or function,      -- Specifies code to run after this plugin is loaded
--     requires = string or list,        -- Specifies plugin dependencies. See "dependencies". 
--     ft = string or list,              -- Specifies filetypes which load this plugin.
--     run = string, function, or table, -- Specify operations to be run after successful installs/updates of a plugin
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    ---------------------------------------
    -- NOTE: PUT YOUR THIRD PLUGIN HERE --
    ---------------------------------------

    -- Utility
    use 'easymotion/vim-easymotion'
    use 'preservim/nerdtree'
    -- use 'scrooloose/nerdtree-project-plugin'
    -- use 'xuyuanp/nerdtree-git-plugin'
    use 'nvim-telescope/telescope.nvim'
    use 'ryanoasis/vim-devicons'
    use 'liuchengxu/vim-which-key'
    use {'ms-jpq/coq_nvim', {'branch': 'coq'}}

    -- On-demand lazy load
    use 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

    -- To register the descriptions when using the on-demand load feature,
    -- use the autocmd hook to call which_key#register(), e.g., register for the Space key:
    -- autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')

    -- LaTeX
    use 'sirver/ultisnips'
    use 'lervag/vimtex'
    -- use 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
    use 'tpope/vim-dispatch'

    -- Programming Support
    use 'preservim/nerdcommenter'
    use 'tpope/vim-surround' 
    --use 'neoclide/coc.nvim'
    use 'maxmellon/vim-jsx-pretty'

    -- Git
    use 'tpope/vim-fugitive'
    use 'airblade/vim-gitgutter'

    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'yggdroot/indentline'

    -- Theme
    -- use 'catppuccin/nvim', { 'as': 'catppuccin' }
    use { "catppuccin/nvim", as = "catppuccin" }
  
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)


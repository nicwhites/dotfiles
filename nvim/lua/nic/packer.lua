vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function(use)

    -- Rust specifig crates
    use { 'rust-lang/rust.vim', ft= "rust"}
    use 'simrat39/rust-tools.nvim'   
    use { 'alexghergh/nvim-tmux-navigation', config = function()
                require'nvim-tmux-navigation'.setup {
                    disable_when_zoomed = true, -- defaults to false
                    keybindings = {
                        left = "<C-h>",
                        down = "<C-j>",
                        up = "<C-k>",
                        right = "<C-l>",
                        last_active = "<C-\\>",
                        next = "<C-Space>",
                    }
                }
            end
        }
    use('simrat39/inlay-hints.nvim')
    use 'feline-nvim/feline.nvim'
	use 'wbthomason/packer.nvim'
    use 'mfussenegger/nvim-dap'
    use 'ray-x/go.nvim'
    use 'ray-x/guihua.lua' -- recommended if need floating window support
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }

	use{ 'nvim-telescope/telescope.nvim',
	requires = {{ 'nvim-lua/plenary.nvim'}}}

    use {
      'lewis6991/gitsigns.nvim',
  -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    }
    use({
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!:).
	run = "make install_jsregexp"
    })
    use { "ellisonleao/gruvbox.nvim" }
	use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use ('nvim-treesitter/playground')
	use ('mbbill/undotree')
	use ('tpope/vim-fugitive')
    use {
          'VonHeikemen/lsp-zero.nvim',
          branch = 'v2.x',
          requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
              'williamboman/mason.nvim',
              run = function()
                pcall(vim.cmd, 'MasonUpdate')
              end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
          }
        }
    use {
      'rmagatti/goto-preview',
      config = function()
        require('goto-preview').setup {}
      end
    }
    use {'romgrk/barbar.nvim', requires = {
        'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    }}
    use 'Exafunction/codeium.vim'
    use 'nvim-tree/nvim-web-devicons'
    use 'j-hui/fidget.nvim'
    use('jose-elias-alvarez/null-ls.nvim')
    use('MunifTanjim/prettier.nvim')
    use ({"ziontee113/color-picker.nvim",
        config = function()
            require("color-picker")
        end,
    })
end) 

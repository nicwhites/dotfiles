vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

    use({
      "arsham/arshamiser.nvim",
      requires = {
        "arsham/arshlib.nvim",
        "famiu/feline.nvim",
        "rebelot/heirline.nvim",
        "kyazdani42/nvim-web-devicons",
      },
      config = function()
        -- ignore any parts you don't want to use
        vim.cmd.colorscheme("arshamiser_light")
        require("arshamiser.feliniser")
        -- or:
        -- require("arshamiser.heirliniser")

        _G.custom_foldtext = require("arshamiser.folding").foldtext
        vim.opt.foldtext = "v:lua.custom_foldtext()"
        -- if you want to draw a tabline:
        vim.api.nvim_set_option("tabline", [[%{%v:lua.require("arshamiser.tabline").draw()%}]])
      end,
    })
	use 'wbthomason/packer.nvim'
    use 'mfussenegger/nvim-dap'
	use{ 'nvim-telescope/telescope.nvim', tag = '0.1.1',
	requires = {{ 'nvim-lua/plenary.nvim'}}}

    use {
      'lewis6991/gitsigns.nvim',
  -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    }
    use { "ellisonleao/gruvbox.nvim" }
	use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use ('nvim-treesitter/playground')
	use ('mbbill/undotree')
	use ('tpope/vim-fugitive')
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
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
        'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    }}
	use ('github/copilot.vim')
    use 'nvim-tree/nvim-web-devicons'
    use({
      'weilbith/nvim-code-action-menu',
      cmd = 'CodeActionMenu',
    })
    use 'j-hui/fidget.nvim'
end) 

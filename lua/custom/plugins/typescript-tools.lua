return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {},
  config = function()
    require('typescript-tools').setup {
      settings = {
        tsserver_file_preferences = {
          importModuleSpecifierPreference = 'non-relative',
          importModuleSpecifierEnding = 'minimal',
        },
      },
    }
  end,
}

-- custom mappings
vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>')

return {
  'nvimdev/lspsaga.nvim',
  config = function()
    require('lspsaga').setup {
      lightbulb = {
        enable = false, -- disables both
        virtual_text = false, -- disables just the one at the end of the line
      },
    }
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- optional
    'nvim-tree/nvim-web-devicons', -- optional
  },
}

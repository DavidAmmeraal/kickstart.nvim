local function my_on_attach(bufnr)
  local api = require 'nvim-tree.api'

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts 'Up')
  vim.keymap.set('n', '<leader>tt', api.tree.toggle, { desc = '[T]oggle [T]ree' })
end

local function open_nvim_tree()
  -- open the tree
  require('nvim-tree.api').tree.open()
end

vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = open_nvim_tree })
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  pattern = 'NvimTree*',
  callback = function()
    local api = require 'nvim-tree.api'
    local view = require 'nvim-tree.view'

    if not view.is_visible() then
      api.tree.open()
    end
  end,
})

return {
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {
        on_attach = my_on_attach,
        filters = {
          dotfiles = false,
          exclude = {
            '.env',
          },
        },
        update_focused_file = { enable = true },
        view = {
          width = 30,
        },
      }
    end,
  },
  {
    'nvim-tree/nvim-web-devicons',
    enabled = true,
  },
}

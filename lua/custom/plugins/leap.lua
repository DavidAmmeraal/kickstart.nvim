return {
  'ggandor/leap.nvim',
  version = '*',
  lazy = false,
  config = function()
    require('leap').create_default_mappings()
  end,
}

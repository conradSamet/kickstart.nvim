return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local lualine = require 'lualine'
    local lazy_status = require 'lazy.status'

    lualine.setup {
      options = {
        globalstatus = true,
        disabled_filetypes = { 'neo-tree' },
      },
      sections = {
        lualine_c = {},
        lualine_x = {
          { lazy_status.updates, cond = lazy_status.has_updates, color = { fg = '#ff9e64' } },
          { 'encoding' },
          { 'filetype' },
          { 'filesize' },
        },
        lualine_z = { {
          'os.date("%H:%M")',
          icon = ' ',
        } },
      },
      winbar = {
        lualine_a = {
          {
            'filename',
            path = 1,
            file_status = true,
          },
        },
      },
      inactive_winbar = {
        lualine_a = {
          {
            'filename',
            path = 1,
            file_status = true,
          },
        },
      },
      extensions = {
        'lazy',
      },
    }
  end,
}

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = 'dracula',
        --theme = 'dracula-nvim',
        icons_enabled = true,
        component_separators = '|',
        section_separators = ' '
        --section_separators = {left = '', right = ''}
      },
      sections = {
          --lualine_a = {{'mode', separator = {left = ''}, right_padding = 2}},
          lualine_a = {{'mode', right_padding = 2}},
          lualine_b = {
              'filename', 'branch'
              --require("lsp-progress").progress
          },
          --lualine_c = {'fileformat'},
          lualine_c = {'diagnostics'},
          lualine_c = {},
          lualine_x = {'encoding'},
          lualine_y = {'filetype', 'progress'},
          lualine_z = {
              {'location', left_padding = 2, right_padding = 2}
          }
      },
      inactive_sections = {
          lualine_a = {'filename'},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {'location'}
      },
      tabline = {},
      extensions = {}
    })
  end,
}

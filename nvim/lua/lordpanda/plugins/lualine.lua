return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    local function LSP() -- LSP status
      local msg = 'No Active Lsp'
      local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
      local clients = vim.lsp.get_active_clients()
      if next(clients) == nil then
        return msg
      end
      for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
          return client.name
        end
      end
      return (" LSP:" + msg)
    end

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = "dracula",
        --theme = 'dracula-nvim',
        icons_enabled = true,
        component_separators = "|",
        section_separators = " ",
        --section_separators = {left = '', right = ''}
      },
      sections = {
        --lualine_a = {{'mode', separator = {left = ''}, right_padding = 2}},
        lualine_a = { { "mode", right_padding = 2 } },
        lualine_b = {
          "filename",
          "branch",
          --require("lsp-progress").progress
        },
        lualine_c = { "diagnostics" },
        lualine_x = { { LSP , icon = " LSP:" } },
        lualine_y = { "encoding", "filetype" },
        lualine_z = {
          "progress", { "location", left_padding = 2, right_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
      tabline = {},
      extensions = {},
    })
  end,
}

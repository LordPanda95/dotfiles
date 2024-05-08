return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  opts = {
    signs = {
      -- icons / text used for a diagnostic
      error = "",
      warning = "",
      hint = "",
      information = "",
      other = "",
    },
    use_diagnistic_signs = false,
  },
  keys = {
    { "<leader>xx", "<cmd>TroubleToggle<CR>", desc = "Open/close trouble list", {silent = true}},
    { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Open trouble workspace diagnostics", {silent = true} },
    { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Open trouble document diagnostics", {silent = true} },
    { "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", desc = "Open trouble quickfix list", {silent = true} },
    { "<leader>xl", "<cmd>TroubleToggle loclist<CR>", desc = "Open trouble location list", {silent = true} },
    { "<leader>xt", "<cmd>TodoTrouble<CR>", desc = "Open todos in trouble", {silent = true} },
  },
}

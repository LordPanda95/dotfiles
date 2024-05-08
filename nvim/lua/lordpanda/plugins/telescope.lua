return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")
    local transform_mod = require("telescope.actions.mt").transform_mod

    local trouble = require("trouble")
    local trouble_telescope = require("trouble.providers.telescope")

    -- or create your custom action
    local custom_actions = transform_mod({
      open_trouble_qflist = function(prompt_bufnr)
        trouble.toggle("quickfix")
      end,
    })

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
            ["<C-t>"] = trouble_telescope.smart_open_with_trouble,
          },
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("noice")
    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" }, {silent = true})
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" }, {silent = true})
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" }, {silent = true})
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" }, {silent = true})
    keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" }, {silent = true})
    keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Fuzzy find vim buffers" }, {silent = true})
    keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "find help tags" }, {silent = true})
    keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Find git branches" }, {silent = true})
    keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Fuzzy find git commits" }, {silent = true})
    keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Fuzzy find git status" }, {silent = true})
    keymap.set("n", "<leader>ls", builtin.lsp_document_symbols, { desc = "Fuzzy find files in cwd" }, {silent = true})
    -- keymap.set('n', 'gr', builtin.lsp_references,
    --                {noremap = true, silent = true, desc = "Go to references" })
    -- keymap.set('n', 'gd', builtin.lsp_definitions,
    --                {noremap = true, silent = true, desc = "Go to definition" })
  end,
}

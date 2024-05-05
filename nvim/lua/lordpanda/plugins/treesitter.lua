return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    -- import nvim-treesitter plugin
    local treesitter = require("nvim-treesitter.configs")

    -- configure treesitter
    treesitter.setup({ -- enable syntax highlighting
      highlight = {
        enable = true,
      },
      sync_install = false,
      auto_install = true,
      -- enable indentation
      indent = { enable = true },
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      autotag = {
        enable = true,
      },
      -- ensure these language parsers are installed
      ensure_installed = {
        "bash",
        "c",
        "c_sharp",
        "cmake",
        "comment",
        "cpp",
        "css",
        "csv",
        "diff",
        "dockerfile",
        "git_config",
        "gitattributes",
        "gitignore",
        "go",
        "groovy",
        "html",
        "javascript",
        "json",
        "lua",
        "make",
        "markdown",
        "promql",
        "python",
        "regex",
        "requirements",
        "sql",
        "ssh_config",
        "swift",
        "terraform",
        "tmux",
        "toml",
        "xml",
        "yaml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = false,
          node_incremental = false,
          scope_incremental = false,
          node_decremental = false,
        },
      },
    })
  end,
}

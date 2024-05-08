return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "ansiblels", -- ansible
        --"bash-language-server", -- bash
        --"cmake-language-server", -- cmake
        --"css-lsp", -- css/scss/less
        --"eslint-lsp", -- javascript/typescript
        "docker_compose_language_service", -- docker compose
        "dockerls", -- docker
        "gopls", -- go
        --"grammarly-languageserveri", -- makrdown
        --"groovy-language-server", -- groovy
        --"html-lsp", -- html
        "jinja_lsp", -- jinja
        --"json-lsp",  -- json
        "lemminx", -- xml
        "lua_ls", -- lua
        --"nginx_ls", -- nginx
        "powershell_es", --powershell
        "pyright", -- python
        "sqls", -- sql
        "taplo", -- toml
        --"terraform-ls", --terraform
        "yamlls", -- yaml
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        -- fromaters
        "shfmt", -- bash
        "gofumpt", -- go
        "xmlformatter", -- xml
        "stylua", -- lua
        "prettierd", -- prettier formatter
        -- css/html/json/javascript/less/scss/makrdown/yaml
        "isort", -- python formatter
        "black", -- python formatter
        "sql-formatter", -- sql
        -- linters
        "ansible-lint", -- ansible
        "shellcheck", -- bash
        "cmakelang", -- cmake
        "stylelint", -- css/sccs/less
        "eslint_d", -- javascript/typescript
        "golangci-lint", -- go
        "markdownlint", -- makrdown
        "npm-groovy-lint", --groovy
        "htmlhint", -- html
        "jsonlint", -- json
        --"luacheck", -- lua
        "pylint", -- python
        "tflint", -- terraform
        --"yamllint" --yaml
      },
    })
  end,
}

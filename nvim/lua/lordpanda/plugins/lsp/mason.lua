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
        "ansible-language-server", -- ansible
        --"bash-language-server", -- bash
        --"cmake-language-server", -- cmake
        --"css-lsp", -- css/scss/less
        --"eslint-lsp", -- javascript/typescript
        "docker-compose-language-service", -- docker compose
        "dockerfile-language-server", -- docker
        "gopls", -- go
        --"grammarly-languageserveri", -- makrdown
        --"groovy-language-server", -- groovy
        --"html-lsp", -- html
        "jinja-lsp", -- jinja
        --"json-lsp",  -- json
        "lemminx", -- xml
        "lua-language-server", -- lua
        "nginx-language-server", -- nginx
        "powershell-editor-services", --powershell
        "pyright", -- python
        "sqls", -- sql
        "taplo", -- toml
        --"terraform-ls", --terraform
        "yaml-language-server", -- yaml
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

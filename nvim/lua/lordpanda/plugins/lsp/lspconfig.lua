return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    "mrded/nvim-lsp-notify",
  },
  config = function()
    -- require("lsp_signature").setup()

    require("lsp-notify").setup({
      notify = require("notify"),
    })

    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- import mason_lspconfig plugin
    local mason_lspconfig = require("mason-lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

        -- set keybinds
        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

        -- opts.desc = "Go to declaration"
        -- keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

        -- opts.desc = "See available code actions"
        -- keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
      end,
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    mason_lspconfig.setup_handlers({
      -- default handler for installed servers
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
      ["ansiblels"] = function()
        -- configure ansible-language-server
        lspconfig["ansiblels"].setup({
          --capabilities = capabilities,
          filetypes = { "yaml.ansible" },
        })
      end,
      ["terraformls"] = function()
        -- configure ansible-language-server
        lspconfig["terraformls"].setup({
          --capabilities = capabilities,
          filetypes = { "terraform" },
        })
      end,
      ["tflint"] = function()
        -- configure ansible-language-server
        lspconfig["tflint"].setup({
          --capabilities = capabilities,
          filetypes = { "terraform" },
        })
      end,
      ["dockerls"] = function()
        -- configure ansible-language-server
        lspconfig["dockerls"].setup({
          capabilities = capabilities,
          filetypes = { "dockerfile" },
        })
      end,
      ["docker_compose_language_service"] = function()
        -- configure ansible-language-server
        lspconfig["docker_compose_language_service"].setup({
          capabilities = capabilities,
          filetypes = { "yaml.docker-compose" },
        })
      end,
      ["gopls"] = function()
        -- configure ansible-language-server
        lspconfig["gopls"].setup({
          capabilities = capabilities,
          filetypes = { "go", "go.mod" },
          --root_dir = root_pattern("go.work", "go.mod"),
          settings = {
            gopls = {
              analyses = {
                unsedparam = true,
                shadow = true,
              },
              staticcheck = true,
            },
          },
        })
      end,
      ["jinja_lsp"] = function()
        -- configure ansible-language-server
        lspconfig["jinja_lsp"].setup({
          capabilities = capabilities,
          filetypes = { "jinja" },
        })
      end,
      ["lemminx"] = function()
        -- configure ansible-language-server
        lspconfig["lemminx"].setup({
          capabilities = capabilities,
          filetypes = { "xml", "xsd", "xsl", "xslt", "svg" },
        })
      end,
      -- ["nginx_language_server"] = function()
      --   -- configure ansible-language-server
      --   lspconfig["nginx_language_server"].setup({
      --     capabilities = capabilities,
      --     filetypes = { "nginx" },
      --   })
      -- end,
      ["powershell_es"] = function()
        --configure ansible-language-server
        lspconfig["powershell_es"].setup({
          capabilities = capabilities,
          filetypes = { "ps1" },
        })
      end,
      ["pyright"] = function()
        -- configure ansible-language-server
        lspconfig["pyright"].setup({
          capabilities = capabilities,
          filetypes = { "python" },
        })
      end,
      ["sqls"] = function()
        -- configure ansible-language-server
        lspconfig["sqls"].setup({
          capabilities = capabilities,
          filetypes = { "sql", "mysql" },
        })
      end,
      ["taplo"] = function()
        -- configure ansible-language-server
        lspconfig["taplo"].setup({
          capabilities = capabilities,
          filetypes = { "toml" },
        })
      end,
      ["yamlls"] = function()
        -- configure ansible-language-server
        lspconfig["yamlls"].setup({
          capabilities = capabilities,
          filetypes = { "yaml" },
        })
      end,
      ["emmet_ls"] = function()
        -- configure emmet language server
        lspconfig["emmet_ls"].setup({
          capabilities = capabilities,
          filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
        })
      end,
      ["lua_ls"] = function()
        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { "vim" },
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        })
      end,
    })
  end,
}

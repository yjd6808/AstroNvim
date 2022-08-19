local config = {

  colorscheme = "vscode",
  options = function(local_vim)
    -- 옵션 설정
    local_vim.opt.relativenumber = true
    local_vim.opt.tabstop = 4
    local_vim.opt.shiftwidth = 4

    -- 글로벌 변수 설정
    local_vim.g.mapleader = " "
    return local_vim
  end,

  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  lsp = {
    ["server-settings"] = {
      clangd = {
        cmd = { "clangd", "--completion-style=detailed" },
      },
    },
  },

  mappings = {
    n = {
      ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
      ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
      ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
      ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
      ["<tab>"] = { ">>", desc = "Indent Foward" },
      ["<S-tab>"] = { "<<", desc = "Indent Backward" },
      ["<C-s>"] = { ":w!<cr>", desc = "Save File" },
      ["<esc><esc>"] = { ":noh<cr>", desc = "Clear Selections" },
    },

    x = {
      ["<tab>"] = { ">><esc>", desc = "Indent Foward" },
      ["<S-tab>"] = { "<<<esc>", desc = "Indent Backward" },
    },
  },

  plugins = {
    init = {
      ["Mofiqul/vscode.nvim"] = {},
      ["ray-x/lsp_signature.nvim"] = {
        event = "BufRead",
        config = function() require("lsp_signature").setup() end,
      },
    },

    -- All other entries override the require("<key>").setup({...}) call for default plugins
    ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
      -- config variable is the default configuration table for the setup functino call
      local null_ls = require "null-ls"
      -- Check supported formatters and linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      config.sources = {
        -- Set a formatter
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
      }

      -- set up null-ls's on_attach function
      -- NOTE: You can remove this on attach function to disable format on save
      config.on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
          vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "Auto format before save",
            pattern = "<buffer>",
            callback = vim.lsp.buf.formatting_sync,
          })
        end
      end
      return config -- return final config table to use in require("null-ls").setup(config)
    end,
    treesitter = { -- overrides `require("treesitter").setup(...)`
      ensure_installed = { "lua" },
    },
    -- use mason-lspconfig to configure LSP installations
    ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
      ensure_installed = { "sumneko_lua" },
    },
    -- use mason-tool-installer to configure DAP/Formatters/Linter installation
    ["mason-tool-installer"] = { -- overrides `require("mason-tool-installer").setup(...)`
      ensure_installed = { "prettier", "stylua" },
    },
    packer = { -- overrides `require("packer").setup(...)`
      compile_path = vim.fn.stdpath "data" .. "/packer_compiled.lua",
    },
  },

  -- LuaSnip Options
  luasnip = {
    -- Add paths for including more VS Code style snippets in luasnip
    vscode_snippet_paths = {},
    -- Extend filetypes
    filetype_extend = {
      javascript = { "javascriptreact" },
    },
  },

  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },

  -- Modify which-key registration (Use this with mappings table in the above.)
  ["which-key"] = {
    -- Add bindings which show up as group name
    register_mappings = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- third key is the key to bring up next level and its displayed
          -- group name in which-key top level menu
          ["b"] = { name = "Buffer" },
        },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set key binding
    -- Set autocommands
    vim.api.nvim_create_augroup("packer_conf", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePost", {
      desc = "Sync packer after modifying plugins.lua",
      group = "packer_conf",
      pattern = "plugins.lua",
      command = "source <afile> | PackerSync",
    })

    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}

return config

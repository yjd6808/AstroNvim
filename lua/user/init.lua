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
      ["<C-s>"] = { ":w!<cr>", desc = "Save File" },
      ["<esc><esc>"] = { ":noh<cr>", desc = "Clear Selections" },
    },

    x = {},
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
}

-- 빔 스크립트 실행 꼼수
-- [[ ]]이렇게 묶으면 여러줄의 문자열을 작성할 수 있음.
--
-- 플러그인 삭제방법은 cmd 내부 문자열들 다 지우고 PlugClean 실행해주면 삭제할 수 있음
vim.cmd [[
  " call plug#begin()
    
  " call plug#end()
]]

return config

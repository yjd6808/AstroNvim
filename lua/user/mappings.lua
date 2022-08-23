local create_command = vim.api.nvim_create_user_command
local is_available = astronvim.is_available

local maps = { n = {}, i = {}, x = {}, v = {}, t = {}, [""] = {} }

maps[""]["<Space>"] = "<Nop>"

-- 노말 모드 단축키
maps.n["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" }
maps.n["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" }
maps.n["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" }
maps.n["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" }
maps.n["<C-s>"] = { ":w!<cr>", desc = "Save File" }
maps.n["<esc><esc>"] = { ":noh<cr>", desc = "Clear Selections" }
maps.n["<tab>"] = { ">>", desc = "Forward indent" }
maps.n["<S-tab>"] = { "<<", desc = "Backward indent" }

maps.n["<leader>vr"] = { "<cmd>VimspectorReset<cr>", desc = "Reset" }
maps.n["<leader>ve"] = { "<cmd>VimspectorEval<cr>", desc = "Evaluate" }
maps.n["<leader>vb"] = { "<cmd>VimspectorBreakpoints<cr>", desc = "Show Breakpoints" }
maps.n["<leader>vi"] = { "<cmd>VimspectorJumpToProgramCounter<cr>", desc = "JumpTo Instruction Pointer" }
maps.n["<leader>vs"] = { "<cmd>VimspectorStop<cr>", desc = "Stop" }
maps.n["<leader>vp"] = { "<cmd>VimspectorPause<cr>", desc = "Pause" }
maps.n["<leader>vP"] = { "<cmd>VimspectorResume<cr>", desc = "Resume" }

-- 입력 모드 단축키
maps.i["<tab>"] = { "<C-T>", desc = "Forward indent" }
maps.i["<S-tab>"] = { "<C-D>", desc = "Backward indent" }

-- 선택 모드 단축키
maps.x["<tab>"] = { ">>", desc = "Forward indent" }
maps.x["<S-tab>"] = { "<<", desc = "Backward indent" }

return maps

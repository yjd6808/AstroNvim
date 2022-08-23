-- 이 파일은 자동으로 reuqire 안되기 땜에 ~/.config/nvim/init.lua에서 초기화해주도록 한다.
local create_command = vim.api.nvim_create_user_command
local is_available = astronvim.is_available

if is_available "vimspector.nvim" then
end

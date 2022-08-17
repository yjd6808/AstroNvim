_G.jdyun = {
  debug = true, -- 디버그 출력을 할지 여부

  debug_print = function(message)
    if jdyun.debug == true then print(message) end
  end,

  -- debug 글로벌 변수로 함수 정보를 얻을 수 있다.
  parent_function_info = function()
     local info = debug.getinfo(3, "Sl")
     if info then return tostring(string.format("[%s]:%d", info.short_src, info.currentline)) end
     return "[nil]:0"
  end,
}

jdyun.debug_print("nvim 설치 경로 : " .. vim.fn.stdpath "data")

local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then impatient.enable_profile() end

for _, source in ipairs {
  "core.utils",
  "core.options",
  "core.bootstrap",
  "core.plugins",
  "core.autocmds",
  "core.mappings",
  "configs.which-key-register",
} do
  jdyun.debug_print(source .. " [로딩 시작]")
  local status_ok, fault = pcall(require, source)
  if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
end

astronvim.conditional_func(astronvim.user_plugin_opts("polish", nil, false))

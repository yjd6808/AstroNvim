astronvim.initialize_packer()

local colorscheme = astronvim.user_plugin_opts("colorscheme", { colorscheme="onedark"})

jdyun.debug_print("설정된 테마 : " .. inspect(colorscheme))

vim.api.nvim_command(
  "colorscheme "
    .. (vim.tbl_contains(vim.fn.getcompletion("", "color"), colorscheme) and colorscheme or "default_theme")
)

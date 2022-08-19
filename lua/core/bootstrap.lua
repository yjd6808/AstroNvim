astronvim.initialize_packer()

local colorscheme = astronvim.user_plugin_opts("colorscheme", nil, false)
jdyun.debug_print("사용자 설정  테마 : " .. inspect(colorscheme))
jdyun.debug_print "설정 가능한 테마 목록"
jdyun.debug_print(inspect(vim.fn.getcompletion("", "color")))

-- vim.fn.getcompletion 함수 정보 : http://www.polarhome.com/vim/manual/v81/eval.html#getcmdwintype()
-- vim.fn.getcompletion("", "color") 명령을 수행하면 vim에서 :colorscheme 을 수행했을 때 적용가능한 테마 목록을 가져온다.
-- vim.tbl_contains 함수 정보 : https://neovim.io/doc/user/lua.html#vim.fn
-- vim.tbl_contains(tbl1, elem) tb1에 elem이 포함되어있으면 true를 반환한다.
vim.api.nvim_command(
  "colorscheme "
    .. (vim.tbl_contains(vim.fn.getcompletion("", "color"), colorscheme) and colorscheme or "default_theme")
)

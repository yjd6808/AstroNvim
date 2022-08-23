return {
  ["Mofiqul/vscode.nvim"] = {},
  ["puremourning/vimspector"] = {},
  ["ray-x/lsp_signature.nvim"] = {
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
}

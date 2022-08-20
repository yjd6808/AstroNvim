 -- use mason-tool-installer to configure DAP/Formatters/Linter installation
return { -- overrides `require("mason-tool-installer").setup(...)`
      ensure_installed = { "prettier", "stylua" },
}

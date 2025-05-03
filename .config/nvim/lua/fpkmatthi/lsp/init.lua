local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("fpkmatthi.lsp.mason")
require("fpkmatthi.lsp.handlers").setup()

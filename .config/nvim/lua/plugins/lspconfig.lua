return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      gopls = {
        settings = {
          gopls = {
            -- custom build flags for work.
            buildFlags = { "-tags=integration,e2e,hubspot_e2e" },
          },
        },
      },
    },
    -- inlay hints I'd rather have as opt-in
    inlay_hints = { enabled = false },
  },
}

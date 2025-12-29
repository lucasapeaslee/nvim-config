return {
  "nvim-treesitter/nvim-treesitter",
  -- optionally make it load early
  event = { "BufReadPre", "BufNewFile" },
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })()
  end,
  -- Because treesitter’s setup is `require("nvim-treesitter.configs").setup(opts)`,
  -- we use `config =` rather than `opts =` so that lazy.nvim doesn’t try to call
  -- `require("nvim-treesitter").setup(...)` (which would be incorrect) :contentReference[oaicite:2]{index=2}
  config = function()
    local configs = require("nvim-treesitter")
    configs.setup({
      ensure_installed = { "lua", "vim", "html", "css", "javascript", "c", "python" },  -- etc
      sync_install = false,
      auto_install = true,
      highlight = { enable = true, additional_vim_regex_highlighting = false },
      indent = { enable = true },
      -- any further modules e.g. incremental_selection, textobjects, etc
    })
  end,
}


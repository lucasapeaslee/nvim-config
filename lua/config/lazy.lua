-- bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",  -- or “main” depending on version
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Now configure lazy, pointing it to your plugin spec folder(s)
require("lazy").setup({
  spec = {
    -- import all files inside the plugins directory
    { import = "plugins" },
  },
  -- optional: performance tweaks, e.g.
  performance = {
    rtp = {
      reset = false,   -- don’t reset runtimepath (can help with builtin parsers) :contentReference[oaicite:0]{index=0}
    },
  },
})


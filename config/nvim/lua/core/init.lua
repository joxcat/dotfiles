-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.env.PATH .. (is_windows and ";" or ":") .. vim.fn.stdpath "data" .. "/mason/bin"

-- autocmds
local autocmd = vim.api.nvim_create_autocmd
local api = vim.api

-- dont list quickfix buffers
autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

-- Disable statusline in dashboard
autocmd("FileType", {
  pattern = "alpha",
  callback = function()
    vim.opt.laststatus = 0
  end,
})

autocmd("BufUnload", {
  buffer = 0,
  callback = function()
    vim.opt.laststatus = 3
  end,
})

-- Don't auto commenting new lines
autocmd("BufEnter", {
  pattern = "*",
  command = "set fo-=c fo-=r fo-=o",
})

-- store listed buffers in tab local var
vim.t.bufs = vim.api.nvim_list_bufs()

-- autocmds for tabufline -> store bufnrs on bufadd, bufenter events
-- thx to https://github.com/ii14 & stores buffer per tab -> table
autocmd({ "BufAdd", "BufEnter" }, {
  callback = function(args)
    if vim.t.bufs == nil then
      vim.t.bufs = { args.buf }
    else
      local bufs = vim.t.bufs

      -- check for duplicates
      if not vim.tbl_contains(bufs, args.buf) and (args.event == "BufAdd" or vim.bo[args.buf].buflisted) then
        table.insert(bufs, args.buf)
        vim.t.bufs = bufs
      end
    end
  end,
})

autocmd("BufDelete", {
  callback = function(args)
    for _, tab in ipairs(api.nvim_list_tabpages()) do
      local bufs = vim.t[tab].bufs
      if bufs then
        for i, bufnr in ipairs(bufs) do
          if bufnr == args.buf then
            table.remove(bufs, i)
            vim.t[tab].bufs = bufs
            break
          end
        end
      end
    end
  end,
})

local utils = require("tamu8810.utils")
local is_exists = utils.is_exists_plugin

if is_exists("onedark") then
  local palette = require("onedark.palette").dark

  vim.cmd("hi Cursor guifg=" .. palette.fg .. "guibg=" .. palette.fg)

  if is_exists("notify") then
    local colors = {
      error = palette.red,
      warn = palette.yellow,
      info = palette.cyan,
      debug = palette.fg,
      trace = palette.purple,
    }

    vim.cmd("hi NotifyERRORBorder guifg=" .. colors.error)
    vim.cmd("hi NotifyERRORIcon guifg=" .. colors.error)
    vim.cmd("hi NotifyERRORTitle guifg=" ..colors.error)
    vim.cmd("hi NotifyWARNBorder guifg=" .. colors.warn)
    vim.cmd("hi NotifyWARNIcon guifg=" .. colors.warn)
    vim.cmd("hi NotifyWARNTitle guifg=" .. colors.warn)
    vim.cmd("hi NotifyINFOBorder guifg=" .. colors.info)
    vim.cmd("hi NotifyINFOIcon guifg=" .. colors.info)
    vim.cmd("hi NotifyINFOTitle guifg=" .. colors.info)
    vim.cmd("hi NotifyDEBUGBorder guifg=" .. colors.debug)
    vim.cmd("hi NotifyDEBUGIcon guifg=" .. colors.debug)
    vim.cmd("hi NotifyDEBUGTitle guifg=" .. colors.debug)
    vim.cmd("hi NotifyTRACEBorder guifg=" .. colors.trace)
    vim.cmd("hi NotifyTRACEIcon guifg=" .. colors.trace)
    vim.cmd("hi NotifyTRACETitle guifg=" .. colors.trace)
  end

  if is_exists("mini.indentscope") then
    vim.cmd("hi MiniIndentscopeSymbol guifg=" .. palette.blue)
  end
end

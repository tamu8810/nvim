local utils = require("tamu8810.utils")
local is_exists = utils.is_exists_plugin

local maps  = utils.add_to_map_table()

local sections = {
  p = { desc = "Package" },
  s = { desc = "Window" },
  b = { desc = "Buffer" },
  bd = { desc = "Close" },
}

maps.n["<c-;>"] = { "<esc>", desc = "Escape" }
maps.v["<c-;>"] = { "<esc>", desc = "Escape" }
maps.x["<c-;>"] = { "<esc>", desc = "Escape" }
maps.s["<c-;>"] = { "<esc>", desc = "Escape" }
maps.o["<c-;>"] = { "<esc>", desc = "Escape" }
maps.i["<c-;>"] = { "<esc>", desc = "Escape" }
maps.l["<c-;>"] = { "<esc>", desc = "Escape" }
maps.c["<c-;>"] = { "<esc>", desc = "Escape" }
maps.t["<c-;>"] = { "<c-\\><c-n>", desc = "Escape" }
maps.n["<s-u>"] = { "<c-r>", desc = "Redo" }

maps.n["<leader>w"] = { "<cmd>w<cr>", desc = "Save" }
maps.n["<leader>q"] = { "<cmd>q<cr>", desc = "Quit" }

maps.n["<leader>p"] = sections.p
maps.n["<leader>pp"] = { function() require("lazy").home() end, desc = "Plugin Status" }
maps.n["<leader>pi"] = { function() require("lazy").install() end, desc = "Plugins Install" }
maps.n["<leader>ps"] = { function() require("lazy").sync() end, desc = "Plugins Sync" }
maps.n["<leader>pc"] = { function() require("lazy").check() end, desc = "Plugins Check Updates" }
maps.n["<leader>pu"] = { function() require("lazy").update() end, desc = "Plugins Update" }

maps.n["<leader>s"] = sections.s
maps.n["<leader>ss"] = { "<cmd>split<cr>", desc = "Horizontal Split" }
maps.n["<leader>sv"] = { "<cmd>vsplit<cr>", desc = "Vertical Split" }
maps.n["<leader>sd"] = { "<cmd>close<cr>", desc = "Close" }
maps.n["<leader>so"] = { "<cmd>only<cr>", desc = "Only" }
maps.n["<leader>sh"] = { "<c-w>h", desc = "Move Left" }
maps.n["<leader>sj"] = { "<c-w>j", desc = "Move Down" }
maps.n["<leader>sk"] = { "<c-w>k", desc = "Move Up" }
maps.n["<leader>sl"] = { "<c-w>l", desc = "Move Right" }

if is_exists("bufferline") then
  maps.n["<leader>b"] = sections.b
  maps.n["<leader>bh"] = { "<cmd>BufferLineCyclePrev<cr>", desc = "Move Previous" }
  maps.n["<leader>bl"] = { "<cmd>BufferLineCycleNext<cr>", desc = "Move Next" }
  maps.n["<leader>bp"] = { "<cmd>BufferLinePick<cr>", desc = "Pick" }
  maps.n["<leader>bP"] = { "<cmd>BufferLineTogglePin<cr>", desc = "Toggle Pin" }
  maps.n["<leader>bd"] = sections.bd
  maps.n["<leader>bdd"] = { "<cmd>bd<cr>", desc = "Close current" }
  maps.n["<leader>bdh"] = { "<cmd>BufferLineCloseLeft<cr>", desc = "Close Left" }
  maps.n["<leader>bdl"] = { "<cmd>BufferLineCloseRight<cr>", desc = "Close Right" }
  maps.n["<leader>bdo"] = { "<cmd>BufferLineCloseOthers<cr>", desc = "Close Others" }
  maps.n["<leader>bdp"] = { "<cmd>BufferLinePickClose<cr>", desc = "Close Pick" }
end

utils.set_keymaps(maps)

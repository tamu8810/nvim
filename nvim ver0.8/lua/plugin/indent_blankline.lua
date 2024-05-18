local status, ibl = pcall(require, "ibl")
if (not status) then return end

local config = {}

config.indent = {
    char = "▏"
}

config.scope = {
    enabled = false
}

ibl.setup(config)

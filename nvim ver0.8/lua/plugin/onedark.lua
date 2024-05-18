local status, onedark = pcall(require, "onedark")
if (not status) then return end

local config = {}

config.code_style = {
    comments = "none",
    keywords = "none",
    functions = "none",
    strings = "none",
    variables = "none"
}

onedark.setup(config)
onedark.load()

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local groups = {
    editor = augroup("editor", { clear = true }),
    terminal = augroup("terminal", { clear = true }),
}

autocmd("BufWritePre", {
    desc = "Insert newline at end of file if last line is not empty",
    group = groups.editor,
    callback = function()
        if vim.fn.getline("$") ~= "" then
            vim.fn.append("$", "")
        end
    end,
})

autocmd({ "BufWinLeave", "BufWritePost", "WinLeave" }, {
    desc = "Save view with mkview for real files",
    group = groups.editor,
    callback = function(args)
        if vim.b[args.buf].view_activated then
            vim.cmd.mkview({ mods = { emsg_silent = true } })
        end
    end,
})

autocmd("TermOpen", {
    desc = "Switch to insert mode after opening the terminal",
    group = groups.terminal,
    command = "startinsert",
})

autocmd("TermOpen", {
    desc = "Shaping the number line in terminal mode",
    group = groups.terminal,
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.statuscolumn = nil
        vim.opt_local.foldcolumn = "0"
    end,
})


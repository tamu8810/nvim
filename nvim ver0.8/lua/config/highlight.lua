local status, nvim_tree = pcall(require, "nvim-tree")

if status then
    vim.cmd [[ hi NvimTreeIndentMarker guifg=#31353F ]]
end

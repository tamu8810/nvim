set nocompatible

let s:dein_base = '~/.cache/dein'
let s:dein_src  = '~/.cache/dein/repos/github.com/Shougo/dein.vim'
let s:toml_base = '~/AppData/Local/nvim/rc/'

execute 'set runtimepath+=' .. s:dein_src

if dein#load_state(s:dein_base)
	call dein#begin(s:dein_base)

	call dein#add(s:dein_src)
	call dein#load_toml(s:toml_base .. 'denops.toml')
	call dein#load_toml(s:toml_base .. 'ddu.toml')

	if has('nvim')
		call dein#load_toml(s:toml_base .. 'nvim.toml')
	endif

	call dein#end()
	call dein#save_state()
endif

filetype indent plugin on

if has('syntax')
	syntax on
endif

command! DeinInstall call dein#install()
command! DeinRecache call dein#recache_runtimepath()

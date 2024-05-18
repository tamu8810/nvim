let s:dein_base = '~/.cache/dein'
let s:dein_src = '~/.cache/dein/repos/github.com/Shougo/dein.vim'
let s:toml_src = '~/AppData/Local/nvim/toml'

execute 'set runtimepath+=' .. s:dein_src

if dein#load_state(s:dein_base)
	call dein#begin(s:dein_base)

	call dein#add(s:dein_src)
	call dein#load_toml(s:toml_src .. '/denops.toml')
	call dein#load_toml(s:toml_src .. '/ddu.toml')

	call dein#end()
	call dein#save_state()
endif

set number
set tabstop=4
set shiftwidth=4
set ignorecase
set smartcase

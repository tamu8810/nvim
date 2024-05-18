set nocompatible

const s:dpp_base = '~/.cache/dpp/'
const s:dpp_src = '~/.cache/dpp/repos/github.com/Shougo/dpp.vim'
const s:denops_src = '~/.cache/dpp/repos/github.com/vim-denops/denops.vim'

const s:dpp_toml_src = '~/.cache/dpp/repos/github.com/Shougo/dpp-ext-toml'
const s:dpp_lazy_src = '~/.cache/dpp/repos/github.com/Shougo/dpp-ext-lazy'
const s:dpp_installer_src = '~/.cache/dpp/repos/github.com/Shougo/dpp-ext-installer'
const s:dpp_git_src = '~/.cache/dpp/repos/github.com/Shougo/dpp-protocol-git'

const s:dpp_ts_src = '~/AppData/Local/nvim/rc/dpp.ts'

execute 'set runtimepath^=' .. s:dpp_src
execute 'set runtimepath+=' .. s:dpp_toml_src
execute 'set runtimepath+=' .. s:dpp_lazy_src
execute 'set runtimepath+=' .. s:dpp_installer_src
execute 'set runtimepath+=' .. s:dpp_git_src

if dpp#min#load_state(s:dpp_base)
	execute 'set runtimepath^=' .. s:denops_src
	autocmd User DenopsReady
	\ call dpp#make_state(s:dpp_base, s:dpp_ts_src)
endif

filetype indent plugin on

if has('syntax')
	syntax on
endif

command! DdpInstall call dpp#async_ext_action('installer', 'install')
command! DdpUpdate call dpp#async_ext_action('installer', 'update')

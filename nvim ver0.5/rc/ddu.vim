" hook_add {{{
call ddu#custom#patch_global({
\ 'ui': 'ff',
\ 'sources': [
\ 	{'name': 'file_rec'},
\ ],
\ 'sourceOptions': {
\ 	'_': {
\ 		'ignoreCase': v:true,
\ 		'matchers': ['matcher_fzf'],
\ 		'sorters': ['sorter_fzf']
\ 	}
\ },
\ 'filterParams': {
\ 	'matcher_fzf': {
\ 		'highlightMatched': 'Title'
\ 	}
\ },
\ 'kindOptions': {
\ 	'file': {
\ 		'defaultAction': 'open'
\ 	}
\ },
\ 'uiParams': {
\ 	'ff': {
\ 		'startFilter': v:true,
\ 	}
\ }
\ })

nnoremap <silent> <C-p>
			\ <Cmd>call ddu#start({
			\ 'name': 'studio'
			\ })<CR>
" }}}

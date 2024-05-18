" hook_add {{{
autocmd FileType ddu-ff call s:ddu_ff_maps()
function! s:ddu_ff_maps() abort
	nnoremap <buffer> <Esc>
				\ <Cmd>call ddu#ui#do_action('quit')<CR>
	nnoremap <buffer> <C-p>
				\ <Cmd>call ddu#ui#do_action('quit')<CR>
	nnoremap <buffer> <CR>
				\ <Cmd>call ddu#ui#do_action('itemAction')<CR>
	nnoremap <buffer> i
				\ <Cmd>call ddu#ui#do_action('openFilterWindow')<CR>

	nnoremap <buffer> <Space>f
				\ <Cmd>call ddu#ui#do_action('updateOptions', {
				\ 'sources': [{'name': 'file_rec'}]
				\ })<CR>
	nnoremap <buffer> <Space>l
				\ <Cmd>call ddu#ui#do_action('updateOptions', {
				\ 'sources': [{'name': 'line'}]
				\ })<CR>
	nnoremap <buffer> <Space>b
				\ <Cmd>call ddu#ui#do_action('updateOptions', {
				\ 'sources': [{'name': 'buffer'}]
				\ })<CR>
endfunction

autocmd FileType ddu-ff-filter call s:ddu_filter_maps()
function! s:ddu_filter_maps() abort
	inoremap <buffer> <Esc>
				\ <Esc><C-w>j
	nnoremap <buffer> <C-p>
				\ <Cmd>call ddu#ui#do_action('quit')<CR>
	inoremap <buffer> <C-p>
				\ <Esc><Cmd>call ddu#ui#do_action('quit')<CR>
	nnoremap <buffer> <CR>
				\ <Cmd>call ddu#ui#do_action('itemAction')<CR>
	inoremap <buffer> <CR>
				\ <Esc><Cmd>call ddu#ui#do_action('itemAction')<CR>

	inoremap <buffer> <Space>f
				\ <Esc><Cmd>call ddu#ui#do_action('updateOptions', {
				\ 'sources': [{'name': 'file_rec'}]
				\ })<CR>
	inoremap <buffer> <Space>l
				\ <Esc><Cmd>call ddu#ui#do_action('updateOptions', {
				\ 'sources': [{'name': 'line'}]
				\ })<CR>
	inoremap <buffer> <Space>b
				\ <Esc><Cmd>call ddu#ui#do_action('updateOptions', {
				\ 'sources': [{'name': 'buffer'}]
				\ })<CR>
endfunction
" }}}

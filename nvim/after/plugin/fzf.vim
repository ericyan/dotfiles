if exists('g:loaded_fzf')
  let g:fzf_layout = { 'window': 'enew' }
  let g:fzf_colors = {
    \ 'fg':      ['fg', 'StatusLine'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Special'],
    \ 'fg+':     ['fg', 'Normal'],
    \ 'bg+':     ['bg', 'Normal'],
    \ 'hl+':     ['fg', 'Label'],
    \ 'info':    ['fg', 'LineNr'],
    \ 'prompt':  ['fg', 'Title'],
    \ 'pointer': ['fg', 'Label'],
    \ 'marker':  ['fg', 'Special'],
    \ 'spinner': ['fg', 'Comment'],
    \ 'header':  ['fg', 'Comment']
    \ }

  function! FZF(source)
    let a:options = '--reverse --prompt "» "'

    " Show current working directory
    echo fnamemodify(getcwd(), ':~:.')

    return fzf#run(fzf#wrap({ 'source': a:source, 'options': a:options }))
  endfunction

  nnoremap <Leader>f :call FZF('ag --hidden -g ""')<CR>
endif

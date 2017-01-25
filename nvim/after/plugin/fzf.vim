if exists('g:loaded_fzf')
  let g:fzf_layout = { 'window': 'enew' }

  function! FZF(source)
    let a:options = '--reverse --prompt "» "'

    return fzf#run(fzf#wrap({ 'source': a:source, 'options': a:options }))
  endfunction

  nnoremap <Leader>f :call FZF('ag --hidden -g ""')<CR>
endif

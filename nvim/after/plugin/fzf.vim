if exists('g:loaded_fzf')
  let g:fzf_layout = { 'window': 'enew' }

  nnoremap <Leader>f :call fzf#run(fzf#wrap({'source': 'ag --hidden -g ""', 'options': ' --reverse'}))<CR>
endif

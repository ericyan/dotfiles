if exists('g:loaded_fzf')
  let g:fzf_layout = { 'window': 'enew' }

  nnoremap <Leader>f :FZF --reverse<CR>
endif

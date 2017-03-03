if exists('g:loaded_neomake')
  autocmd! BufReadPost,BufWritePost * Neomake
endif

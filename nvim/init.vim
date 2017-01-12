call plug#begin('~/.local/share/nvim/plugged')
  Plug 'ericyan/vim-handy'
  Plug 'vim-airline/vim-airline'
  Plug 'ericyan/vim-ocean'
  Plug 'junegunn/fzf', { 'do': './install --bin' }
call plug#end()

" Let Plug split windows horizontally
let g:plug_window = "split new"

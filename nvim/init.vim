call plug#begin('~/.local/share/nvim/plugged')
  Plug 'ericyan/vim-handy'
  Plug 'vim-airline/vim-airline'
  Plug 'ericyan/vim-ocean'
  Plug 'junegunn/fzf', { 'dir': '~/Workspace/src/github.com/junegunn/fzf' }

  Plug 'tpope/vim-surround'

  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'neomake/neomake'

  Plug 'fatih/vim-go'
  Plug 'lervag/vimtex'
  Plug 'hashivim/vim-terraform'
call plug#end()

" Let Plug split windows horizontally
let g:plug_window = "split new"

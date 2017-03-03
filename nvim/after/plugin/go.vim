" Format with goimports
let g:go_fmt_command = "goimports"

" Always use quickfix list
let g:go_list_type = "quickfix"

" Key bindings
au FileType go nmap <Leader>r <Plug>(go-run)
au FileType go nmap <Leader>t <Plug>(go-test)
au FileType go nmap <Leader>d <Plug>(go-doc)

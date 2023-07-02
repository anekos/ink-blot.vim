augroup InkBlot
  autocmd!
  autocmd BufWritePost * call ink_blot#core#on_buf_write_post()
augroup END


command! -nargs=* InkBlot call ink_blot#core#register_command(<q-args>)
command! -nargs=* InkBlotBuffer call ink_blot#core#register_buffer(bufnr('%'))

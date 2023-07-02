let s:registered_command = v:null
let s:registered_buffer = -1


function! ink_blot#core#on_buf_write_post()
  if s:registered_command == v:null
    echoerr 'No command registered'
    return
  endif

  call ink_blot#core#run_command(s:registered_command)
endfunction


function! ink_blot#core#register_command(command)
  let s:registered_command = a:command
  echomsg 'Registered command: ' . a:command
endfunction


function! ink_blot#core#register_buffer(buffer)
  let s:registered_buffer = a:buffer
  echomsg 'Registered buffer: ' . a:buffer
endfunction


function! ink_blot#core#run_command(command)
  echomsg 'Running command: ' . a:command
  let l:result = systemlist(a:command)

  if 0 <= s:registered_buffer
    call setbufline(s:registered_buffer, 1, l:result)
    return
  endif

  for l:line in l:result
    echomsg l:line
  endfor
endfunction

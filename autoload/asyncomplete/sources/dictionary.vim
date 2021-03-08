function! asyncomplete#sources#dictionary#completor(opt, ctx)
  let l:name = a:opt['name']
  let l:col = a:ctx['col']
  let l:typed = a:ctx['typed']

  let l:kw = matchstr(l:typed, '\w\+$')
  let l:kwlen = len(l:kw)
  let l:startcol = l:col - l:kwlen

  let l:dict_path = &dictionary

  if empty(l:dict_path)
    call asyncomplete#complete(l:name, a:ctx, l:startcol, [])
    return
  endif

  if executable('fzy')
    let l:command = 'cat ' . expand(l:dict_path) . ' | fzy -e ' . l:kw
  else
    let l:command = 'grep ^' . l:kw . ' ' . expand(l:dict_path)
  endif

  let l:words = split(system(l:command), "\n")

  let l:matches = map(l:words, '{"word": v:val, "menu": "[dict]"}')

  call asyncomplete#complete(l:name, a:ctx, l:startcol, l:matches)
endfunction

fun! FactorEvalInput(string)
  execute "normal a" . a:string
  normal `[v`]hd
  return @"
endfun

fun! FactorWrite() range
  if s:factorWrite
    iunmap <ESC>
    augroup factor
      au! InsertLeave <buffer>
    augroup end

    let cursor = getpos(".")
    let s:factorWrite = 0
    let stmt = @"
    let varName = FactorEvalInput(@.)
    if match(varName, "\\s*[a-zA-Z_][a-zA-Z0-9]*") == 0
      let varName = substitute(varName, "\\s+", "", "")
      let varName = substitute(varName, "[^a-zA-Z0-9_].*", "", "")
      execute "normal Ovar " . varName . " = " . stmt . ";"
    endif
    let cursor[1] = cursor[1] + 1
    call setpos(".", cursor)
  endif
endfun

fun! Factor() range
  normal gvd
  normal `<

  let s:factorWrite = 1
  inoremap <silent> <ESC> <ESC>:call FactorWrite()<CR>
  augroup factor
    autocmd!
    autocmd InsertLeave <buffer> call FactorWrite()
  augroup end

  startinsert
endfun

fun! FactorSelect() range
  execute "normal /,\\|)\<CR>hv?,\\|(\<CR>/\\S\<CR>"
endfun

nmap ,f :call FactorSelect()<CR>
vmap ,f :call Factor()<CR>


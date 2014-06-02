" .gvimrc, by Markus Klinga
" most options are already set up in .vimrc!

" set initial size of gvim
set lines=40
set columns=140

" Always show tabline on gvim
set showtabline=2

if exists("+showtabline")
  function! MyTabLine()
    let s = ''
    let t = tabpagenr()
    let i = 1
    while i <= tabpagenr('$')
      let buflist = tabpagebuflist(i)
      let winnr = tabpagewinnr(i)
      let s .= '%' . i . 'T '
      let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
      let s .= i . ':'

	  " add + for tabs that have modified files in them
	  let modified = 0
	  for b in buflist
		  if getbufvar(b, "&modified")
			  let modified += 1
		  endif
	  endfor

	  if modified > 0
		  let s .= '+ '
	  endif

      let s .= ' %*'
      let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
      let bufnr = buflist[winnr - 1]
      let file = bufname(bufnr)
      let buftype = getbufvar(bufnr, 'buftype')
      if buftype == 'nofile'
        if file =~ '\/.'
          let file = substitute(file, '.*\/\ze.', '', '')
        endif
      else
        let file = fnamemodify(file, ':p:t')
      endif
      if file == ''
        let file = '[No Name]'
      endif
      let s .= file
      let i = i + 1
    endwhile
    let s .= '%T%#TabLineFill#%='
    "let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
    return s
  endfunction
  set tabline=%!MyTabLine()
endif

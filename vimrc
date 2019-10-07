" Show lines in hybrid mode
" from: https://jeffkreeftmeijer.com/vim-number/

:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END


" Reducing tab display size 
" from: https://stackoverflow.com/questions/2054627/how-do-i-change-tab-size-in-vim and
" https://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim

:set tabstop=2
:set softtabstop=2
:set shiftwidth=2
:set expandtab
:set textwidth=79        " default wrapping
:set backspace=indent,eol,start
" ^  allow backspacing over everything in insert mode

" Show characters
" from: https://www.reddit.com/r/vim/comments/4hoa6e/what_do_you_use_for_your_listchars/
:set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨


" Automatic Tasks On Save (Anderson)
let g:autoformat_on_save = 0
function! ExternalFormat(command)
  if g:autoformat_on_save
    silent execute('!' . a:command) | edit!
  endif
endfunction

augroup tasks_on_save
  autocmd!
  autocmd BufWritePost *.py call ExternalFormat('black --line-length=79 %')
augroup END

" Disable bell alert
set noeb vb t_vb=

" Anderson config
augroup fix_shiftwidth
  autocmd!
  autocmd BufNewFile,BufRead {*.rst,*.py} setlocal shiftwidth=4 tabstop=4 textwidth=79
  autocmd FileType javascript.jsx setlocal shiftwidth=2 tabstop=2 textwidth=79
  autocmd FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
augroup END

augroup missing_filetypes
  autocmd!
  autocmd BufNewFile,BufRead *.gsl setlocal filetype=gsl
  autocmd BufNewFile,BufRead {*.make,*.mk} setlocal filetype=make noexpandtab
  autocmd BufNewFile,BufRead {*.pylintrc,pylintrc,.coafile} setlocal filetype=cfg
augroup END

augroup set_spell
  autocmd!
  autocmd Filetype {text,markdown,rst} set spell
augroup END

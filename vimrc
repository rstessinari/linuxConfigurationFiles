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
:set shiftwidth=2
:set expandtab

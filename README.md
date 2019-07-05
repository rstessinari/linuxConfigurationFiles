# linuxConfigurationFiles
My personal repository of Linux configuration files (e.g., .vimrc).

# VIM configuration:
- Display lines from: https://jeffkreeftmeijer.com/vim-number/
- Change tab size from: https://stackoverflow.com/questions/2054627/how-do-i-change-tab-size-in-vim
- Show special chars: https://www.reddit.com/r/vim/comments/4hoa6e/what_do_you_use_for_your_listchars/

# Useful commands:
Modify files with vim without open the file:
> vim file -c command

Examples:
> vim file -c 'retab | wq'

> vim file -c 'retab' -c 'wq'

> vim file +retab +wq

# linuxConfigurationFiles
My personal repository of Linux configuration files (e.g., .vimrc).

# Cheat sheets:
- VIM https://devhints.io/vim
- GIT https://github.github.com/training-kit/downloads/github-git-cheat-sheet.pdf
- Literate development (emacs+doom) http://www.howardism.org/Technical/Emacs/literate-devops.html

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

# Windows Subsystem for Linux (WSL)

### From here: https://docs.microsoft.com/en-us/windows/wsl/install-win10

1. Open PowerShell as Administrator and run:
> Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

2. Restart your computer when prompted.

3. Install your Linux Distribution of Choice:
* Ubuntu 18.04: https://www.microsoft.com/store/apps/9N9TNGVNDL3Q

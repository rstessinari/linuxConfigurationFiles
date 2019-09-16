# linuxConfigurationFiles
My personal repository of Linux configuration files (e.g., .vimrc).

# Cheat sheets:
- VIM: https://devhints.io/vim
- GIT: https://github.github.com/training-kit/downloads/github-git-cheat-sheet.pdf
- Literate development (emacs+doom): http://www.howardism.org/Technical/Emacs/literate-devops.html

# VIM configuration:
- Display lines from: https://jeffkreeftmeijer.com/vim-number/
- Change tab size from: https://stackoverflow.com/questions/2054627/how-do-i-change-tab-size-in-vim
- Show special chars: https://www.reddit.com/r/vim/comments/4hoa6e/what_do_you_use_for_your_listchars/

## Useful commands:
Modify files with vim without open the file:
> vim file -c command

Examples:
> vim file -c 'retab | wq'

> vim file -c 'retab' -c 'wq'

> vim file +retab +wq

# Bashrc
1. Disabling alert sound:
> bind 'set bell-style none'


# Windows Subsystem for Linux (WSL)

### From here: https://docs.microsoft.com/en-us/windows/wsl/install-win10

1. Open PowerShell as Administrator and run:
> Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

2. Restart your computer when prompted.

3. Install your Linux Distribution of Choice:
* Ubuntu 18.04: https://www.microsoft.com/store/apps/9N9TNGVNDL3Q

# Installing emacs + doom on Windows + WSL

On the host windows:

1. install vcxsrv: https://sourceforge.net/projects/vcxsrv/

On the wsl linux:

2. sudo add-apt-repository ppa:kelleyk/emacs
3. sudo apt-get update
4. sudo apt-get install emacs26 zsh ssh-askpass
5. download vcxsrv.zsh , emacs.vbs , and emacs.launcher.zsh files from https://github.com/rstessinari/linuxConfigurationFiles
6. change the location of the zsh files in the emacs.launcher.zsh
7. give +x permission to the *.zsh files

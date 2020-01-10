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


# Docker
## Installing Docker:
Check https://docs.docker.com/install/linux/docker-ce/ubuntu/ for changes. (last update: 2019-09-18)
> sudo apt-get update
> sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common

Add Docker’s official GPG key:
> curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

Set up the stable repository:
> sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
> sudo apt-get update

Install the Docker Engine:
> sudo apt-get install docker-ce docker-ce-cli containerd.io

Check if the installation is ok:
> sudo docker run hello-world

# Visual Code
## rulers
https://stackoverflow.com/questions/29968499/vertical-rulers-in-visual-studio-code

VS Code 0.10.10 introduced this feature. To configure it, go to File > Preferences > Settings and add this to to your user or workspace settings:

"editor.rulers": [80,120]

The color of the rulers can be customized like this:

"workbench.colorCustomizations": {
    "editorRuler.foreground": "#ff4081"
}

# Python
## Python Scaffold
install pyscaffold:

"pipx install pyscafold[all]" or "pip3 install pyscafold[all]"

putup --help for options

putup --pre-commit --tox --url GITURL --namespace _NAMESPACE_ --package _PACKAGE_ --force _FOLDER_

follow instructions:

- pip3 install pre-commit

- pre-commit install

- copy the .pre-commit-config.yaml (remove the two black entries if Python version is not at least 3.6)

- pre-commit autoupdate

- pre-commit run --all


## Create venv

python3 -m venv .venv

source .venv/bin/activate

deactivate

## Check installed packages and save them

pip3 freeze > requirements.txt

pip3 install -r requirements.txt

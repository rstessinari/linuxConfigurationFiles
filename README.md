# linuxConfigurationFiles
My personal repository of Linux configuration files, tips, tricks, and personalisation.

# Cheat sheets:
- VIM: https://devhints.io/vim
- GIT: https://github.github.com/training-kit/downloads/github-git-cheat-sheet.pdf
- Literate development (emacs+doom): http://www.howardism.org/Technical/Emacs/literate-devops.html

# VIM 
### Configuration:
- Display lines from: https://jeffkreeftmeijer.com/vim-number/
- Change tab size from: https://stackoverflow.com/questions/2054627/how-do-i-change-tab-size-in-vim
- Show special chars: https://www.reddit.com/r/vim/comments/4hoa6e/what_do_you_use_for_your_listchars/

### Useful commands:
Modify files with vim without open the file:
> vim file -c command

Examples:
> vim file -c 'retab | wq'

> vim file -c 'retab' -c 'wq'

> vim file +retab +wq

### Disable vim bell sounds
```
" Disable bell alert
set noeb vb t_vb=
```

# Linux
### Bashrc
1. Disabling alert sound:
> bind 'set bell-style none'

### SSH without password
a@A:~> ssh-keygen -t rsa

Append a's new public key to b@B:.ssh/authorized_keys and enter b's password one last time (Source: http://www.linuxproblem.org/art_9.html):

a@A:~> cat .ssh/id_rsa.pub | ssh b@B 'cat >> .ssh/authorized_keys'

OR (and better)

a@A:~> ssh-copy-id b@B

### Change the Default Editor From Nano on Ubuntu Linux
> sudo update-alternatives --config editor

### Redo last command but as root
> sudo !!

### Open an editor to run a command
> ctrl+x+e

### Create a ram disk
> sudo mkdir -p /mnt/ram

> sudo mount -t tmpfs tmpfs /mnt/ram -o size=8192M

> sudo umount /mnt/ram

### Don't add command to history (add a leading space before the command)
>  ls -l

### Fix a really long command that you messed up
> fc

### Tunnel with ssh (local port 3337 -> remote host's 127.0.0.1 on port 6379)
> ssh -L 3337:127.0.0.1:6379 root@emkc.org -N

### Quickly create folders
mkdir -p folder/{sub1,sub2}/{sub1,sub2,sub3}

### Intercept stdout and log to file
> cat file | tee -a log | cat > /dev/null

### Exit terminal but leave all processes running
> disown -a && exit


# Windows Subsystem for Linux (WSL)

### From here: https://docs.microsoft.com/en-us/windows/wsl/install-win10

1. Open PowerShell as Administrator and run:
> Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

2. Restart your computer when prompted.

3. Install your Linux Distribution of Choice:
* Ubuntu 18.04: https://www.microsoft.com/store/apps/9N9TNGVNDL3Q

### Installing emacs + doom on Windows + WSL

On the host windows:

1. install vcxsrv: https://sourceforge.net/projects/vcxsrv/

On the wsl linux:

2. sudo add-apt-repository ppa:kelleyk/emacs
3. sudo apt-get update
4. sudo apt-get install emacs26 zsh ssh-askpass
5. download vcxsrv.zsh , emacs.vbs , and emacs.launcher.zsh files from https://github.com/rstessinari/linuxConfigurationFiles
6. change the location of the zsh files in the emacs.launcher.zsh
7. give +x permission to the *.zsh files

### Change terminal colors

Right-click title bar and select "Properties", and follow the steps:
1. select "Screen Text" and note which color box got highlighted
2. select 10th color box where the dark blue color is
3. set rgb values to 59,120,255 (or your favorite blue)
4. select the color box noted in the first step


# Docker
### Installing Docker:
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
### rulers
https://stackoverflow.com/questions/29968499/vertical-rulers-in-visual-studio-code

VS Code 0.10.10 introduced this feature. To configure it, go to File > Preferences > Settings and add this to to your user or workspace settings:

"editor.rulers": [80,120]

The color of the rulers can be customized like this:

"workbench.colorCustomizations": {
    "editorRuler.foreground": "#ff4081"
}

# Python
### Python Scaffold
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


### Create venv

python3 -m venv .venv

source .venv/bin/activate

deactivate

### Check installed packages and save them

pip3 freeze > requirements.txt

pip3 install -r requirements.txt


# Software/Library

### Install Protobuf on Linux

Find the correct protocol buffers version based on your Linux Distro: https://github.com/google/protobuf/releases

wget it

Unzip
> unzip protoc-3.5.1-linux-x86_64.zip -d protoc3

Move protoc to /usr/local/bin/
> sudo mv protoc3/bin/* /usr/local/bin/

Move protoc3/include to /usr/local/include/
> sudo mv protoc3/include/* /usr/local/include/

Optional: change owner
> sudo chown [user] /usr/local/bin/protoc

> sudo chown -R [user] /usr/local/include/google

If some problem happen, try to install these:

> sudo apt-get install autoconf automake libtool curl make g++ unzip


### Install Java and Intellij Idea
Install java sdk

> sudo apt install openjdk-8-jdk

Download Intellij Idea https://www.jetbrains.com/idea/download/#section=linux

> sudo tar -zxvf ideaIC-VERSION.tar.gz -C /opt/

To run it:

> ./opt/ideaIC-VERSION/bin/idea.sh

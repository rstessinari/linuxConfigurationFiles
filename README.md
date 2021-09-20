# linuxConfigurationFiles
My personal repository of Linux configuration files, tips, tricks, and personalisation.

# Cheat sheets:
- VIM: https://devhints.io/vim
- GIT: https://github.github.com/training-kit/downloads/github-git-cheat-sheet.pdf
- TMUX: https://tmuxcheatsheet.com/
- VSCODE: https://code.visualstudio.com/shortcuts/keyboard-shortcuts-windows.pdf
- Literate development (emacs+doom): http://www.howardism.org/Technical/Emacs/literate-devops.html
- CSS resources: https://www.w3schools.com/css/default.asp

# VSCODE
### Favorite extensions:
- Bracket Pair Colorizer 2: https://marketplace.visualstudio.com/items?itemName=CoenraadS.bracket-pair-colorizer-2
- Indent Rainbow: https://marketplace.visualstudio.com/items?itemName=CoenraadS.bracket-pair-colorizer-2
- Auto Rename Tag: https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-rename-tag
- Auto Close Tag: https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-close-tag
- REST Client: https://marketplace.visualstudio.com/items?itemName=humao.rest-client
- Remote - SSH: https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh
- Remote - WSL: https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl
- Python: https://marketplace.visualstudio.com/items?itemName=ms-python.python
- Graphviz (dot) language support for Visual Studio Code: https://marketplace.visualstudio.com/items?itemName=joaompinto.vscode-graphviz
- Material Theme Icons: https://marketplace.visualstudio.com/items?itemName=Equinusocio.vsc-material-theme-icons
- Community Material Theme: https://marketplace.visualstudio.com/items?itemName=Equinusocio.vsc-community-material-theme

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
a@local-hostA:~$ ssh-keygen -t rsa

a@local-host:~$ ssh-copy-id -i ~/.ssh/id_rsa.pub b@remote-host

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

## Connect to Ubuntu using the Remote Desktop software
here: http://c-nergy.be/blog/?p=8952

> sudo apt-get update

> sudo apt-get install xrdp

Install Mate (see bellow)

Add mate-session to file /etc/xrdp/startwm.sh (just before the X11/Xsession line)

### Removing gnome-DE
source: https://askubuntu.com/questions/767577/how-can-i-remove-gnome-desktop-environment-without-messing-unity-de-ubuntu-16

> sudo apt-get remove ubuntu-gnome-desktop

> sudo apt-get remove gnome-shell 

> sudo apt-get remove --auto-remove ubuntu-gnome-desktop

> sudo apt-get purge ubuntu-gnome-desktop

> sudo apt-get purge --auto-remove ubuntu-gnome-desktop

> sudo apt-get autoremove 

### Installing Mate-DE
> sudo apt-get update

> sudo apt-get install mate-core mate-desktop-environment mate-notification-daemon

### Installing VLC and OBS for video streaming
- VLC (Client and Server sides):

> sudo add-apt-repository ppa:videolan/master-daily

> sudo apt update

> sudo apt install vlc qtwayland5

- Allow VLC to run with sudo. Source:

> sudo apt-get install bless

> sudo bless /usr/bin/vlc

Search and change the geteuid string by getppid, save and exit.

- OBS (Client side only):

> sudo add-apt-repository ppa:obsproject/obs-studio

> sudo apt update

> sudo apt-get install obs-studio

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
### Update to a newer version

Install/update repositories
> sudo add-apt-repository ppa:deadsnakes/ppa
> 
> sudo apt-get update
> 
> sudo apt-get install python3.9 

> sudo apt install python3.9-distutils 
> 
> pip3 install --upgrade setuptools
> 
> pip3 install --upgrade pip
> 
> pip3 install --upgrade distlib
>
> sudo apt install python3.9-venv

Change 3.6 with the previous installed version. If this method was used already in the past, just add the newer python version.
> sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1
> 
> sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 2
> 
> sudo update-alternatives --config python3

(optional) Update python alias as well
> sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
> 
> sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.9 2
> 
> sudo update-alternatives --config python

Check if it worked:
> python -V
> 
> python3 -V


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

### OBS next/prev scene plugin

https://obsproject.com/forum/resources/next-scene-and-previous-scene-hotkeys.1018/

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



## Port foward in Linux

https://serverfault.com/questions/125625/how-to-forward-connection-from-one-interface-to-another-under-linux
How to forward connection from one interface to another under linuxI have linux box which has two network interface, eth0, eth1. from eth1 I can access an internal website, say under port 8080. from outside the box, I can't access that network. my question is, is ...serverfault.com
    
sudo iptables -t nat -A PREROUTING -p tcp -d 10.68.48.142 --dport 5010 -j DNAT --to 127.0.0.1:5005
    
sudo iptables -A FORWARD -p tcp -d 127.0.0.1 --dport 5005 -j ACCEPT

# Python
### Print with colours:
Look for ANSI colors. Some sample:
* Black: \u001b[30m
* Red: \u001b[31m
* Green: \u001b[32m
* Yellow: \u001b[33m
* Blue: \u001b[34m
* Magenta: \u001b[35m
* Cyan: \u001b[36m
* White: \u001b[37m
* Reset: \u001b[0m

then, use like this:

```Python
c = [
    "\033[91m",  # Red
    "\033[35m"  # Magenta
]
print(c[0]+'This line is red until here,'+'\033[0m'+' now it is white again.')
```

# Development on Windows
### Install SSL certificates on git
1. Download github certificate (cert.pem) (not the chain) using firefox (check link below on how to do it) and save it to "myfolder"
2. Configure git: 
    > git config --global http.sslCAInfo C:\...\myfolder\cert.pem

source: https://jhooq.com/2-ways-to-fix-ssl-certificate-problem-self-signed-certificate-in-certificate-chain/#git-clone

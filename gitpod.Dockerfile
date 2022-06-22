FROM    archlinux
USER    root
RUN     pacman -Syyu --noconfirm && \ 
        pacman -S sudo bash --noconfirm        
RUN     useradd -l -u 33333 -md /home/gitpod -G wheel -s /bin/bash -p gitpod gitpod && \ 
        sed -i.bkp -e 's/%wheel\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%wheel ALL=NOPASSWD:ALL/g' /etc/sudoers
ENV     HOME=/home/gitpod
WORKDIR $HOME
USER    gitpod

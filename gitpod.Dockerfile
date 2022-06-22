FROM    archlinux
USER    root
RUN     pacman -Syyu --noconfirm && \ 
        pacman -S doas bash --noconfirm        
RUN     groupadd wheel && \ 
        useradd -l -u 33333 -md /home/gitpod -G wheel -s /bin/bash -p gitpod gitpod && \ 
        gpasswd -a gitpod wheel && \ 
        echo "permit nopass keepenv :wheel
        permit nopass keepenv gitpod as root" > /etc/doas.conf
ENV     HOME=/home/gitpod
WORKDIR $HOME
USER    gitpod

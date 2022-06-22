FROM    archlinux
USER    root
RUN     pacman -Syyu --noconfirm && \ 
        pacman -S doas bash --noconfirm        
RUN     echo "permit keepenv nopass :gitpod as root" | tee /etc/doas.conf
ENV     HOME=/home/gitod
WORKDIR $HOME
USER    gitpod

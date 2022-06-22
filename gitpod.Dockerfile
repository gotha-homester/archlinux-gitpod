FROM    archlinux
USER    root
RUN     pacman -Syyu --noconfirm && \ 
        pacman -S doas bash --noconfirm        
RUN     useradd -l -u 33333 -md /home/gitpod -G wheel -s /bin/bash -p gitpod gitpod && \ 
        printf "permit keepenv nopass gitpod as root" | tee /etc/doas.conf
ENV     HOME=/home/gitpod
WORKDIR $HOME
USER    gitpod

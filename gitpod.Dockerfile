FROM    archlinux
USER    root
RUN     pacman -Syyu --noconfirm && pacman -S doas bash --noconfirm
RUN     useradd -md /home/gitpod -G wheel -s /bin/bash -p gitpod gitpod && echo "permit nopass keepenv :wheel" > /etc/doas.conf
ENV     HOME=/home/gitpod
WORKDIR $HOME
USER    gitpod

FROM kalilinux/kali-rolling

RUN apt update;
RUN apt install -y kali-linux-core;
RUN apt install -y metasploit-framework;
RUN apt install -y inetutils-ping;
RUN apt install -y inetutils-tools;
RUN apt install -y wordlists;
RUN apt install -y sqlmap;
RUN apt install -y vim-python-jedi vim-ale;
# essentials
RUN apt install -y ripgrep fd-find bat locate man;

RUN updatedb;

RUN adduser --disabled-password --gecos '' kali; \
    usermod -a -G sudo kali; \
    echo 'kali:kali' | chpasswd;

USER kali
WORKDIR /home/kali

CMD ["/usr/bin/env", "bash"]

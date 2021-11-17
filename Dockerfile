FROM ubuntu:18.04

RUN apt update
RUN apt install unzip
RUN apt-get install openssh-server -y 
RUN useradd -m vps
RUN adduser vps sudo
RUN echo 'vps:Usakhosting1!' | chpasswd
RUN sed -i 's//bin/sh//bin/bash/g' /etc/passwd
RUN service ssh restart 
RUN mkdir -p /var/run/sshd 
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
RUN echo "LD_LIBRARY_PATH=/usr/lib64-nvidia" >> /root/.bashrc
RUN echo "export LD_LIBRARY_PATH" >> /root/.bashrc 

RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
RUN unzip ngrok-stable-linux-amd64.zip
RUN ./ngrok authtoken 1p4KIn23NvQKkeuk9Y0cj45hOUK_4BP4aSeVFdzqws3MsL9rZ
RUN ./ngrok tcp 22

FROM dorowu/ubuntu-desktop-lxde-vnc

RUN apt update
RUN apt install unzip
RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
RUN unzip ngrok-stable-linux-amd64.zip
RUN ./ngrok authtoken 1p4KIn23NvQKkeuk9Y0cj45hOUK_4BP4aSeVFdzqws3MsL9rZ
RUN ./ngrok http 80

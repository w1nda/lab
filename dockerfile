FROM debian:10

COPY git.config.sh /etc/git.config.sh

# setup work directory and password
RUN useradd wind && \
    echo 'wind:wind' | chpasswd && \
    mkdir -m 777 /home/wind
RUN echo 'root:root' | chpasswd

# setup apt source
RUN apt-get update

# setup softwares
# -y means yes to all when install them
RUN apt-get install git vim sudo -y

# setup vscode server dependence
RUN apt-get install libc6 libstdc++6 python-minimal ca-certificates tar openssh-server curl wget -y

RUN apt-get install python3 python3-pip -y

RUN pip3 install ptf scapy

# initial git
RUN bash /etc/git.config.sh

# initial user groups
RUN  /usr/sbin/usermod -aG sudo wind

# start ssh and hold container on
CMD service ssh start && sleep infinity

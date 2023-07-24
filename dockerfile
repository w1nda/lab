FROM debian:10

COPY apt.https.source /etc/apt.https.source
COPY apt.http.source /etc/apt.http.source
COPY git.config.sh /etc/git.config.sh

# RUN  apt-get install apt-transport-https ca-certificates -y && \
#        cat /etc/apt.https.source > /etc/apt/sources.list && \
#        apt-get update

# setup work directory and password
RUN useradd wind && \
    echo 'wind:wind' | chpasswd && \
    mkdir -m 777 /home/wind
RUN echo 'root:root' | chpasswd

# setup apt source
RUN cat /etc/apt.http.source > /etc/apt/sources.list && \
    apt-get update

# setup softwares
# -y means yes to all when install them
RUN apt-get install git vim sudo -y

# setup xv6 lab dependence
RUN apt-get install build-essential gdb-multiarch qemu-system-misc gcc-riscv64-linux-gnu binutils-riscv64-linux-gnu -y

# setup vscode server dependence
RUN apt-get install libc6 libstdc++6 python-minimal ca-certificates tar openssh-server curl wget -y

# initial git
RUN bash /etc/git.config.sh

# initial user groups
RUN  /usr/sbin/usermod -aG sudo wind

# start ssh and hold container on
CMD service ssh start && sleep infinity
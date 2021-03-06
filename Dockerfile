FROM       ubuntu:18.04
MAINTAINER LeeBin "https://github.com/vovanduc"

RUN apt-get update

RUN apt-get install -y python

RUN apt-get install -y nano

RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN mkdir /root/.ssh

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    rm -rf /var/lib/apt/lists/lock

EXPOSE 22

CMD    ["/usr/sbin/sshd", "-D"]
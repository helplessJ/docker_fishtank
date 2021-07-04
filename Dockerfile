FROM ubuntu

LABEL MAINTAINER "helplressJ <johndoe@example.com>"
LABEL SOURCE = "https://github.com/helplessJ/docker_fishtank"

#ENV DEBIAN_FRONTEND=noninteractive

RUN yes | unminimize && \
    apt-get -y --no-install-recommends upgrade && \
    apt-get install -y \
    make \
    libcurses-perl \
    wget && \
    cd /tmp && \
    wget https://cpan.metacpan.org/authors/id/K/KB/KBAUCOM/Term-Animation-2.6.tar.gz && \
    tar -zxvf Term-Animation-2.6.tar.gz && \
    cd Term-Animation-2.6 && \
    perl Makefile.PL && make && make test && make install && \
    cd /tmp && \
    wget https://robobunny.com/projects/asciiquarium/asciiquarium.tar.gz && \
    tar -zxvf asciiquarium.tar.gz && \ 
    cd asciiquarium_1.1/ && \
    cp asciiquarium /usr/local/bin && \
    chmod 0755 /usr/local/bin/asciiquarium

ENTRYPOINT ["/usr/local/bin/asciiquarium", "/bin/bash"]
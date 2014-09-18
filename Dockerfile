FROM debian:wheezy
MAINTAINER Philip Southam <philip@eml.cc>
ENV DEBIAN_FRONTEND noninteractive
RUN \
  apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db &&\
  echo 'deb http://sfo1.mirrors.digitalocean.com/mariadb/repo/10.0/debian wheezy main' > /etc/apt/sources.list.d/mariadb.list &&\
  apt-get update && \
  apt-get upgrade -y &&\
  apt-get install --no-install-recommends -y mariadb-server &&\
  apt-get clean &&\
  sed --in-place 's/trap/#trap/g' /usr/bin/mysqld_safe

VOLUME ["/etc/mysql", "/var/lib/mysql", "/var/run/mysqld"]
EXPOSE  3306/tcp

CMD ["/usr/bin/mysqld_safe"]

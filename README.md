# psoutham/mariadb

MariaDB 10.0.x on debian:wheezy, about 300MB smaller than dockerfile/mariadb


## Getting started

If you want to initialize the db on a local disk (say an mounted ec2 volume), you would install a fresh db in the first step, then secure the root user and add any users you need (at the mysql prompt)

```shell
docker run --name=mariadb --rm -it -v /mnt/mysql/data:/var/lib/mysql -v /mnt/mysql/etc:/etc/mysql:ro psoutham/mariadb mysql_install_db
docker run --name=mariadb --rm -it -v /mnt/mysql/data:/var/lib/mysql -v /mnt/mysql/etc:/etc/mysql:ro psoutham/mariadb /bin/sh -c "(mysqld_safe&) && mysqladmin --silent --wait=30 ping || exit 1 && mysql_secure_installation && mysql && mysqladmin shutdown && sleep 5"
```

## Running

```shell
docker run --name=mariadb --rm -it -v /mnt/mysql/data:/var/lib/mysql -v /mnt/mysql/etc:/etc/mysql -p 3306:3306 psoutham/mariadb
```


## Shut it down

```shell
docker run --volumes-from=mariadb:ro --rm -it --name mysqladmin_client psoutham/mariadb /bin/sh -c 'mysqladmin -u admin_user -p shutdown'
```

_This project has been created as part of the 42 curriculum by @tatahere_

#	Description.

**Inception** as part of the ecole 42 curiculum serves broaden knowlage on systems administration by using docker and docker compose.

It consist on setting up a small infrastrure of containers under specific rules. That will serve a wordpress site.
It will be formed by the next containers:
 -  A container for the maridb that will store all the sql information needed by the wordpress.
 -  A container for the wordpress php-fpm that will execute and handel the runing of the php code of the wordpress site.
 -  A container for the nginx for serving the page to users and adding a tls2 or tls3 to the page.

Some of the constrains are:
 -	All the containers will be build from the penultimate lts version of devian or alpine. It is forbiden to use ready made docker images for services like nginx or mariaDB.
 -	It is forbiden to use hacky patches to stop the container from stoping like : `tail -f`, `bash`, `sleep infinity`, `while true`.
 -	It is forbiden to use `network: host` or `--link`, you must create a docker network that only exposes the port 443 to the outside throug the nginx container.
 -	It is forbiden to store any credentials or API keys on docker files or anywere on the repository.
 -	It 



#	Instructions.

#	IA usage.

No IA was used during research or development of this project.

#	Resourses.

https://wiki.alpinelinux.org

https://docs.docker.com/

https://mariadb.org/documentation/

https://stackoverflow.com/questions/16287559/mysql-adding-user-for-remote-access

https://serverfault.com/questions/333321/executing-a-command-as-a-nologin-user

https://www.baeldung.com/ops/docker-container-shell

https://gist.github.com/extremecoders-re/e8fd8a67a515fee0c873dcafc81d811c

https://wiki.alpinelinux.org/wiki/Docker

https://www.qemu.org/docs/master/system/invocation.html

https://dev.to/franzwong/mount-share-folder-in-qemu-with-same-permission-as-host-2980

https://kb.shells.com/tutorials/Alpine_Linux_Latest/WordPress/

https://linuxconfig.org/bash-scripting-tutorial-for-beginners

https://developer.wordpress.org/cli/commands/cli/

#	notes.

##	making the mariadb run on alpine.

making a daemon that runs:
- install with apk mariadb and su_exec
- run the command of `mariadb-install-db --user=mysql --datadir=/var/lib/mysql`
- create the file of /run/mysqld and transfer ownership of it to mysql user and group.
- now you can run mariadbd to have the program runing.

giving permisions to acces the database form outside.
- modify the configfile to allow connections from outside.
- create the user for accessing the database.



to use the virtual machine run the next command.
```
    qemu-system-x86_64 -m 4096 -cpu host -smp cores=4 -device e1000,netdev=mynet0 -netdev user,id=mynet0,hostfwd=tcp::8080-:22 -drive file=alpine.qcow2 -display gtk -enable-kvm -virtfs local,path=shared_dir,mount_tag=shared,security_model=mapped-xattr
```
to mount the shared folder do the next command on the virtual machine.
```
	mount -t 9p -o trans=virtio,version=9p2000.L shared /mnt/shared
```

##  making the wordpress run on alpine.

install the next pacages:
    - mariadb-client
    - curl
    - php
    - php-phar
    - php-mysqli

install wordpress:
    - curl -O https://wordpress.org/latest.tar.gz
    - tar -xf 

install wp-cli:
    - curl 


#   todo list.

- [x] make the database accessible from outside.
- [x] create a docker compose file for executing this without doing docker run.
- [x] add a .env.
- [x] handel correctly any secrets.
- [x] add persistence to the database.










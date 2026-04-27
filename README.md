_This project has been created as part of the 42 curriculum by @tatahere_

#	Description.

**Inception** as part of the ecole 42 curriculum serves to broaden knowledge of systems administration by using docker and docker compose.

It consists on setting up a small infrastucture of containers under specific rules. That will serve a WordPress site.
It will be formed by the next containers:
 -  A container for the MariDB that will store all the SQL information needed by WordPress.
 -  A container for the WordPress PHP-FPM that will execute and handle the running of the PHP code of the WordPress site.
 -  A container for the nginx for serving the page to users and adding a tls2 or tls3 to the page.

Some of the constraints are:
 -	All the containers will be built from the penultimate LTS version of Devian or alpine. It is forbidden to use ready-made docker images for services like nginx or MariaDB.
 -	It is forbidden to use hacky patches to stop the container from stopping like : `tail -f`, `bash`, `sleep infinity`, `while true`.
 -	It is forbidden to use `network: host` or `--link`, you must create a docker network that only exposes the port 443 to the outside through the nginx container.
 -	It is forbidden to store any credentials or API keys on docker files or anywhere on the repository.

## Why chose Docker against virtual machines?

Virtual machines virtualize all the hardware, allowing more customization, at the expense of a more bloated and slower setup. Containers skip needing to virtualize all of this and only virtualize the software layers, making them smaller and faster for execution and on development time.

## Why chose secrets against environment variables?

Secrets allows for a simpler and easier management of sensitive information, allowing .env files to be included that don't hold any sensitive information.

## Why chose docker network against host network?

The docker network provides isolation for containers, allowing them to have multiple containers binding to the same ports and allowing better management of the network with network namespaces.

## Why chose docker volumes against bind moints?

Docker volumes are managed by docker, making it easier to handle and use. Bind mounts require more work.

#	Instructions.

To be able to run this project on the computer on the 42 campus, you will need a virtual machine that has installed docker and docker compose and any other dependencies that you might need.
I personally use a VM running on QEMU that has an installation of alpine.

I first create the disk image with.
```
    qemu-img create -f qcow2 [file] 40G
```

And run the machine for the first time using this.
```
    qemu-system-x86_64 \
                -m 4096 -cpu host -smp cores=4 \
                -enable-kvm \
                -display gtk-drive \
                file=alpine.qcow2 \
                -boot d -cdrom ubuntu-22.04.iso
```

And after the alpine installation, I ran it with.
```
    qemu-system-x86_64 \
                -m 4096 -cpu host -smp cores=4 \
                -enable-kvm \
                -display gtk-drive \
                file=alpine.qcow2 \
                -device e1000,netdev=mynet0 -netdev user,id=mynet0,hostfwd=tcp::8080-:22
```

I forward the 8080 port to 22 to be able to ssh into the VM from my host.

And then I install anything that is required in the VM, like: git, docker, vim, etc.

For further instructions, refer to:
 -  [**USER_DOC.md**](./USER_DOC.md) - For end-users/administrators: setup, access, and service overview.
 -  [**DEV_DOC.md**](./DEV_DOC.md) — For developers: environment setup, Makefile commands, and data persistence.

#   Resources.

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

https://www.reddit.com/r/docker/comments/x3c71s/docker_best_practice_host_or_bridge_network/

##	IA usage.

No IA was used during research or development of this project.


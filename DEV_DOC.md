# USER_DOC.md — Developer Documentation

## Set up the environment.

### .env

It is important to have the SITE_URL set to the domain where the site is being hosted.

### Secrets

All credentials of users are stored in secrets. 
You need to provide all of these files inside the secret's folder:
 -  MARIADB_PASSWORD
 -  MARIADB_USER
 -  WP_ADMIN_USER
 -  WP_ADMIN_PASSWORD
 -  WP_ADMIN_EMAIL
 -  WP_USER
 -  WP_USER_PASSWORD
 -  WP_USER_EMAIL

### Hosts

You should edit the /etc/hosts file to contain the domain name bind to a network interface usually  127.0.0.1.

## Useful command for handling the docker compose.


Run the make rules from the root of the repository and the docker commands from the srcs folder.

To build. 
For the docker command, make sure you have set up a .build.env with all the secrets in each service folder.
```
    make build
```
```
    dokcer compose build
```

To run.
```
    make up
```
```
    dokcer compose up
```

To monitor the running containers.
```
    make ps
```
```
    dokcer ps
```

To stop.
```
    make stop
```
```
    dokcer compose stop
```

To clean.
```
    make down
```
```
    dokcer compose down
```

And for a more thorough clean.
```
    make fclean
```
```
    dokcer rm -f $(docker ps -aq)
    dokcer image rm -f $(docker image ls -aq)
    dokcer volume rm -f $(docker volume ls -q)
	docker volume prune -af
	docker system prune -af
```

To inspect a container.
```
    docker exec -it [container name] sh
```

## volume storage.

Volumes are stored locally in the next folders:
 -  mariadb: /home/tatahere/data/mariadb
 -  wordpress: /home/tatahere/data/wordpress


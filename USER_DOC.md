# USER_DOC.md — User Documentation

## Project description.


This project builds and runs a series of containers using as a base an alpine image.
Each container runs a service. The services run will be:
 -   MariaDB, which will store all the SQL information needed by WordPress.
 -   WordPress PHP-FPM, which will execute and handle the running of the PHP code of the WordPress site.
 -   nginx, which will serve the page to users and adding a tls2 or tls3 to the page.

## Set up the environment.

### Secrets

All credentials of users are stored in secrets.
If you want to modify them then, just change the contents of the next files in the secret's folder:
 -  MARIADB_PASSWORD
 -  MARIADB_USER
 -  WP_ADMIN_USER
 -  WP_ADMIN_PASSWORD
 -  WP_ADMIN_EMAIL
 -  WP_USER
 -  WP_USER_PASSWORD
 -  WP_USER_EMAIL

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

### Accessing and managing the WordPress site.

 -  WordPress site: [https://tatahere.42.fr](https://tatahere.42.fr)
 -  WordPress admin page : [https://tatahere.42.fr/wp-admin](https://tatahere.42.fr/wp-admin)


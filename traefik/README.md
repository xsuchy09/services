# Traefik for local development

This repository can be used for local development and root of all projects which you can have in one local traefik.

## Installation

1. Create a `.env` file from the `.env.dist` file.
2. Set the environment variables in `.env` file.
3. (Optional) If you want to use [Taskfile](https://taskfile.dev/) create a `.task-env`
   from the `.task-env.dist` file.
4. Create own `docker-compose.override.yml` if you need own specific config. If you
   are using [Taskfile](https://taskfile.dev/) change the env variable `DOCKER_COMPOSE_FILE`
   in the `.task-env` file if you need. See
   [How to share Compose configurations between files and projects](https://docs.docker.com/compose/extends)
   for more info.
5. Use [mkcert](https://github.com/FiloSottile/mkcert) to generate yours certificates for your domains.
6. Generate certificate for your traefik domain which you set in `.env` file (default `traefik.loc`, replace it with 
   yours if you changed it).
   ```shell
   $ mkcert -cert-file certs/cert.pem -key-file certs/key.pem "traefik.loc"
   ```
7. Run containers with [Taskfile](https://taskfile.dev/):
   ```shell
   $ task docker:up
   ```
   or [Docker Compose](https://docs.docker.com/compose) (ad 4. with `-f docker-compose.override.yml`)
   ```shell
   $ docker-compose up -d
   ```
8. Go to [https://traefik.loc](https://traefik.loc) (or yours domain which you set in `.env` file).
9. When you will develop new project:
   1. Choose domain/s for new project,
   2. generate certificates for all domains which you will need with `mkcert` (add domains to the command above),
      ```shell
      $ mkcert -cert-file certs/cert.pem -key-file certs/key.pem "traefik.loc" "other.domain" "another.domain"
      ```
   4. add domains into your `hosts` file,
   5. config domains at docker-compose services in your project with labels (add projects to network `traefik`).

## Use with Taskfile

[Taskfile](https://taskfile.dev) helps you easily call basic operations with simple commands.

   ```sh
   $ task docker:up
   ```

You can look at all commands in the [run folder](./run).

## Manage domains

You can use `config.sh` script to add new domains into traefik. Don't forget to add these domains into your `hosts` file.

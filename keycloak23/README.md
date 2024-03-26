# Keycloak Docker

## Installation

1. Create a `.env` from the `.env.dist` file.

2. Set the environment values in `.env` file.

3. (Optional) If you want to use [Taskfile](https://taskfile.dev), create a `.task-env` from the `.task-env.dist` file.

4. (Optional) If you need to change `docker-compose.yml`, create `docker-compose.override.yml` file
   from `docker-compose.yml`.
   For use with Taskfile, change the env variable `DOCKER_COMPOSE_FILE` in the `.task-env` file.
   See [How to share Compose configurations between files and projects](https://docs.docker.com/compose/extends) for more info.

5. Run containers with [Taskfile](https://taskfile.dev):
   ```sh
   $ task docker:up
   ```
   or [Docker Compose](https://docs.docker.com/compose) (ad 4. with `-f docker-compose.override.yml`)
   ```sh
   $ docker-compose up -d
   ```

## Use with Taskfile

[Taskfile](https://taskfile.dev) helps you easily call basic operations with simple commands.

```sh
$ task docker:up
```

| Command                | Action        |
| ---------------------- |:-------------:|
| `docker:up`            | project start |
| `docker:down`          | project stop |
| `docker:restart`       | project restart |
| `docker:update`        | project update and restart |
| `docker:ps`            | project status |
| `keycloak:sh`          | application container shell |
| `keycloak:docker-logs` | shows application container logs |

You can look at all commands in the [run folder](./run).

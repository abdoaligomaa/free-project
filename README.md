# rentall/backend


## Get started

Use any minor version of Node v16.
> Use [nvm](https://github.com/nvm-sh/nvm) for Node version management

```bash
# start dev server
yarn dev

# build for production
yarn build

# start production server (after build)
yarn start
```

### Build & Run Docker Image
```bash
# build docker image
docker build -t rentall/backend .

# start docker container - Linux
docker run --network="host" rentall/backend

# start docker container - macOS
docker run -p 5000:5000 rentall/backend
```
> **Note for macOS users:** set the database host to `host.docker.internal` which will map to `127.0.0.1` on your host.
> Learn more about the issue on [this Stackoverflow question](https://stackoverflow.com/questions/24319662/from-inside-of-a-docker-container-how-do-i-connect-to-the-localhost-of-the-mach).
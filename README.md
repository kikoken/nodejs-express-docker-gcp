# NODEJS APP DOCKERIZED AND DEPLOY IN GCP

This project it is a simple express rest application that only one endpoint called /ping.
created in ES6 and docker setup image configuration.
This docker image is for deployment in GCP enviroment using Cloud Build


## PREREQUISITES
- nodejs
- npm
- docker
- GCP SDK

## LOCAL RUN

Execute the bash file for generate the bundle and docker image
```bash
./build.sh
```
Next run the container
```bash
docker run -d -p 8080:4000 app-name:latest
```
# NODEJS APP DOCKERIZED AND DEPLOY IN GCP

This project it is a simple express rest application that have only one endpoint called /ping.
created in ES6 and docker setup image configuration.
This docker image is for deployment in GCP enviroment using Cloud Run


## PREREQUISITES
- nodejs
- npm
- docker
- GCP SDK
- Project in GCP

## LOCAL RUN

Execute the bash file for generate the bundle node app and docker image
```bash
./build.sh
```
Next run the container
```bash
docker run -d -p 8080:4000 app-name:latest
```

## DEPLOY GCP CONTAINER REGISTRY  

> Remember create your project in GCP and activate CONTAINER REGISTRY

When just ready your docker images, then deploy this in Contanier registry used:
```bash
docker tag <images_name> gcr.io/<YOUR_PROJECT_ID>/<image_name>
docker push gcr.io/<YOUR_PROJECT_ID>/<image_name>
```

> the image name can be changed in build.sh

## RUN IN CLOUD RUN
Select your images in CONTAINER REGISTRY and select RUN CLOUD RUN,
assigned name for the service and don't remember check option for allow invocations



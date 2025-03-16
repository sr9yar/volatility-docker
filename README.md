# volatility-docker

A docker image with volatility 2 and 3



## Run a single container

```
docker build -t custom-volatility .
sudo docker run --name custom-volatility -v "$(pwd)/data:/data" -it custom-volatility /bin/bash
```



## Start with docker compose

```
docker stop $(docker ps -aq) ;

docker compose up -d ;
docker exec -it custom-volatility bash ;

```



## Removal
```
docker stop custom-volatility ; 
docker rm custom-volatility ; docker rmi custom-volatility-image ; 

```


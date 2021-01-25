docker-compose --help
docker-compose up --help

#==================================== Build and Run all Containers ======================
# run at foreground and show logs of STDOUT and STDERROR
# will build image and create container if it is not exist => run docker-compose.yml at "." folder
docker-compose up
# -d: detach = run at background, dont show STDOUT and STDERROR
docker-compose up -d 

# -f: file
docker-compose -f 1_docker-compose_staticData.yml up
docker-compose -f 2_docker-compose_routingProxy.yml up

# ===================================== Stop and remove container ========================= 
# remove all: container, networks
docker-compose -f 2_docker-compose_routingProxy.yml down

# remove all containers
docker-compose -f 2_docker-compose_routingProxy.yml rm

# ==================================== remove all =============================================
# --rmi: remove images
# -v: remove volumes
docker-compose down --rmi all  -v
docker-compose -f 2_docker-compose_routingProxy.yml down --rmi all  -v

#====================================  rebuild and run all containers =======================
# cach 1 (ok): xoa Image và container can rebuild di va chay lenh "docker-compose up" sẽ build lại image và run container

# cach 2 (not good): build lai toan bo
#  --force-recreate    Recreate containers even if their configuration and image haven't changed.
#  --build             Build images before starting containers.
docker-compose up --force-recreate --build

# cach 3 (not good): chi build Image can thay doi
# <service_name> in docker-compose.yml 
docker-compose up --force-recreate --build  <service_name>

#====================================== show images ========================
docker-compose images

#====================================== show containers ========================
# show all containers of docker-compose
docker-compose ps
docker-compose -f 2_docker-compose_routingProxy.yml ps

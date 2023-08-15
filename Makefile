build : 
	cd srcs/ && docker-compose up --build

stop : 
	cd srcs/  && docker-compose down --remove-orphans

clean :
	srcs/helper.sh && \
	docker stop $$(docker ps -qa) && \
	docker rm $$(docker ps -qa) && \
	docker rmi -f $$(docker images -qa) && \
	docker volume rm $$(docker volume ls -q)
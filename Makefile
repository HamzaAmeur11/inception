build : 
	cd srcs/ && ./helper.sh && docker compose up --build

stop : 
	cd srcs/  && docker compose down --remove-orphans && ./helper.sh
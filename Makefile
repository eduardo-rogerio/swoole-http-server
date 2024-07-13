CONTAINER_NAME=swoole-http-server 

help: ## Print help.
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

up: ## roda o comando  compose up
	@docker compose up

run: ## Inicia o Contariner
	@docker run -id --name $(CONTAINER_NAME) -v .:/var/www/html -p 82:9501 $(CONTAINER_NAME) 

ps: ## Show containers
	@docker container ps

start-swoole: ## inicia o servidor swoole.
	@echo "Running: docker exec -it $(CONTAINER_NAME) php index.php start"
	@docker exec $(CONTAINER_NAME) /bin/bash -c "php index.php start"

stop-swoole: ## exec
	@docker exec $(CONTAINER_NAME) /bin/bash -c "php index.php stop" 

build: ## build containers
	@docker build --no-cache -t $(CONTAINER_NAME) .

stop: ## stop containers
	@docker stop $(CONTAINER_NAME)

destroy: ## destroy
	@docker rm -vf $(CONTAINER_NAME)

composer: ## roda o composer
	@docker exec $(CONTAINER_NAME) /bin/bash -c "composer install"

fresh: stop destroy build run


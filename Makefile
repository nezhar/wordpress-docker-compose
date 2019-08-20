.DEFAULT_GOAL := help

help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

up: ## Up application
	@echo Start docker-compose ;\
	docker-compose -f docker-compose.yml up -d
	@echo

down: ## Down application
	@echo Stop docker-compose ;\
	docker-compose -f docker-compose.yml down
	@echo

ps: ## Status containers
	@docker-compose -f docker-compose.yml ps

logs: ## Logs
	@docker-compose -f docker-compose.yml logs --follow

default: help

init:
	./scripts/clone.sh

sync:
	./scripts/sync.sh

status:
	@./scripts/foreach.sh "git rev-parse --abbrev-ref HEAD"

build:
	@./scripts/build.sh

create-db:
	@./scripts/create_db.sh

migrate-db:
	@./scripts/create_db.sh migrate

run-api:
	docker-compose pull && docker-compose up api

run:
	docker-compose pull && docker-compose up

reset-db:
	docker-compose stop api && docker-compose run api reset-database.sh

# Delete old images
clean-docker-images:
	-docker rmi $$(docker images | grep "none" | awk '/ / { print $3 }') 2>/dev/null

# Delete old containers
clean-docker-containers:
	-docker rm $$(docker ps -qa --no-trunc --filter "status=exited") 2>/dev/null

clean-docker: clean-docker-containers clean-docker-images
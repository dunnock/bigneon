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

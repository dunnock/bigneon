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
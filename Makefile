init:
	./scripts/clone.sh

sync:
	./scripts/sync.sh

status:
	@./scripts/foreach.sh "git rev-parse --abbrev-ref HEAD"

build:
	@./scripts/build.sh
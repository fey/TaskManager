docker-build:
	docker build -t task-manager .

docker-bash:
	docker run -it -v $(CURDIR):/task_manager task-manager bash

compose-build:
	docker-compose build

compose-install:
	docker-compose run --rm web bash -c "bundle install"

compose-bash-service-ports:
	docker-compose run --rm --service-ports web /bin/bash

compose-bash:
	docker-compose run --rm web /bin/bash

compose-migrate:
	docker-compose run --rm web bash -c "rails db:create db:migrate"

compose-lint-fix:
	docker-compose run --rm web bash -c "make lint-fix"

compose-lint:
	docker-compose run --rm web bash -c "make lint"

lint-fix:
	bundle exec rubocop -a

lint:
	bundle exec rubocop

start:
	docker-compose up

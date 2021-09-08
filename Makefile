docker-build:
	docker build -t task-manager .

docker-bash:
	docker run -it -v $(CURDIR):/task_manager task-manager bash

compose-build:
	docker-compose build

compose-install:
	docker-compose run --rm web bash -c "make install"

compose-bash-service-ports:
	docker-compose run --rm --service-ports web /bin/bash

compose-bash:
	docker-compose run --rm web /bin/bash

compose-lint-fix:
	docker-compose run --rm web bash -c "make lint-fix"

compose-lint:
	docker-compose run --rm web bash -c "make lint"

install:
	bundle install
	yarn

lint-fix:
	bundle exec rubocop -a

lint:
	bundle exec rubocop

lint-js-fix:
	yarn run lint-fix

lint-js:
	yarn run lint

lint-all: lint lint-js

lint-fix-all: lint-fix lint-js-fix

compose:
	docker-compose up

start:
	bundle exec rails s -b '0.0.0.0' -p 3000

test:
	rails test

.PHONY: test

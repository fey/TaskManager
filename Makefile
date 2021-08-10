docker-build:
	docker build -t task-manager .

docker-bash:
	docker run -it -v $(CURDIR):/task_manager task-manager bash

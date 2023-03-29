DIR := $(shell pwd)
MAKEFILE := $(lastword $(MAKEFILE_LIST))
PROJECT_NAME := affiliates-wordpress-dev
DC := docker compose -p $(PROJECT_NAME)
D := docker
UNAME := $(shell uname)
WHOAMI := $(shell whoami)
WHOAMI_GROUP := $(shell id -g $(WHOAMI))
# sudo or sudon't (optional commands)
SUDO := $(if $(filter $(shell uname),Linux),-sudo,:)

copy-ca-cert:
	@$(D) cp $(PROJECT_NAME)-caddy-1:/data/caddy/pki/authorities/local/root.crt /tmp/affiliates-wordpress-dev.root.crt
	@echo "CA Certificate copied to /tmp/affiliates-wordpress-dev.root.crt. On MacOS import this into keychain and trust in the keychain app. On Linux import this in your browser settings."

# DOCKER STUFF

up:
	$(DC) up -d $(service)

up-attach:
	$(DC) up $(service)

rebuild:
	$(DC) up --build -d $(service)

build:
	$(DC) build $(service)

start:
	$(DC) start $(service)

restart:
	$(DC) restart $(service)

down:
	$(DC) down $(service)

stop:
	$(DC) stop $(service)

rm:
	$(DC) rm -f $(service)

logs:
	$(DC) logs --tail=200 -f $(service)

error-logs:
	$(D) logs --tail=200 -f $(PROJECT_NAME)-$(service)-1 1>/dev/null

shell ?= sh
sh:
	$(D) exec -it $(PROJECT_NAME)-$(service)-1 $(shell)

debug:
	$(DC) run --rm --service-ports odoo-14

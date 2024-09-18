.PHONY: destroy clean validate deploy

all: deploy

deploy: validate
	@echo 'Deploying Lab...'
	vagrant up

destroy:
	@echo 'Destroying Lab...'
	vagrant destroy -f

clean:
	@echo 'Cleaning Lab...'
	rm -rf .vagrant

validate:
	vagrant validate

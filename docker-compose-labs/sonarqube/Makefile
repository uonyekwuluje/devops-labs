down:
	docker-compose down
	sudo rm -Rf pgdata/*
	sudo rm -Rf sonarqube_data/*  
	sudo rm -Rf sonarqube_extensions/*
	sudo rm -Rf sonarqube_logs/*
	docker volume rm sonarqube_postgresql
	docker volume rm sonarqube_postgresql_data
	docker volume rm sonarqube_sonarqube_conf
	docker volume rm sonarqube_sonarqube_data
	docker volume rm sonarqube_sonarqube_extensions
	docker volume rm sonarqube_sonarqube_logs

up:
	docker-compose up -d --force-recreate --remove-orphans	

status:
	docker-compose ps	

create:
	CHROME_REPLICAS=1 FIREFOX_REPLICAS=1 docker-compose up -d 

recreate:
	CHROME_REPLICAS=3 FIREFOX_REPLICAS=3 docker-compose up -d --force-recreate --remove-orphans

check:
	docker-compose ps

delete:
	CHROME_REPLICAS=0 FIREFOX_REPLICAS=0 docker-compose down

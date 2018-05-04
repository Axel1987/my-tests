include .env

all: | ${APP_ENV}
dev: | docker-build-dev docker-up-dev
prod: | info


##### composer #####

composer install:
	docker-compose -f docker-compose-dev.yml exec php composer install

create-laravel-project:
	docker-compose -f docker-compose-dev.yml exec php composer create-project --prefer-dist laravel/laravel .

create-yii2-project:
	docker-compose -f docker-compose-dev.yml exec php composer  create-project --prefer-dist yiisoft/yii2-app-basic .

create-symphony-project:
	docker-compose -f docker-compose-dev.yml exec php composer create-project symfony/website-skeleton .

##### docker compose #####

docker-build-dev:
	docker-compose -f docker-compose-dev.yml build

docker-up-dev:
	docker-compose -f docker-compose-dev.yml up

docker-down-dev:
	docker-compose -f docker-compose-dev.yml down
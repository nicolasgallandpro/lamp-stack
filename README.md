# LAMP | LARAVEL Docker stack - 2 env : production & dev

## 3x2 containers (Dev & P)rod*
- PHP 7.4 + Laravel + Apache
- Mariadb 10.5
- PhpMyAdmin

## Files
Dockerfile : Dockerfile of the PHP/Apache/Laravel container. Other containers use vanilla docker hub images
bash.sh : access the bash of any container
docker-compose.base.yaml : common part of the dev and production containers

/dev/ : dev container conf & helpers
/dev/up.sh /dev/down.sh : launch and shutdown of the dev container
/dev/.env : env conf of the dev container

/prod/ : prod container conf & helpers
/prod/up.sh /dev/down.sh : launch and shutdown of the prod container
/prod/.env : env conf of the prod container

../dbs : mariadb persistance of dev and prod

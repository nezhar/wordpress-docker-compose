#!/bin/bash
export $(grep -v '^#' .env | xargs)
docker-compose run --user 33 --rm wpcli wp core install --url=http://localhost:${WP_PORT} --title=test --admin_user=admin --admin_email=test@example.com
for name in $(cat plugins.txt); do 
    docker-compose run --user 33 --rm wpcli wp plugin install $name --activate
done
for name in $(cat themes.txt); do 
    docker-compose run --user 33 --rm wpcli wp theme install $name --activate
done
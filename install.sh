#!/bin/bash
export $(grep -v '^#' .env | xargs)
docker-compose run --user 33 --rm wpcli wp core install --url=http://localhost:${WP_PORT} --title=test --admin_user=admin --admin_email=test@example.com
docker-compose run --user 33 --rm wpcli wp plugin install duplicator --activate
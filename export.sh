_os="`uname`"
_now=$(date +"%m_%d_%Y")
_file="wp-data/data_$_now.sql"
docker-compose exec db sh -c 'exec mysqldump "$MYSQL_DATABASE" -uroot -p"$MYSQL_ROOT_PASSWORD"' > $_file
if [[ $_os == "Darwin"* ]] ; then
  sed -i '' -e 1d $_file
else
  sed 1,1d $_file # Removes the password warning from the file
fi

#!/bin/bash
docker-compose up -d
# docker exec {container_db_name} mysqldump -u'root' -p'root' appbank | gzip > db_backup.sql.gz
exit

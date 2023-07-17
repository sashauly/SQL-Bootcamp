#!/bin/bash
# ENTER A NAME OF YOUR DATABASE
dbname='model'
# read -p "Name of database: " dbname

time=$(date '+%Y'-'%m'-'%d')
default=$(find ../materials -name 'model.sql')

echo "SQL-BACKUP"
echo "What to do?"
echo "1 - backup "$dbname" Data Base"
echo "2 - restore "$dbname" Data Base"
echo "3 - default restore from ../materials"
read -p "Please enter the number: " action
if [ $action = 1 ]; then
  rm -rf *$dbname*
  pg_dump -U postgres -h localhost -p 5432 $dbname --clean >backup-"$dbname"-${time}.dump
elif [ $action = 2 ]; then
  dropdb -U postgres -h localhost -p 5432 $dbname && createdb -U postgres -h localhost -p 5432 $dbname
  psql -U postgres -h localhost -p 5432 $dbname <backup-"$dbname"-${time}.dump
else
  dropdb -U postgres -h localhost -p 5432 $dbname && createdb -U postgres -h localhost -p 5432 $dbname
  psql -U postgres -h localhost -p 5432 $dbname <$default
fi

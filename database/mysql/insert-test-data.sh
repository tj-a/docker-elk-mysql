#!/usr/bin/env bash

# replace the inserts with MySQL dump
mysql --user=root --password="$MYSQL_ROOT_PASSWORD" <<-EOSQL
    use elk_test
    INSERT INTO es_table (id, client_name)
    VALUES (1,"Targaryen"), (2,"Lannister"), (3,"Stark");
EOSQL

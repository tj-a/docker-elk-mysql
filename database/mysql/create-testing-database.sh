#!/usr/bin/env bash

mysql --user=root --password="$MYSQL_ROOT_PASSWORD" <<-EOSQL
    CREATE DATABASE IF NOT EXISTS elk_test;
    USE elk_test;
    DROP TABLE IF EXISTS es_table;
    CREATE TABLE es_table (
        id BIGINT(20) UNSIGNED NOT NULL,
        PRIMARY KEY (id),
        UNIQUE KEY unique_id (id),
        client_name VARCHAR(32) NOT NULL,
        modification_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );
    GRANT ALL PRIVILEGES ON \`elk_test%\`.* TO '$MYSQL_USER'@'%';
EOSQL

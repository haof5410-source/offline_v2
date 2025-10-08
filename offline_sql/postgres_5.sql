CREATE DATABASE pg_db;
\c pg_db;

CREATE TABLE user_info
(
    id            BIGSERIAL PRIMARY KEY,
    username      VARCHAR(50) NOT NULL,
    register_time TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status        INT         NOT NULL DEFAULT 1
);

CREATE TABLE order_info
(
    order_id    BIGSERIAL PRIMARY KEY,
    user_id     BIGINT         NOT NULL,
    amount      DECIMAL(10, 2) NOT NULL,
    create_time TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user_info (id)
);

ALTER SYSTEM SET wal_level = logical;
SELECT *
FROM pg_create_logical_replication_slot('pg_cdc_slot', 'pgoutput');
CREATE DATABASE `accounts`;
USE `accounts`;

CREATE TABLE `users` (
    `user_id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(64) NOT NULL UNIQUE,
    `password` BINARY(60) NOT NULL,
    `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_updated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE sessions (
    `session_id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `uuid` CHAR(128) NOT NULL UNIQUE,
    `user_id` INT NOT NULL,
    `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_expires` DATETIME AS (`date_created` + INTERVAL 8 HOUR) STORED,

    FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`) ON DELETE CASCADE
);

CREATE TABLE nonces (
    `nonce_id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `uuid` CHAR(128) NOT NULL UNIQUE,
    `date_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
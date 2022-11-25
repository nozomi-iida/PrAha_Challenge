CREATE TABLE customers (
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
    firstName VARCHAR(255) NOT NULL,
    lastName VARCHAR(255) NOT NULL,
    phoneNumber INT NOT NULL,
    isPaid BOOLEAN NOT NULL DEFAULT false
)

CREATE TABLE orderItems (
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
    count INT NOT NULL DEFAULT 0,
    isWasabi BOOLEAN NOT NULL DEFAULT true,
    size ENUM("small", "large") NOT NULL DEFAULT "small",
    menuId INT NOT NULL,
    orderId INT NOT NULL,
    FOREIGN KEY FK_MenuOrderItem(menuId) REFERENCES menues(id),
    FOREIGN KEY FK_OrderOrderItem(orderId) REFERENCES orders(id)
);

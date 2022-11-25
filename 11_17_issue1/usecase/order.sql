# はな1つとみさき1つ、いくら6皿に中トロ3皿を注文する
SET @firstName = "Tarou";
INSERT IGNORE INTO users(`firstName`, `lastName`, phone)
VALUES(@firstName, "Test", 09012345678);

SELECT id FROM users WHERE firstName COLLATE utf8mb4_general_ci = @`firstName`;
INSERT IGNORE INTO `orders`(`userId`)
VALUES(@userId);
SELECT @orderId := LAST_INSERT_ID();

SELECT @hanaId := id, @hanaPrice := price FROM menues WHERE name = "はな";
SET @hanaTotalPrice := @hanaPrice*1;
INSERT IGNORE INTO `orderItems`(count, `isWasabi`, size, `totalPrice`, `menuId`, `orderId`)
VALUES(1, true, "small", @hanaTotalPrice, @hanaId, @orderId);

SELECT @ikuraId := id, @ikuraPrice := price FROM menues WHERE name = "いくら";
SET @ikuraTotalPrice := @ikuraPrice*6;
INSERT IGNORE INTO `orderItems`(count, `isWasabi`, size, `totalPrice`, `menuId`, `orderId`)
VALUES(6, true, "small", @ikuraTotalPrice, @orderId, @orderId);

SELECT @toroId := id, @toroPrice := price FROM menues WHERE name = "中トロ";
SET @toroTotalPrice := @ikuraPrice*3;
INSERT IGNORE INTO `orderItems`(count, `isWasabi`, size, `totalPrice`, `menuId`, `orderId`)
VALUES(3, true, "small", @toroTotalPrice, @toroId, @orderId);

UPDATE orders
SET `totalPrice` = @hanaTotalPrice+@ikuraTotalPrice+@toroTotalPrice
WHERE id = @orderId;

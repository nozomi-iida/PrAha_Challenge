# 5月の売上を計算する
# 5月のorderを3個、6月のorderを2個作成する

SELECT @userId := id FROM users WHERE firstName = "Shouyou";

INSERT IGNORE INTO `orders`(`userId`, `createdAt`)
VALUES(@userId, '2022-05-01');
SELECT @orderId := LAST_INSERT_ID();

# OrderItemを作成する
DELIMITER //
CREATE FUNCTION insertOrderItems (
  menuName Varchar(255),
  count Int,
  orderId Int,
)
RETURNS
BEGIN
  SELECT @menuId := id, @price := price FROM menues WHERE name = menuName;
  SET @totalPrice := @price*3;
  INSERT INTO `orderItems`(count, `totalPrice`, `menuId`, `orderId`)
  VALUES(count, @totalPrice, @`menuId`, `orderId`);
  RETURNS
END
//
DELIMITER ;

DELIMITER //
CREATE FUNCTION insertOrders (
  userId Int,
)
RETURNS INT NOT DELIMITER
BEGIN
  INSERT IGNORE INTO `orders`(`userId`)
  VALUES(userId);
  RETURNS 0;
END
//
DELIMITER ;

insertOrderItems("いくら", 4, @orderId);

SELECT insertOrders(@userId);

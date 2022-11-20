-- Active: 1668822633200@@127.0.0.1@3306@take_out

SELECT @setmenu := id FROM `mainCategories` WHERE name = "セットメニュー";
INSERT IGNORE INTO `categories`(name, `mainCategoryId`)
VALUES("盛り込み", @setmenu), 
("にぎり", @setmenu), 
("鮨やの丼＆おすすめ", @setmenu), 
("地元に生まれた味", @setmenu);

SELECT @sushi := id FROM `mainCategories` WHERE name = "お好みすし";

INSERT IGNORE INTO `categories`(name, `mainCategoryId`)
VALUES("一皿 100円(税別)", @sushi),
("一皿 150円(税別)", @setmenu), 
("一皿 180円(税別)", @setmenu), 
("一皿 220円(税別)", @setmenu), 
("一皿 260円(税別)", @setmenu), 
("一皿 360円(税別)", @setmenu), 
("一皿 400円(税別)", @setmenu), 
("一皿 460円(税別)", @setmenu), 
("一皿 520円(税別)", @setmenu), 
("一皿 600円(税別)", @setmenu);

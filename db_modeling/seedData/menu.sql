SELECT @morikomi := id FROM categories WHERE name = "盛り込み";
INSERT IGNORE INTO `menues`(name, price, `categoryId`)
VALUES("はな", 8650, @morikomi), 
("わだつみ", 5680, @morikomi), 
("くろしお", 2830, @morikomi), 
("いさりび", 2180, @morikomi), 
("あさなぎ", 4440, @morikomi), 
("ゆうなぎ", 3830, @morikomi);

SELECT @nigiri := id FROM categories WHERE name = "にぎり";
INSERT IGNORE INTO `menues`(name, price, `categoryId`)
VALUES("みさき", 1940, @nigiri), 
("みなと", 1490, @nigiri), 
("しおん", 1060, @nigiri), 
("なぎさ", 800, @nigiri);

SELECT @recommend := id FROM categories WHERE name = "鮨やの丼＆おすすめ";
INSERT IGNORE INTO `menues`(name, price, `categoryId`)
VALUES("海鮮ちらし", 1280, @recommend), 
("鉄火丼", 1000, @recommend);

SELECT @100 := id FROM categories WHERE name = "一皿 100円(税別)";
INSERT IGNORE INTO `menues`(name, price, `categoryId`)
VALUES("玉子", 100, @100), 
("いなり", 100, @100), 
("納豆軍艦", 100, @100), 
("ツナサラダ", 100, @100), 
("コーン", 100, @100), 
("かにサラダ", 100, @100), 
("オクラ軍艦", 100, @100);

SELECT @150 := id FROM categories WHERE name = "一皿 150円(税別)";
INSERT IGNORE INTO `menues`(name, price, `categoryId`)
VALUES("ゆでげそ", 150, @150), 
("とびっこ", 150, @150), 
("明太子サラダ", 150, @150), 
("いかの塩辛", 150, @150), 
("オクラ納豆", 150, @150), 
("かんぴょう巻", 150, @150), 
("なっとう巻", 150, @150), 
("かっぱ巻", 150, @150), 
("おしんこ巻", 150, @150), 
("梅しそ巻", 150, @150);

SELECT @180 := id FROM categories WHERE name = "一皿 180円(税別)";
INSERT IGNORE INTO `menues`(name, price, `categoryId`)
VALUES("えび", 180, @180), 
("赤いそ", 180, @180), 
("かにみそ軍艦", 180, @180);

SELECT @220 := id FROM categories WHERE name = "一皿 220円(税別)";
INSERT IGNORE INTO `menues`(name, price, `categoryId`)
VALUES("生サーモン", 220, @220), 
("オニオンサーモン", 220, @220), 
("まぐろ赤身", 220, @220), 
("ゆでたこ", 220, @220);

SELECT @260 := id FROM categories WHERE name = "一皿 260円(税別)";
INSERT IGNORE INTO `menues`(name, price, `categoryId`)
VALUES("あじ", 260, @260), 
("赤えび", 260, @260), 
("生たこ", 260, @260), 
("えんがわ", 260, @260), 
("炙りえんがわ", 260, @260), 
("まぐろ塩だれ焼", 260, @260), 
("焼えび", 260, @260), 
("ねぎとろ", 260, @260), 
("炙りサーモン", 260, @260), 
("鉄火巻", 260, @260), 
("まぐろワサビ巻", 260, @260);

SELECT @360 := id FROM categories WHERE name = "一皿 360円(税別)";
INSERT IGNORE INTO `menues`(name, price, `categoryId`)
VALUES("いくら", 360, @360), 
("ホタテ貝", 360, @360), 
("真鯛", 360, @360), 
("穴子", 360, @360);

SELECT @400 := id FROM categories WHERE name = "一皿 400円(税別)";
INSERT IGNORE INTO `menues`(name, price, `categoryId`)
VALUES("活ヒラメ", 400, @400), 
("数の子", 400, @400), 
("ずわいがに", 400, @400), 
("トロタク巻", 400, @400), 
("すじこ巻", 400, @400);

SELECT @460 := id FROM categories WHERE name = "一皿 460円(税別)";
INSERT IGNORE INTO `menues`(name, price, `categoryId`)
VALUES("中トロ", 460, @460), 
("特大海老", 460, @460);

SELECT @520 := id FROM categories WHERE name = "一皿 520円(税別)";
INSERT IGNORE INTO `menues`(name, price, `categoryId`)
VALUES("あなご一本すし", 520, @520), 
("まぐろづくし", 520, @520), 
("白身づくし", 520, @520);

SELECT @600 := id FROM categories WHERE name = "一皿 600円(税別)";
INSERT IGNORE INTO `menues`(name, price, `categoryId`)
VALUES("うに", 600, @600), 
("インドまぐろ大トロ", 600, @600);

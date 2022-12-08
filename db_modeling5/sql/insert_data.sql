INSERT IGNORE INTO `users`(username)
VALUES("nozomi"),
("taro");

SELECT @nozomi_id := id FROM `users` WHERE username = "nozomi";

SELECT @article_id := UUID_TO_BIN(UUID());
SELECT @article2_id := UUID_TO_BIN(UUID());

INSERT IGNORE INTO `articles`(id)
VALUES(@article_id),(@article2_id);

-- 更新時間に差をだすため
INSERT IGNORE INTO `article_histories`(title, body, author_id, article_id)
VALUES("職務経歴書", "駆け出しエンジニア", @nozomi_id, @article_id);

INSERT IGNORE INTO `article_histories`(title, body, author_id, article_id)
VALUES("職務経歴書", "エンジニア1年目", @nozomi_id, @article_id);

INSERT IGNORE INTO `article_histories`(title, body, author_id, article_id)
VALUES("職務経歴書", "エンジニア2年目", @nozomi_id, @article_id);

INSERT IGNORE INTO `article_histories`(title, body, author_id, article_id)
VALUES("職務経歴書", "エンジニア3年目", @nozomi_id, @article_id);

INSERT IGNORE INTO `article_histories`(title, body, author_id, article_id)
VALUES("12/9の日記", "DBモデリング5をやった", @nozomi_id, @article2_id);

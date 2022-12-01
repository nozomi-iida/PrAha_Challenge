INSERT IGNORE INTO `users`(slack_id)
VALUES("nozomi"),
("tarou");

SELECT @nozomi_id := id FROM `users` WHERE slack_id = "nozomi";
SELECT @tarou_id := id FROM `users` WHERE slack_id = "tarou";

INSERT IGNORE INTO `tasks`(name, description, remind, creator_id)
VALUES("レスポンシブ対応", "Chackra UIを使用してレスポンシブ対応を行う", "every 2 days", @nozomi_id),
("自己紹介記事を書く", "自分のスキルセット、職務経歴を書く", "every 3 hours", @nozomi_id),
("モニターをヤフオクに出す", "初めて出品する", "every 4 hours", @nozomi_id);

SELECT @task_id := id FROM `tasks` WHERE name = "レスポンシブ対応";

INSERT IGNORE INTO `mentions`(task_id, assign_id)
VALUES(@task_id, @nozomi_id),
(@task_id, @tarou_id);

INSERT IGNORE INTO `User`(nickname, email)
VALUES("若林", "wakabayashi@exampla.com"),
("春日", "kasuga@exampla.com"),
("オカダ", "okada@exampla.com"),
("佐久間", "sakuma@exampla.com"),
("さとみつ", "satomitu@exampla.com");

SELECT @wakabayashi_id := id FROM `User` WHERE nickname = "若林";
SELECT @kasuga_id := id FROM `User` WHERE nickname = "春日";
SELECT @satomitu_id := id FROM `User` WHERE nickname = "さとみつ";
SELECT @sakuma_id := id FROM `User` WHERE nickname = "佐久間";
SELECT @okada_id := id FROM `User` WHERE nickname = "オカダ";

INSERT IGNORE INTO `Workspace`(name, owner_id)
VALUES("オールナイトニッポン", @sakuma_id), 
("激レアさんを連れてきた。", @sakuma_id);

SELECT @allnight_id := id FROM `Workspace` WHERE name = "オールナイトニッポン";
SELECT @gekirare_id := id FROM `Workspace` WHERE name = "激レアさんを連れてきた。";

INSERT IGNORE INTO `User_Workspace`(user_id, workspace_id)
VALUES(@wakabayashi_id, @allnight_id),
(@kasuga_id, @allnight_id),
(@sakuma_id, @allnight_id),
(@satomitu_id, @allnight_id),
(@okada_id, @allnight_id),
(@wakabayashi_id, @gekirare_id),
(@sakuma_id, @gekirare_id),
(@okada_id, @gekirare_id);

INSERT IGNORE INTO `Channel`(name, workspace_id)
VALUES("General", @allnight_id), ("若林トーク確認", @allnight_id), ("春日トーク確認", @workspace_id);
SELECT @general_id := id FROM `Channel` WHERE name = "General";
SELECT @wakabayashi_talk_id := id FROM `Channel` WHERE name = "若林トーク確認";

INSERT IGNORE INTO `Channel_User`(user_id, channel_id)
VALUES(@wakabayashi_id, @general_id),
(@kasuga_id, @general_id),
(@sakuma_id, @general_id),
(@sakuma_id, @wakabayashi_talk_id),
(@wakabayashi_id, @wakabayashi_talk_id);

INSERT IGNORE INTO `Message`(content, user_id, channel_id)
VALUES("明日も3時からお願いします", @sakuma_id, @general_id), ("明日のゲストが変更しました", @kasuga_id, @channel_id);

SELECT @message_id := id FROM `Message` WHERE content = "明日のゲストが変更しました";
INSERT IGNORE INTO `Thread`(content, user_id, message_id)
VALUES("ゲスト誰になるんですか？", @wakabayashi_id, @message_id), ("あばれる君です", @kasuga_id, @message_id);


INSERT IGNORE INTO `Message`(content, user_id, channel_id)
VALUES("今日のトーク準備できてますか?", @sakuma_id, @wakabayashi_talk_id);
SELECT @message_id := id FROM `Message` WHERE content = "今日のトーク準備できてますか?";
INSERT IGNORE INTO `Thread`(content, user_id, message_id)
VALUES("まだ準備できてないです。。。", @wakabayashi_id, @message_id), ("頑張ってエピソード探してください！", @sakuma_id, @message_id)

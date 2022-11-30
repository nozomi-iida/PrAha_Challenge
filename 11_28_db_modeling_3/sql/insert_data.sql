INSERT IGNORE INTO `users`(name, email)
VALUES("若林", "wakabayashi@exampla.com"),
("春日", "kasuga@exampla.com"),
("オカダ", "okada@exampla.com"),
("佐久間", "sakuma@exampla.com"),
("さとみつ", "satomitu@exampla.com");

SELECT @wakabayashi_id := id FROM `users` WHERE name = "若林";

INSERT IGNORE INTO `directories`(name)
VALUES("オールナイトニッポン"),
("潜在能力テスト"),
("若林トーク集"),
("死んでもやめんじゃねーぞ"),
("クイズ!東洋一のツッコミ王春日"),
("11月1週目トーク"),
("11月2週目トーク"),
("11月3週目トーク"),
("激レアさんを連れてきた。");

SELECT @allnight_id := id FROM `directories` WHERE name = "オールナイトニッポン";
SELECT @wakabayashi_talk_id := id FROM `directories` WHERE name = "若林トーク集";
SELECT @one_week_id := id FROM `directories` WHERE name = "11月1週目トーク";
SELECT @two_week_id := id FROM `directories` WHERE name = "11月2週目トーク";
SELECT @three_week_id := id FROM `directories` WHERE name = "11月3週目トーク";
INSERT IGNORE INTO `directory_paths`(ancestor, desendant, path_length)
VALUES(@allnight_id, @allnight_id, 0),
(@allnight_id, @wakabayashi_talk_id, 1),
(@one_week_id, @one_week_id, 0),
(@wakabayashi_talk_id, @one_week_id, 1),
(@allnight_id, @one_week_id, 2),
(@two_week_id, @two_week_id, 0),
(@wakabayashi_talk_id, @two_week_id, 1),
(@allnight_id, @two_week_id, 2),
(@three_week_id, @three_week_id, 0),
(@wakabayashi_talk_id, @three_week_id, 1),
(@allnight_id, @three_week_id, 2);
INSERT IGNORE INTO `documents`(name, content, position, directory_id, user_id)
VALUES
("イーグル", 
"今日はクリスマス。サンタさん来てくれるかなあ?1957 年に設立されたグリーンランド国際サンタクロース協会から派遣されたサンタさん、 来て欲しいなあ。", 
1, 
@one_week_id,
@wakabayashi_id),
("テルマエお前", 
"お化けって信じますか?僕、やっぱりお化けって怖いんですよね。
だって「いる」か「いない」かの 2 択問題の答え、誰も解らないんですよ?", 
2, 
@one_week_id,
@wakabayashi_id);

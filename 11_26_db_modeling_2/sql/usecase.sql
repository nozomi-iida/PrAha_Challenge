# チャネルのメッセージ一覧取得
SELECT
  content メッセージ,
  name チャネル
FROM Message message
INNER JOIN Channel channel
ON message.channel_id = channel.id
WHERE message.channel_id = 1;

# メッセージのスレッドを取得
SELECT
  first_name 名前,
  message.content メッセージ,
  thread.content スレッドメッセージ
FROM Message message
INNER JOIN Thread thread
ON message.id = thread.message_id
INNER JOIN User user
ON thread.user_id = user.id
WHERE message.content = "明日のゲストが変更しました";

# 横断検索「ゲスト」で検索
# 1. ユーザーが所属しているチャネルを取得する
SELECT 
  channel.name チャンネル名
FROM Channel channel
INNER JOIN Workspace workspace
ON channel.workspace_id = workspace.id
INNER JOIN Channel_User channel_user
ON channel.id = channel_user.channel_id
INNER JOIN User user
ON channel_user.user_id = user.id
WHERE workspace.name = "オールナイトニッポン" AND user.nickname = "若林";

# 2. チャンネルのメッセージ、スレッドから「ゲスト」が含まれるメッセージ、スレッドを取得する
SELECT
  *
FROM Message message
INNER JOIN Channel channel
ON channel.id = message.channel_id
WHERE message.content LIKE "%ゲスト%" AND (channel.name = "General" OR channel.name = "若林トーク確認");

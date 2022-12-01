# nozomiのtask一覧を取得する
SELECT
  tasks.name,
  tasks.description
FROM tasks
INNER JOIN users
ON tasks.creator_id = users.id
WHERE users.slack_id = "nozomi" and tasks.is_done = false;

# taskの担当者を取得する
SELECT
  tasks.name タスク名,
  users.slack_id 担当者
FROM tasks
INNER JOIN mentions
ON mentions.task_id = tasks.id
INNER JOIN users
ON mentions.assign_id = users.id
WHERE tasks.name = "レスポンシブ対応"

-- 記事を取得する
SELECT
  title,
  body
FROM `articles`
INNER JOIN `article_histories`
ON article_id = articles.id
WHERE title = "職務経歴書"
ORDER BY article_histories.created_at DESC LIMIT 1;

-- 記事の更新履歴を取得する
SELECT
  title,
  body,
  created_at
FROM `article_histories`
WHERE title = "職務経歴書"
ORDER BY article_histories.created_at DESC;

-- 記事を最新順に表示する
SELECT
  title,
  body
FROM `articles`
INNER JOIN (
  SELECT article_id, MAX(created_at) as latest_date
  FROM `article_histories`
  GROUP BY article_id
) as latest
ON latest.article_id = articles.id
INNER JOIN `article_histories`
ON latest.article_id = article_histories.article_id
AND latest.latest_date = article_histories.created_at
ORDER BY articles.created_at DESC;

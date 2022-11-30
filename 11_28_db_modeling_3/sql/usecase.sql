-- Active: 1668822633200@@127.0.0.1@3306@esa_clone
SELECT @allnight_id := id FROM `directories` WHERE name = "オールナイトニッポン";
# オールナイトニッポンディレクトリ一覧を順番どおりに取得する
SELECT
  directories.*,
  directory_paths.path_length
FROM directories 
INNER JOIN directory_paths 
ON directories.id = directory_paths.desendant
WHERE directory_paths.ancestor = @allnight_id;

SELECT @wakabayashi_id := id FROM `users` WHERE name = "若林";
# 若林が書いたドキュメント一覧を取得する
SELECT
  documents.name,
  documents.content
FROM documents
INNER JOIN users
ON documents.user_id = users.id
WHERE users.id = @wakabayashi_id

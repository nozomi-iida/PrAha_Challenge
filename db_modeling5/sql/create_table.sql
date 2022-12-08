-- Active: 1668822633200@@127.0.0.1@3306@blog
CREATE TABLE IF NOT EXISTS articles (
  id BINARY(16) NOT NULL  PRIMARY KEY DEFAULT (UUID_TO_BIN(UUID())),
  published_at timestamp,
  created_at datetime default current_timestamp
);

CREATE TABLE IF NOT EXISTS users (
  id BINARY(16) NOT NULL  PRIMARY KEY DEFAULT (UUID_TO_BIN(UUID())),
  username VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS article_histories (
  id BINARY(16) NOT NULL  PRIMARY KEY DEFAULT (UUID_TO_BIN(UUID())),
  title VARCHAR(255) NOT NULL,
  body VARCHAR(255) NOT NULL,
  created_at datetime default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  article_id BINARY(16) NOT NULL,
  author_id BINARY(16) NOT NULL,
  CONSTRAINT fk_article_histories FOREIGN KEY (article_id)
  REFERENCES articles(id),
  CONSTRAINT fk_author_article_histories FOREIGN KEY (author_id)
  REFERENCES users(id)
)

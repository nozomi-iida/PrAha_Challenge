-- Active: 1668822633200@@127.0.0.1@3306@penpen_clone
# 本来はteamIdや、accessTokenを保存する必要があった
CREATE TABLE IF NOT EXISTS users (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  slack_id VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS tasks (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  description VARCHAR(255),
  remind VARCHAR(255),
  is_done BOOLEAN DEFAULT false,
  creator_id INT,
  CONSTRAINT fk_creator_tasks FOREIGN KEY (creator_id)
  REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS mentions (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  task_id INT NOT NULL,
  assign_id INT NOT NULL,
  CONSTRAINT fk_task_mentions FOREIGN KEY (task_id)
  REFERENCES tasks(id),
  CONSTRAINT fk_assign_mentions FOREIGN KEY (assign_id)
  REFERENCES users(id)
);


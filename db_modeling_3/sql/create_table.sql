-- Active: 1668822633200@@127.0.0.1@3306@esa_clone
CREATE TABLE IF NOT EXISTS users (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS directories (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS directory_paths (
  ancestor INT NOT NULL,
  desendant INT NOT NULL,
  path_length INT NOT NULL,
  PRIMARY KEY (ancestor, desendant),
  CONSTRAINT fk_ancestor FOREIGN KEY (ancestor)
  REFERENCES directories(id),
  CONSTRAINT fk_desendant FOREIGN KEY (desendant)
  REFERENCES directories(id)
);

CREATE TABLE IF NOT EXISTS documents (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  position INT NOT NULL,
  content VARCHAR(255) NOT NULL,
  created_at datetime  default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  user_id INT,
  directory_id INT NOT NULL,
  CONSTRAINT fk_user_documents FOREIGN KEY (user_id)
  REFERENCES users(id),
  CONSTRAINT fk_directory_documents FOREIGN KEY (directory_id)
  REFERENCES directories(id)
);

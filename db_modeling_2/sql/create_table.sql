-- Active: 1668822633200@@127.0.0.1@3306@slack
CREATE TABLE IF NOT EXISTS User (
  id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nickname VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Workspace (
  id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  owner_id INT NOT NULL,
  CONSTRAINT fk_owner_workspace FOREIGN KEY (owner_id)
  REFERENCES User(id)
);

CREATE TABLE IF NOT EXISTS User_Workspace (
  id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  workspace_id INT NOT NULL,
  CONSTRAINT fk_user_workspace FOREIGN KEY (user_id)
  REFERENCES User(id),
  CONSTRAINT fk_workspace_user FOREIGN KEY (workspace_id)
  REFERENCES Workspace(id)
);

CREATE TABLE IF NOT EXISTS Channel (
  id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  workspace_id INT NOT NULL,
  CONSTRAINT fk_workspace_channel FOREIGN KEY (workspace_id)
  REFERENCES Workspace(id)
);

CREATE TABLE IF NOT EXISTS Channel_User (
  id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  channel_id INT,
  CONSTRAINT fk_user_channel FOREIGN KEY (user_id)
  REFERENCES User(id),
  CONSTRAINT fk_channel_user FOREIGN KEY (channel_id)
  REFERENCES Channel(id)
);


CREATE TABLE IF NOT EXISTS Message (
  id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  content VARCHAR(255) NOT NULL,
  created_at datetime  default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp,
  user_id INT,
  channel_id INT NOT NULL,
  parent_message_id INT,
  CONSTRAINT fk_user_message FOREIGN KEY (user_id)
  REFERENCES User(id),
  CONSTRAINT fk_channel_message FOREIGN KEY (channel_id)
  REFERENCES Channel(id),
  CONSTRAINT fk_message FOREIGN KEY (parent_message_id)
  REFERENCES Message(id)
);

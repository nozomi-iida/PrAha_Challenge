-- Active: 1668822633200@@127.0.0.1@3306@take_out

DELETE FROM `mainCategories`;

INSERT IGNORE INTO `mainCategories`(name)
VALUES("セットメニュー"), ("お好みすし");

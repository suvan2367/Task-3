CREATE DATABASE task3;
USE task3;

CREATE TABLE IF NOT EXISTS `user_details` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL, 
  `last_name` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `status` tinyint(10) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10001 ;

INSERT INTO `user_details` (`user_id`, `username`, `first_name`, `last_name`, `gender`, `password`, `status`) VALUES
(1, 'rogers63', 'david', 'john', 'Female', 'e6a33eee180b07e563d74fee8c2c66b8', 1),
(2, 'mike28', 'rogers', 'paul', 'Male', '2e7dc6b8a1598f4f75c3eaa47958ee2f', 1),
(3, 'rivera92', 'david', 'john', 'Male', '1c3a8e03f448d211904161a6f5849b68', 1),
(4, 'ross95', 'maria', 'sanders', 'Male', '62f0a68a4179c5cdd997189760cbcf18', 1),
(5, 'paul85', 'morris', 'miller', 'Female', '61bd060b07bddfecccea56a82b850ecf', 1),
(6, 'smith34', 'daniel', 'michael', 'Female', '7055b3d9f5cb2829c26cd7e0e601cde5', 1),
(7, 'james84', 'sanders', 'paul', 'Female', 'b7f72d6eb92b45458020748c8d1a3573', 1),
(8, 'daniel53', 'mark', 'mike', 'Male', '299cbf7171ad1b2967408ed200b4e26c', 1),
(9, 'brooks80', 'morgan', 'maria', 'Female', 'aa736a35dc15934d67c0a999dccff8f6', 1),
(10, 'morgan65', 'paul', 'miller', 'Female', 'a28dca31f5aa5792e1cefd1dfd098569', 1);

SELECT * FROM user_details;

SELECT * FROM user_details
WHERE gender = 'Female';

SELECT * FROM user_details
ORDER BY username ASC;

SELECT gender, COUNT(*) AS gender_count
FROM user_details
GROUP BY gender;

SELECT first_name, COUNT(*) AS name_count
FROM user_details
GROUP BY first_name
ORDER BY name_count DESC;

SELECT * FROM user_details
WHERE user_id > (
    SELECT AVG(user_id) FROM user_details
);

CREATE VIEW male_users AS
SELECT * FROM user_details
WHERE gender = 'Male';

CREATE TABLE IF NOT EXISTS user_logins (
  login_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  login_time DATETIME
);

INSERT INTO user_logins (user_id, login_time) VALUES
(1, '2025-04-01 10:00:00'),
(2, '2025-04-01 11:00:00'),
(1, '2025-04-02 09:30:00'),
(4, '2025-04-02 14:00:00');

SELECT u.username, u.first_name, l.login_time
FROM user_details u
INNER JOIN user_logins l ON u.user_id = l.user_id;

CREATE INDEX idx_gender ON user_details(gender);

create schema employment;

use employment;

CREATE TABLE `account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `acc_number` varchar(20) NOT NULL,
  `date_employment` date NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `account_id` int NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`)
);

SELECT * FROM account;
SELECT * FROM employee;
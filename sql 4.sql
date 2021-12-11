select host, user from mysql.user;

CREATE USER 'sda_user'@'localhost' identified by 'sda_user';

RENAME USER 'sda_user'@'localhost' TO 'sda_student'@'localhost';

ALTER USER 'sda_student'@'localhost' identified by 'sda';



show grants for 'sda_user'@'localhost';

drop user 'sda_user'@'localhost';

grant all on university.* to 'sda_user'@'localhost';

GRANT CREATE, SELECT, INSERT, UPDATE, DELETE ON university TO 'sda_user'@'localhost';

revoke delete on university.* from 'sda_user'@'localhost';

revoke all privileges, grant option from 'sda_user'@'localhost';

#revoke update on * from 'sda_user'@'localhost';
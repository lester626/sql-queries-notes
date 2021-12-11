#DDL
create schema university;
create schema student;

use university;

create table student(
ID int not null AUTO_INCREMENT,
FIRSTNAME VARCHAR(50) not null,
LASTNAME VARCHAR(50),
COURSE VARCHAR(100),
PRIMARY KEY (ID)
);

show columns from student;

alter table student
modify FIRSTNAME text(100);

alter table student
add column ADDRESS varchar(100)
after LASTNAME;

alter table student
drop column ADDRESS;

drop table student;

#DML
insert into student(id, firstname, lastname, course) values 
(1, "vincent lester", "togle", "bscs"),
(2, "vincent lester", "togle", "bscs"),
(3, "vincent lester", "togle", "bscs"),
(4, "vincent lester", "togle", "bscs"),
(5, "vincent lester", "togle", "bscs"),
(6, "vincent lester", "togle", "bscs");

select * from student;

select firstname, lastname, course from student;

truncate table student;

select * from student order by id desc;

select firstname, lastname, course from student where firstname="vincent lester";

select * from student where id between 1 and 3;

select * from student where firstname="vincent lester";

select * from student where firstname like "vin%";

update student set course='bseng' where id=2;

delete from student where id=1

#DCL

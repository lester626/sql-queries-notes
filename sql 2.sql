create schema market;

use market;

create table product(
PRODUCTID int not null AUTO_INCREMENT,
PODUCTNAME varchar(50),
PRIMARY KEY (PRODUCTID)
);

drop table product;

show columns from product;


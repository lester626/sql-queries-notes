#create schema book;

use book;

create table producer(
producer_id int not null auto_increment,
producer_name varchar(50) not null,
primary key (producer_id)
);

create table product(
product_id int not null auto_increment,
product_name varchar(50) not null,
producer_id int not null,
primary key (product_id),
constraint producer_id_fk foreign key (producer_id) references producer(producer_id)
);

SELECT product.product_id, product.product_name, producer.producer_id, producer.producer_name FROM product INNER JOIN producer ON product.producer_id=producer.producer_id;
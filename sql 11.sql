create schema library;

create table book(
bookid int not null auto_increment,
bookname varchar(100),
primary key (bookid)
);

create table author(
authorid int not null auto_increment,
authorname varchar(100),
primary key (authorid)
);

alter table book
add column authorid int not null;

alter table book
add constraint authorid_fk
foreign key (authorid) references author(authorid);

drop table book;
drop table author;
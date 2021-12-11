#Insert, Update, Delete

create schema moviehouse;

use moviehouse;

create table movies(
movieID int not null auto_increment,
movieTitle varchar(100) not null,
movieGenre varchar(100),
moviePrice float,
primary key (movieID)
);

create table movieRatings(
ratingID int not null auto_increment, 
rating varchar(50), 
primary key (ratingID));

show columns from movies;

insert into movies(movieID, movieTitle, movieGenre, moviePrice, ratingID) values 
(1, "500 Days of Summer", "Romance", 150.00, 3),
(2, "Ender's Game", "Sci-fi", 200.00, 3),
(3, "The Shutter", "Horror", 150.00, 4),
(4, "Wrong Turn", "Horror", 150.00, 5),
(5, "Wrong Turn 2", "Horror", 200.00, 5),
(6, "Wrong Turn 3", "Horror", 150.00, 5),
(7, "How to Train your Dragon", "Animation", 150.00, 1),
(8, "Smurfs", "Animation", 200.00, 1),
(9, "Shutter", "Horror", 150.00, 4),
(10, "Avengers", "Action", 150.00, 3);

insert into movieratings(rating) values
('G'),
('PG'),
('PG13'),
('R'),
('NC17');

update movies set moviePrice=500.00 where movieID=10;

update movies set moviePrice=150.00 where movieID=2;
update movies set moviePrice=150.00 where movieID=5;
update movies set moviePrice=150.00 where movieID=8;

select * from movies where movieTitle like "Wrong Turn%";

select * from movies;
select * from movieratings;

select * from movies where movieGenre="Horror" and moviePrice=150.00;

alter table movies
add column ratingID int not null
after moviePrice;

alter table movies
drop column ratingID;

alter table movies
modify ratingID int not null;

alter table movies
add constraint ratingID_fk
foreign key (ratingID) references movieratings(ratingID);

alter table movies
drop foreign key ratingID_fk;

select avg(moviePrice) as 'avg value for prices' from movies where ratingID=1;
select min(moviePrice) as 'cheapest' from movies where ratingID=1;
select max(moviePrice) as 'most expensive' from movies where ratingID=1;
select count(*) as 'amount of movies' from movies;
select sum(moviePrice) as 'sum of prices' from movies where ratingID=1;

select movieID, ratingID, min(moviePrice) as 'cheapest', max(moviePrice) as 'most expensive' from movies group by (ratingID);

delete from movies where movieID=6;

delete from movies where movieID=1;

truncate table movies;

drop table movies;

drop schema moviehouse;
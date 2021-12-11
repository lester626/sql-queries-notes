create schema music;

use music;

create table song(
songid int not null auto_increment,
songname varchar(100) not null,
primary key (songid)
);

create table artist(
artistid int not null auto_increment,
artistname varchar(100) not null,
songid int not null,
primary key (artistid)
);

alter table song 
add constraint artistid_fk 
foreign key (artistid) references artist(artistid);

alter table artist
drop foreign key songid_fk;

alter table song 
add column artistid int not null
after songname;

alter table artist
drop column songid;

alter table song
add column price float
after songname;

insert into song(songname, artistid, price) values 
('mirrors', 1, 1500.0),
('sugar', 2, 2000.0),
('just the way you are', 3, 1500.0),
('21 guns', 4, 2500.0),
('sexyback', 1, 2000.0),
('cry me the river', 1, 1500.0),
('payphone', 2, 1500.0),
('cold', 2, 1500.0),
('one more night', 2, 2000.0),
('cant stop the feeling', 1, 2500.0),
('boulevard of the broken dreams', 4, 1500.0),
('basket case', 4, 2000.0),
('talking to the moon', 3, 1500.0),
('thats what I like', 3, 2500.0),
('24k magic', 3, 1500.0),
('gorilla', 3, 2000.0),
('suit and tie', 1, 1500.0),
('this love', 2, 1500.0),
('maps', 2, 2000.0),
('true colors', 1, 2500.0);

insert into artist(artistname) values
('justin timberlake'),
('maroon 5'),
('bruno mars'),
('green day');

insert into artist(artistname) values
('justin bieber'),
('david guetta'),
('ed sheeran');

select * from song;
select * from artist;

select s.songid, s.songname, s.artistid, artist.artistid, artist.artistname
from song s inner join artist on s.artistid = artist.artistid;

select s.songid, s.songname, s.artistid, artist.artistid, artist.artistname
from song s left join artist on s.artistid = artist.artistid;

select s.songid, s.songname, s.artistid, artist.artistid, artist.artistname
from song s right join artist on s.artistid = artist.artistid;

select s.songid, s.songname, s.artistid, artist.artistid, artist.artistname
from song s left join artist on s.artistid = artist.artistid
union all
select s.songid, s.songname, s.artistid, artist.artistid, artist.artistname
from song s right join artist on s.artistid = artist.artistid;

truncate table song;
truncate table artist;

# music db
# song table
# artist table
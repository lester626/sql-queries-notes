create schema weatherlady;

use weatherlady;

create table location(
location_id int not null auto_increment,
country_name varchar(50) not null,
city_name varchar(50) not null,
longitude float not null,
latitude float not null,
primary key (location_id)
);

create table weather(
weather_id int not null auto_increment,
temperature float not null,
humidity float not null,
pressure float not null,
temp_avg float not null,
pres_avg float not null,
hum_avg float not null,
wind_direction float not null,
wind_speed float not null,
weather_date date not null,
location_id int not null,
primary key (weather_id),
constraint location_id_fk foreign key (location_id) references location(location_id)
);

select * from location;
select * from weather;

truncate table location;
truncate table weather;

drop tables location, weather;

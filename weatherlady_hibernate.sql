create schema weatherlady;

use weatherlady;

create table location(
location_id int not null auto_increment,
latitude_north double not null,
latitude_south double not null,
longitude_east double not null,
longitude_west double not null,
city_name varchar (50) not null,
country_name varchar (50) not null,
primary key (location_id)
);

create table weather (
weather_id int not null auto_increment,
temperature double not null,
pressure varchar(50),
humidity double not null,
wind_direction varchar(50) not null,
wind_speed double not null,
location_id int not null,
primary key(weather_id),
constraint location_id_fk
foreign key (location_id)
references location(location_id)
);

insert into location (latitude_north,latitude_south,longitude_east,longitude_west,city_name,country_name)
values (90,-30,50,-25,"MANILA", "PHILIPPINES"),
(80,-20,70,-15,"BEIJING", "CHINA"),
(85,-20,60,25,"AMERICA", "USA"),
(90,-5,50,70,"TOKYO", "JAPAN");

insert into weather (temperature,pressure,humidity,wind_direction,wind_speed,location_id) 
values (40.0,"high pressure",20.0,"east",50.0,1),
(10.0,"low pressure",85.5,"weast",160.0,2),
(50,"high pressure",35.5,"north",40.0,3),
(10.0,"low pressure",75.5,"south",150.0,4);

select weather.weather_id,weather.temperature,weather.pressure,weather.humidity,weather.wind_direction,weather.wind_speed,
location.location_id,location.country_name 
from weather 
inner join location 
on weather.location_id = location.location_id;

select * from location;
select * from weather;

drop schema weatherlady;
create schema weatherlady;

use weatherlady;

call createLocation();
call createWeather();

call insertLocation(534.0, 7456.0, "chicago", "usa");
call insertWeather(35.0, 34.0, 32.0, 165, 15, '2021-12-24', 2);

call getAllWeather();
call getAllLocation();
call weatherInnerJoinLocation();

call truncateWeather();
call truncateLocation();

call dropWeather();
call dropLocation();

select * from weather where wind_speed=17;

drop schema weatherlady;

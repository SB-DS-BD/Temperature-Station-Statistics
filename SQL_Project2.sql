/*SQL Project 2*/
/*Create Database*/
create database SQL_Project2;
/*Qs:1*/
/*create table 'station'*/
create table station(
ID int,
CITY char(20),
STATE char(2),
LAT_N int,
LONG_W int,
constraint st_pk primary key(ID)
);
/*Qs:2*/
/*Insert Records in station table*/
INSERT into station(ID,CITY,STATE,LAT_N,LONG_W) 
		value(13,'Phoenix','AZ',33,112),
			 (44,'Denver','CO',40,105),
             (66,'Caribou','ME',47,68);
/*Qs:3*/
/*Look at table STATION in undefined order*/
Select * from station;
/*Qs:4*/
/*Select Northern stations (Northern latitude > 39.7)*/
Select LAT_N from station where LAT_N>39.7;
/*Qs:5*/
/*Create table STATS*/
create table STATS(
ID int,
MONTH int,
TEMP_F float,
RAIN_I float,
constraint st_pk primary key(ID,MONTH)
);
/*Qs:6*/
/*Insert Records in Stats Table*/
INSERT into stats(ID,MONTH,TEMP_F,RAIN_I) 
		value(13,1,57.4,.31),
			 (13,7,91.7,5.15),
             (44,1,27.3,.18),
             (44,7,74.8,2.11),
             (66,1,6.7,2.1),
             (66,7,65.8,4.52);

/*Qs:7*/
/*Temperature stats (from STATS table) for each city (from Station  table)*/
select stats.TEMP_F,station.CITY from stats inner join station 
on stats.id=station.id;
/*Qs:8*/
/*Table STATS,ordered by month & greatest rainfall,with columns rearranged(with cities)*/
select stats.ID,stats.MONTH,stats.RAIN_I,stats.TEMP_F,station.CITY from stats 
inner join station on stats.id=station.id
order by stats.MONTH asc, stats.RAIN_I desc;
/*Qs:9*/
/*Temperatures(asc) for July from table STATS (with city name and latitude)*/
select stats.TEMP_F,station.CITY,station.LAT_N from stats 
inner join station on stats.id=station.id
where stats.MONTH=7
order by stats.TEMP_F asc;
/*Qs:10*/
/*MAX and MIN temperatures as well as average rainfall*/
select station.CITY, max(stats.TEMP_F) as MaxTemp, min(stats.TEMP_F) as MinTemp, 
avg(stats.RAIN_I) as AvgRainfall from stats inner join station 
on stats.id=station.id group by station.CITY;
/*Qs:11*/
/*Display each city’s monthly temperature in Celcius and rainfall in Centimeter*/
select station.CITY, (stats.TEMP_F-32)*5/9 as TEMP_C, stats.RAIN_I*2.54 as RAIN_CM 
from stats inner join station on stats.id=station.id;
/*Qs:12*/
/*Update all the rows in STATS table RAIN_I=RAIN_I-0.01*/
Update stats
set RAIN_I=RAIN_I-0.01;
/*Qs:13*/
/*Update Denver's July temperature reading as 74.9*/
Update stats
set TEMP_F=74.9
where ID =(select id from station where CITY='Denver') and Month=7;
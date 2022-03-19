create database sql_200db;
create user sql_200@localhost identified by 'sql_200pw';
select * from mysql.user;
grant all privileges on sql_200db.* to sql_200@localhost with grant option;


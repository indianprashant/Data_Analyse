create database sales
use sales

CREATE TABLE sales1 (
	order_id VARCHAR(15) NOT NULL, 
	order_date VARCHAR(15) NOT NULL, 
	ship_date VARCHAR(15) NOT NULL, 
	ship_mode VARCHAR(14) NOT NULL, 
	customer_name VARCHAR(22) NOT NULL, 
	segment VARCHAR(11) NOT NULL, 
	state VARCHAR(36) NOT NULL, 
	country VARCHAR(32) NOT NULL, 
	market VARCHAR(6) NOT NULL, 
	region VARCHAR(14) NOT NULL, 
	product_id VARCHAR(16) NOT NULL, 
	category VARCHAR(15) NOT NULL, 
	sub_category VARCHAR(11) NOT NULL, 
	product_name VARCHAR(127) NOT NULL, 
	sales DECIMAL(38, 0) NOT NULL, 
	quantity DECIMAL(38, 0) NOT NULL, 
	discount DECIMAL(38, 3) NOT NULL, 
	profit DECIMAL(38, 8) NOT NULL, 
	shipping_cost DECIMAL(38, 2) NOT NULL, 
	order_priority VARCHAR(8) NOT NULL, 
	`year` DECIMAL(38, 0) NOT NULL
);

SET sql_mode = '';
load data infile 
'C:/sales_data_final.csv'
into table sales1 
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows 
 
select * from sales1

select str_to_date(order_date,'%m-%d-%y') from sales1

alter table sales1
add column order_date_new date after order_date 

update sales1
set order_date_new = str_to_date(order_date,'%m-%d-%Y')

alter table sales1
add column ship_date_new date after ship_date

update sales1
set ship_date_new = str_to_date(ship_date,'%m-%d-%Y')

select * from sales1 where ship_date_new = '2011-01-05'
select * from sales1 where ship_date_new > '2011-01-05'
select * from sales1 where ship_date_new < '2011-01-05'
select * from sales1 where ship_date_new between '2011-01-05' and '2011-08-30'

select now()
select curtime()
select curdate()

select * from sales1 where ship_date_new < date_sub(now() , interval 1 week)

select date_sub(now() , interval 1 week)
select date_sub(now() , interval 3 day)
select date_sub(now() , interval 3 year)

select year(now())
select dayname(now())

alter table sales1
add column flag date after order_id

update sales1
set flag = now()

select *  from sales1 

SET sql_mode = '';
ALTER TABLE sales1
modify column year datetime;

alter table sales1
add column Year_New int;

alter table sales1
add column Month_New int;

alter table sales1
add column Date_New int;

select *  from sales1 limit 6

update sales1 set month_new= str_to_date(order_date,'%m');
update sales1 set date_new= str_to_date(order_date,'%d');
update sales1 set year_new= str_to_date(order_date,'%y');


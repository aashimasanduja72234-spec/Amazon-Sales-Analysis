DROP DATABASE sys;
DROP DATABASE sakila
CREATE DATABASE Amazon_sales;
use Amazon_sales;
CREATE TABLE Amazon_sales_data(idx varchar(20), order_id varchar(50), date varchar(20), Status varchar(50), fulfilment varchar(50), Sales_Channel varchar(50), ship_service_level varchar(50), Style varchar(50), SKU varchar(50),	Category varchar(50),	Item_Size varchar(50),	ASIN varchar(50), Courier_Status varchar(50), Qty varchar(50), currency varchar(10), Amount varchar(50),	ship_city varchar(50),	ship_state varchar(50),	ship_postal_code varchar(50), ship_country varchar(50), promotion_ids varchar(50),	B2B varchar(50), fulfilled_by varchar(50)
);
show tables;
DESCRIBE amazon_sales_data;
DROP TABLE amazon_sales_data;
show tables;
CREATE TABLE Amazon_sales_data(idx varchar(20), order_id varchar(50), date varchar(20), Status varchar(50), fulfilment varchar(50), Sales_Channel varchar(50), ship_service_level varchar(50), Style varchar(50), SKU varchar(50),	Category varchar(50),	Item_Size varchar(50),	ASIN varchar(50), Courier_Status varchar(50), Qty varchar(50), currency varchar(10), Amount varchar(50),	ship_city varchar(50),	ship_state varchar(50),	ship_postal_code varchar(50), ship_country varchar(50), promotion_ids varchar(50),	B2B varchar(50), fulfilled_by varchar(50)
);
select*from amazon_sales_data limit 10;
select count(*) as total_orders from amazon_sales_data;
select sum(amount) as total_revenue from amazon_sales_data;
select category, count(*) as total_orders
from amazon_sales_data
group by category
order by total_orders desc;
select category, sum(amount) as total_revenue
from amazon_sales_data
group by category
order by total_revenue desc
limit 5;
select substring(date,1,2) as month, sum(amount)as total_revenue, count(*) as total_orders
from amazon_sales_data
group by month
order by month;
select count(*) as total_orders,
sum(case when status = 'cancelled' then 1 else 0 end) as total_orders,
round(sum(case when status = 'cancelled' then 1 else 0 end)*100.0/count(*),2)as cancellation_rate
from amazon_sales_data;
select ship_state, count(*) as total_orders, sum(amount) as total_revenue
from amazon_sales_data
group by ship_state
order by total_orders desc
limit 10;
select category, count(*) as total_orders, round(avg(amount),2) as avg_order_value,
sum(amount) as total_revenue
from amazon_sales_data
group by category
order by avg_order_value desc;
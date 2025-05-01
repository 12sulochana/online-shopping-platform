create database onlineshoppingsystem;
use onlineshoppingsystem;
-- customers table
create table customers(
customer_id int primary key auto_increment,
first_name varchar(45) not null,
last_name varchar(45)not null,
email varchar(50),
country varchar(50),
address varchar(45)
);

insert into customers(customer_id,first_name,last_name, email,country,address)
values(1,'john','doe','USA','123 main st','john.doe@email.com'),
(2,'jane','doe','USA','45 first st','jane.doe@email.com'),
(3,'bob','smith', 'UK','789 oak st','bob.smith@email.com'),
(4,'alice','johnson','chikago','321 maple st','alice.johnson@eamil.com'),
(5,'mike','brown', 'newyork','901 pine st','mike.brown@email. com');

-- orders table
create table orders(
order_id int primary key auto_increment,
customer_id int,
order_date date not null,
total_amount decimal(10,2) not null,
order_status varchar(45),
 foreign key(customer_id) references customers(customer_id));
 
 insert into orders(order_id,customer_id,order_date,total_amount,order_status)
 values(1,1,'2022-01-01',999.99,'shipped'),
 (2,2,'2022-01-05',1299.99,'delivered'),
 (3,3,'2022-01-10',79.99,'pending'),
 (4,4,'2022-01-15',99.99,'shipped'),
 (5,5,'2022-01-20',899.99,'delivered');
 
 -- order item table
 create table orderitems(
 orderitem_id int primary key auto_increment,
 order_id int,
 product_id int,
 quantity int,
 price decimal (10,2),
 foreign key(order_id)references orders(order_id),
 foreign key(product_id) references products(product_id)
 );
 
 insert into  orderitems(orderitem_id,order_id,product_id,quantity,price)
 values(1,1,1,3,100.00),
 (2,2,2,5,200.00),
 (3,3,3,4,250.00),
 (4,4,4,2,300.00),
 (5,5,5,1,400.00);
 
 -- category table
create table category(
category_id int primary key,
category_name varchar(45) not null,
discription varchar(45));

insert into category(category_id,category_name,discription)
values(1,'electronics','smartphone'),
(2,'fashion','clothing,shoes'),
(3,'home and kitchen','cookeeware'),
(4,'sports and fitness','sports equipment,fitness gear,and atheletic wear'),
(5,'toys and games','toys,games,and puzzles');
 -- product table
create table products(
product_id int primary key auto_increment,
product_name varchar(45)not null,
price decimal(10,2) not null,
stock_quantity  int,
category_id int,foreign key
(category_id) references category(category_id)
);

insert into products(product_id,category_id,product_name,price)
values(1,1,'apple iphone',50000.00),
(2,2,'samsung tv',30000.00),
(3,3,'nike shoes',200.00),
(4,4,'sony headphones',600.00),
(5,5,'dell laptop',35000.00);

-- seller table
create table seller(
seller_id int primary key auto_increment,
seller_name varchar(50),
seller_address varchar(50),
phone_number varchar(20),
customer_id int, foreign key (customer_id)references customers(customer_id)
);

insert into seller(seller_id,seller_name,sellder_address,phone_number,customer_id)
values(1,'apple inc.','1 infinite loop','123-654-7890'),
(2,'samsung electronics','129 samsung-ro','987-123-4560'),
(3,'nike inc.','1 bowerman dr','555-123-5678'),
(4,'sony electronics','1-7-1 konan','901-234-6789'),
(5,'dell inc.','1 dell way','111-222-3333');

-- delivery table
create table delivery(
delivery_id int primary key auto_increment,
order_id int,
delivery_date date,
delivery_status varchar(45),
delivery_address varchar(50),
foreign key (order_id) references orders(order_id) 
);

insert into delivery(delivery_id,order_id,delivery_date,delivery_status,delivery_address)
values(1,1,'2022-01-03','shipped','no 2 first st'),
(2,2,'2022-01-07','delivered', '45 main st'),
(3,3,'2022-01-15','pending','356 kannan st'),
(4,4,'2022-01-22','delivered','432 elm st'),
(5,5,'2022-02-05','shipped','901 pine st');

-- payment tabe
create table payment (
payment_id int primary key auto_increment,
order_id int,
payment_date date,
amount decimal(10,2),
payment_method varchar(45),
payment_status varchar(50),
foreign key (order_id) references orders(order_id)
); 

insert into payment(payment_id,order_id,payment_date,payment_amount,payment_method,payment_status)
values(1,1,'2022-01-01',999.99,'credit card','paid'),
(2,2,'2022-01-05',1299.99,'paypal','paid'),
(3,3,'2022-01-10',79.99,'cash','pending'),
(4,4,'2022-01-15','99.99','credit card','paid'),
(5,5,'2022-01-20',899.99,'gpay','paid');

-- transactionreport table
create table transaction_reports(
transcation_id int primary key auto_increment,
order_id int,
customer_id int,
payment_id int,
transaction_date date,
transacion_amount decimal(10,2),
foreign key (order_id) references orders(order_id),
foreign key(customer_id) references customers(customer_id),
foreign key (payment_id) references payment(payment_id)
);

insert into transaction_reports(report_id,transaction_id,order_id,payment_id,transaction_date,transaction_amount)
values(1,1,'2022-01-01','101',100.00),
 (2,2,'2022-01-05','102',200.00),
 (3,3,'2022-01-10','103',300.00),
 (4,4,'2022-02-03','104',450.00),
 (5,5,'2022-02-14','105',500.00);
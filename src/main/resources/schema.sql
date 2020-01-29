DROP TABLE IF EXISTS users cascade;
DROP TABLE IF EXISTS authenticate;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS cart;
create table users(user_id serial primary key, first_name text not null, last_name text not null, address varchar not null, mobile_no varchar not null, password varchar not null, email varchar not null, cart_id varchar unique);
create table authenticate(username varchar primary key, password varchar not null, user_id int unique);
alter table authenticate add constraint fk_userid foreign key(user_id) references users(user_id);
create table cart(id serial primary key, item_id int not null, quantity varchar not null, price float not null, cart_id varchar unique, is_ordered integer default 0);
create table orders(order_id serial primary key, user_id int not null, cart_id varchar unique, total_bill float not null);
alter table orders add constraint fkey foreign key(user_id) references users(user_id);
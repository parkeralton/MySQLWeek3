drop table if exists comments;
drop table if exists posts;
drop table if exists users;

create table users (
user_id int not null auto_increment,
username varchar(40) not null,
email varchar(40) not null,
first_name varchar(40) not null,
last_name varchar(40) not null,
password varchar(40) not null,
DOB time not null,
primary key (user_id)
);

create table posts (
post_id int not null auto_increment,
user_id int not null,
post_content text not null,
post_time timestamp not null default current_timestamp,
primary key (post_id),
foreign key (user_id) references users (user_id)
);

create table comments (
comment_id int not null auto_increment,
user_id int not null,
post_id int not null,
comment_content text not null,
comment_time timestamp not null default current_timestamp,
primary key (comment_id),
foreign key (user_id) references users (user_id),
foreign key (post_id) references posts (post_id) on delete cascade
);
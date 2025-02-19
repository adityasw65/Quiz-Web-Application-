create database quiz;
use quiz;
create table userregistration
(
	user_id int primary key auto_increment,
   user_name varchar(30) not null,
   user_mail varchar(30) not null,
   user_num bigint not null unique,
   user_passw varchar(30)
);

create table results(
	user_mail varchar(30) references userregistration(user_mail),
   submissionDate date,
   marks int
);

create table questions(
	questnum int primary key,
	quest varchar(200) not null,
   opt1 varchar(200) not null,
   opt2 varchar(200) not null,
   opt3 varchar(200) not null,
   opt4 varchar(200) not null
);

create table answers(
	questAns varchar(200) not null,
   questNum int references questions(questnum)
);



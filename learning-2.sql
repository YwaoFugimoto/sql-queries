alter table books
add column city varchar(20);

alter table books
drop column city;

rename table inventory to inventory2;
alter table inventory rename inventory2;
alter table inventory
rename column price to price2;

create table try (
	age int not null
);

insert into try (age)
values (3), (4);

select * from try;

alter table try 
modify age varchar(100);

desc try;

create table customers(
	id int primary key auto_increment,
    first_name varchar(100),
    last_name varchar(100),
	email varchar(50)
);

create table orders(
	id int primary key auto_increment,
    order_date date,
    amount decimal(8,2),
    customer_id int, 
    foreign key(customer_id) references customers(id)
);

alter table orders
rename column ammount to amount;
 
 
INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);

select id from customers 
where last_name = 'George';

select * from customers
join orders on customers.id = orders.customer_id;

SELECT first_name, last_name, SUM(amount) AS total FROM customers
JOIN orders ON orders.customer_id = customers.id
GROUP BY first_name , last_name
ORDER BY total;


select first_name, last_name, ifnull(sum(amount), 0) from customers
right join orders on customers.id = orders.customer_id
group by first_name, last_name;


-- JOINS exs

create table students (
	id int primary key auto_increment,
    first_name varchar(20)
);

create table papers(
	title varchar (20),
    grade int,
    student_id int,
    foreign key (student_id) references students(id)
);

alter table papers 
modify title varchar(100);

alter table papers
rename column student_id to students_id;

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');
 
INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

select * from papers;
select * from students;

select title, grade from students
left join papers on students.id = papers.students_id;

select first_name, title, grade from students
join papers on students.id = papers.students_id
order by first_name desc;

SELECT 
    first_name, title, grade
FROM
    students
        JOIN
    papers ON papers.students_id = students.id
ORDER BY grade DESC;

select first_name, ifnull(title, 'MISSING'), ifnull(grade, 0) from students
left join papers on students.id = papers.students_id;

select first_name, ifnull(avg(grade), 0) from students
left join papers on students.id = papers.students_id
group by first_name
order by avg(grade) desc;

select first_name, ifnull(avg(grade), 0) as avarage, 
	 case 
		when avg(grade) > 75 then 'PASSING'
		else 'FAILING'
	end as passing_status  
from students
left join papers on students.id = papers.students_id
group by first_name
order by avg(grade) desc;

select 
    case
        when occupation = 'Doctor' then ifnull(name, 'NULL')
        when occupation = 'Professor' then ifnull(name, 'NULL')
        when occupation = 'Singer' then ifnull(name, 'NULL')
        when occupation = 'Actor' then ifnull(name, 'NULL')
    end from occupations;
    
select name from occupations
where doctor = (select ifnull(name, 'NULL') from occupations where occupation = 'Doctor')
where prof = (select ifnull(name, 'NULL') from occupations where occupation = 'Professor')
where singer = (select ifnull(name, 'NULL') from occupations where occupation = 'Singer')
where actor = (select ifnull(name, 'NULL') from occupations where occupation = 'Actor')

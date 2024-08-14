CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);
    
drop table books;
use ex;
    
INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);


select * from books;

select concat_ws('middle', 'in ', ' out ', ' inout ');
select concat_ws('-', title, author_fname) from books; 

select substring('Hello world!', 1, 7);

select substring('Hello world!', 2);

select substring(title, 1, 15) from books;

select substring(author_lname, 1, 1) from books;

select concat(substr(title, 1, 10), '...') from books;

select replace(title,' ', '-') from books;

select reverse('hi');

select reverse(title) from books;

-- select reverse(UPPER());

select replace(title,' ','->') from books;

select author_lname as 'forwards', reverse(author_lname) as 'backwards' from books;

select concat(upper(author_fname),' ', upper(author_lname)) as 'full name in caps' from books;

select concat(title, ' was released in ', released_year) as 'blurb' from books;

select title, char_length(title) as 'character count' from books;

select 	concat(substring(title, 1, 10), '...'), 
		concat(author_lname, ',', author_fname) as 'author',
		concat(stock_quantity, ' in stock') as 'quantity' from books
where substring(title, 1, 1) = 'a';

INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
           
select title from books
where title like '%stories%' limit 3;
		
select title, pages from books
order by pages desc limit 1;

select distinct title, ' - ', released_year as 'sumary' from books
order by released_year desc;

select title, author_lname from books
where author_lname like '% %' limit 2;

select distinct title, released_year, stock_quantity from books
order by stock_quantity limit 3;

select distinct title, author_lname from books
order by author_lname, title;

select concat('MY FAVORITE AUTHOR IS ', upper(author_fname),' ', upper(author_lname), '!') as 'yell' from books
order by author_lname;

-- group by summarized of aggregates identical data into single rows

select author_lname, count(*) as books_written from books
group by author_lname
order by books_written desc;

select released_year, count(*) from books
group by released_year;

-- subquerys

select title, pages from books
where pages = (select max(pages) from books);

select title, released_year from books
order by released_year limit 1;

select title, released_year from books
where released_year = (select min(released_year) from books);

-- agg functions exercise

-- total number of books
select count(*) as 'total books' from books;

select released_year, count(*) from books
group by released_year;

select title, stock_quantity from books
order by title;

select sum(stock_quantity) from books;

select author_fname, author_lname, avg(released_year) from books
group by author_fname, author_lname;

select concat(author_fname, ' ', author_lname) as 'Full Name', pages from books
where pages = (select max(pages) from books);

select released_year as 'year', count(title) as '# books', avg(pages) as 'avg pages' from books
group by released_year
order by released_year;

create table inventory(
	item_name varchar(100),
    price decimal(8,2),
    quantity int
);

select curtime();

select curdate();

select dayofweek(curdate());

select dayname(curdate());

select month(curdate());

select day(curdate());

select concat(month(curdate()), '/', day(curdate()), '/', year(curdate()));

select curdate();

select now();

select dayname(now());

select date_format(now(), '%w');

SELECT DATE_FORMAT(NOW(), '%w') + 1;
 
SELECT DAYNAME(NOW());
SELECT DATE_FORMAT(NOW(), '%W');
 
SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y');
 
SELECT DATE_FORMAT(NOW(), '%M %D at %k:%i');

use ex;

create table tweets(
	content varchar(100),
    username varchar(20),
    created_at timestamp default now()
);

insert into tweets (content, username)
value ('this is my first tweet', 'coltscat');

insert into tweets (content, username)
value ('this is my second tweet', 'coltscat');


select * from tweets;

select title, released_year from books
where released_year between 2004 and 2015;

select title, author_lname from books
where author_lname in ('Carver', 'Lahiri', 'Smith');

select title, author_lname, 
	case
		when released_year >= 2000 then 'Modern Lit'
        else '20th Century Lit'
	end as GENRE
from books;

select title, stock_quantity,
	case
		when stock_quantity between 0 and 50 then '*'
        when stock_quantity between 51 and 100 then '**'
        else '***'
	end as 'Stock'
from books;

-- sec 11 exercices

select title from books
where released_year < 1980;

select title from books
where author_lname = 'Eggers' or 'Chabon';

select title from books
where author_lname = 'Lahiri' and released_year > 2000;

select title from books 
where pages between 100 and 200;

select title, author_lname from books
where author_lname like 'c%' or author_lname like 's%';

SELECT title, author_lname
FROM books WHERE SUBSTR(author_lname, 1, 1) in ('C', 'S');

select title, author_lname,
	case
		when title like '%stories%' then 'Short Stories'
        when title like '%Just Kids%' then 'Memoir'
        when title like '%Heartbreaking Work%' then 'Memoir'
        else 'Novel'
	end as type
from books;

select author_fname, author_lname, concat(count(*), ' books') as 'COUNT' from books
group by author_fname, author_lname;


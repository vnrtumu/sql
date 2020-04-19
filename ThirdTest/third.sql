-- 1.	Query to get the number of books by each publisher.
Select 
    pub_nm, count(book_id) as No_of_books 
from 
    book 
inner join 
    publisher on publisher.pub_id = book.pub_id 
group by 
    book_id

-- 2. Write a query which gives book_name, author_name for publisher ‘XYZ’
Select 
    book_nm, CONCAT(CONCAT(au_f_name, ' ' ), au_l_name)  as  author_name 
from 
    book 
inner join 
    publisher on publisher.pub_id = book.pub_id 
inner join 
    book_author on book.book_id = book_author.book_id 
inner join 
    author on book_author.au_id = author.au_id 
where 
    publisher.pub_nm = ‘XYZ’;

-- 3.	Which book was written by more than 3 authors?
Select  
    CONCAT(CONCAT(au_f_name, ' ' ), au_l_name)  as author_name, book_nm, count(au_id) as No_of_authers 
from 
    book 
inner join 
    book_author on book.book_id = book_author.book_id 
inner join 
    author on book_author.au_id = author.au_id 
group by 
    au_id 
having  
    no_of_authers > 3

-- 4.	Want to include city and state information of author as well in the model. So, modifiy the model and show us the new model what you come up with.
ALTER TABLE author 
    ADD au_city varchar(256), 
    ADD au_state varchar(256);
-- 5.	Display publisher name, pub_city and metro flag of the city. If city is CHN or MUM or DEL or CAL then display the flag as ‘Y’ otherwise ‘N’
SELECT 
    pub_nm, pub_city,  
CASE 
    WHEN pub_city = CHN  THEN ‘Y’ 
    WHEN pub_city = MUM THEN ‘Y’  
    WHEN pub_city = DEL THEN ‘Y’  
    WHEN pub_city = CAL THEN ‘Y’ 
    ELSE ’N’ 
    END AS  Metro_flag 
from 
    publisher;

-- 6.	Display the authors whose age is greater than the author ‘RAM KUMAR’
Select  
    CONCAT(CONCAT(au_f_name, ' ' ), au_l_name)  as author_name,  year(CURRENT_DATE()) - year(au_dob) as age 
from 
    author 
WHERE  
    year(CURRENT_DATE()) - year(au_dob) > (SELECT 
                                                year(CURRENT_DATE()) - year(au_dob) 
                                            FROM 
                                                `author` 
                                            WHERE 
                                                CONCAT(CONCAT(au_f_name, ' ' ), au_l_name)  
                                            LIKE '%RAM KUMAR%');



-- 7.	Display the publisher name, author_name and no of books they wrote.
Select 
    publisher.pub_nm, CONCAT(CONCAT(author.au_f_name, ' ' ), author.au_l_name)  as  author_name, count(book.book_id) as No_of_books 
from 
    book 
inner join 
    publisher on publisher.pub_id = book.pub_id 
inner join 
    book_author on book.book_id = book_author.book_id 
inner join 
    author on book_author.au_id = author.au_id 
group by 
    author.au_id;

-- 8.	Which author wrote the maximum number of books?
Select  
    CONCAT(CONCAT(au_f_name, ' ' ), au_l_name)  as author_name, count(book.book_id) as No_of_books from book 
inner join 
    book_author on book.book_id = book_author.book_id 
inner join 
    author on book_author.au_id = author.au_id 
group by 
    book.book_id 
having  
    No_of_books = (select  
                        max(No_of_books) 
                    from (
                        Select 
                            count(book.book_id) as No_of_books 
                        from 
                            book 
                        inner join 
                            book_author on book.book_id = book_author.book_id 
                        inner join 
                            author on book_author.au_id = author.au_id 
                        group by 
                            book.book_id) TEMPORARY )

-- 10.	Display Publisher name, book name, author name. Order the publisher, book name and author name in ascending order.
Select 
    publisher.pub_nm, book.book_nm, CONCAT(CONCAT(au_f_name, ' ' ), au_l_name)  as  author_name 
from 
    book 
inner join 
    publisher on publisher.pub_id = book.pub_id 
inner join 
    book_author on book.book_id = book_author.book_id 
inner join 
    author on book_author.au_id = author.au_id 
ORDER By 
    publisher.pub_nm ASC, book.book_nm ASC, author_name ASC
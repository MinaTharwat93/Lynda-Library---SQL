/******************* In the Library *********************/
use library;
/*******************************************************/
/* find the number of availalbe copies of Dracula      */
/*******************************************************/
select count(BookID) as total_books_Dracula from books
where Title = 'Dracula';

/* check total copies of the book */
select count(BookID) as total_books from books;

/* current total loans of the book */
select count(LoanID) as total_loans from loans;

/* total available book */
select count(BookID) from books;


/*******************************************************/
/* Add new books to the library                        */
/*******************************************************/
INSERT INTO books (BookID, Title, Author, Published, Barcode) values (201,'Atomic Habits','James Clear',2018,9780735211292);
/*******************************************************/
/* Check out Books                                     */
/*******************************************************/
select l.BookID,l.PatronID,b.Title,p.FirstName,p.LastName,p.Email,l.LoanDate,l.DueDate from loans as l
inner join patrons as p on l.PatronID=p.PatronID
inner join books as b on l.BookID=b.BookID;

/********************************************************/
/* Check books for Due back                             */
/* generate a report of books due back on July 13, 2020 */
/* with patron contact information                      */
/********************************************************/
select l.BookID,l.PatronID,b.Title,p.FirstName,p.LastName,p.Email,l.DueDate from loans as l
inner join patrons as p on l.PatronID=p.PatronID
inner join books as b on l.BookID=b.BookID
where l.DueDate = '2020-07-13';



/*******************************************************/
/* Return books to the library                         */
/*******************************************************/
select l.BookID,b.Title,p.FirstName,p.LastName,p.Email,l.ReturnedDate from loans as l
inner join patrons as p on l.PatronID=p.PatronID
inner join books as b on l.BookID=b.BookID;

/*******************************************************/
/* Encourage Patrons to check out books                */
/* generate a report of showing 10 patrons who have
checked out the fewest books.                          */
/*******************************************************/
select l.PatronID,count(l.LoanID) as loan_count ,p.FirstName,p.LastName,p.Email from loans as l
inner join patrons as p on l.PatronID=p.PatronID
group by l.PatronID
order by loan_count asc
limit 10;

/*******************************************************/
/* Find books to feature for an event                  
 create a list of books from 1890s that are
 currently available                                    */
/*******************************************************/
select b.Title,b.Author,b.Published from books as b 
inner join loans as l on b.BookID=l.BookID
where l.ReturnedDate is not null and b.Published between 1890 and 1899
group by b.Title,b.Author,b.Published
order by b.Published;

/*******************************************************/
/* Book Statistics 
/* create a report to show how many books were 
published each year.                                    */
/*******************************************************/
SELECT Published, COUNT(DISTINCT(Title)) AS CountPublishedBooks FROM Books
GROUP BY Published
ORDER BY Published ASC;


/*************************************************************/
/* Book Statistics                                           */
/* create a report to show 5 most popular Books to check out */
/*************************************************************/
SELECT b.Title, b.Author, b.Published, COUNT(l.LoanID) AS count_loans FROM books As b
INNER JOIN loans As l ON b.BookID = l.BookID
GROUP BY b.Title, b.Author, b.Published
ORDER BY count_loans DESC
LIMIT 5;

# Lynda Library Project

## Description
This project, "Lynda Library Project", is designed for library data analysis and reporting. It utilizes Python with the Pandas library for data manipulation and `mysql.connector` for interacting with a MySQL database. The project involves executing SQL queries to extract insights from the library's data and generating various reports in CSV format.

## Files
- `Lynda Library Proejct.ipynb`: A Jupyter notebook that connects to the MySQL database, executes SQL queries, and saves the results into CSV files.
- `Lynda Library Proejct.sql`: Contains all the SQL queries used for data extraction and analysis in this project.
- `Check_out_Books.csv`: Lists all books currently checked out, including book details, patron details, loan date, and due date.
- `available_books_from_1890.csv`: Lists books published between 1890 and 1899 that are currently available in the library.
- `books_published_each_year.csv`: Shows the count of distinct book titles published each year.
- `most_5_popular_books.csv`: Lists the top 5 most frequently loaned books, along with their author, publication year, and loan count.
- `report_10_patrons_fewest_books.csv`: Identifies the 10 patrons who have borrowed the fewest books.
- `report_13_july.csv`: Report of books due on July 13, 2020, including patron contact information.
- `return_books.csv`: Lists details of returned books, including book information, patron details, and the return date.

## Setup and Usage

### Prerequisites
- Python 3.x
- Pandas library (`pip install pandas`)
- MySQL Server
- `mysql-connector-python` library (`pip install mysql-connector-python`)

### Database Setup
1.  Ensure you have a MySQL server running.
2.  Create a database named `library`.
3.  The necessary tables (`books`, `patrons`, `loans`) and their schema can be inferred from the queries in `Lynda Library Proejct.sql` and the data interaction in `Lynda Library Proejct.ipynb`. You will need to create these tables and populate them with your library data. The notebook connects to the database using parameters like host, username, password, database name, and port. An example connection string used in the notebook is `host = "localhost", username="root", database = "library", port=3306`. You will need to provide your own credentials.

**Important Security Note:** It is strongly recommended *not* to hardcode your database password directly in the notebook or any script. Instead, use secure methods like environment variables, a configuration file that is not committed to version control, or a secrets management system to handle your database credentials.

### Running the Notebook
1.  Update the database connection details in the second cell of the `Lynda Library Proejct.ipynb` notebook if they differ from your setup.
2.  Run the cells in the Jupyter notebook sequentially. The notebook will perform queries and generate/update the CSV files in the project directory.

## Database Schema
Based on the SQL queries, the database likely contains the following tables and columns:

### `books` table
-   `BookID` (Primary Key): Unique identifier for each book.
-   `Title`: Title of the book.
-   `Author`: Author of the book.
-   `Published`: Year the book was published.
-   `Barcode`: Barcode of the book.

### `patrons` table
-   `PatronID` (Primary Key): Unique identifier for each patron.
-   `FirstName`: First name of the patron.
-   `LastName`: Last name of the patron.
-   `Email`: Email address of the patron.
-   (Other columns might exist, e.g., address, phone number, but are not directly used in the provided queries for reporting.)

### `loans` table
-   `LoanID` (Primary Key): Unique identifier for each loan transaction.
-   `BookID` (Foreign Key): References `BookID` in the `books` table.
-   `PatronID` (Foreign Key): References `PatronID` in the `patrons` table.
-   `LoanDate`: Date the book was loaned out.
-   `DueDate`: Date the book is due to be returned.
-   `ReturnedDate`: Actual date the book was returned (nullable, as some books might still be on loan).

## Queries and Reports
The project uses SQL queries executed via a Python script in a Jupyter Notebook to perform various analyses and generate reports. Key operations include:

-   **Book Availability:** Checking the number of copies for specific titles (e.g., 'Dracula') and total books.
-   **Loan Statistics:** Counting total loans.
-   **Adding New Books:** A query for inserting new book records into the `books` table (e.g., 'Atomic Habits').
-   **Checked-Out Books (`Check_out_Books.csv`):** Generates a list of all books currently on loan, including details about the book, the borrowing patron, the loan date, and the due date.
-   **Due Date Reports (e.g., `report_13_july.csv`):** Creates reports for books due on a specific date, providing patron contact information for follow-up.
-   **Returned Books (`return_books.csv`):** Lists books that have been returned, showing book details, patron information, and the date of return.
-   **Patron Activity (`report_10_patrons_fewest_books.csv`):** Identifies the top 10 patrons who have borrowed the fewest books, potentially to encourage library engagement.
-   **Historical Book Features (`available_books_from_1890.csv`):** Generates a list of available books that were published in a specific era (e.g., 1890s), useful for themed events or displays.
-   **Publication Statistics (`books_published_each_year.csv`):** Reports the number of distinct book titles published per year.
-   **Popularity Reports (`most_5_popular_books.csv`):** Identifies the top 5 most borrowed books, indicating their popularity among patrons.

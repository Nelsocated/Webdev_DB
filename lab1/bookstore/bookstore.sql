-- DDL for Regional Bookstore
create table author (
    author_id varchar(10),
    name varchar(50) not null,
    country varchar(30),
    primary key (author_id)
);

create table publisher (
    pub_id varchar(10),
    pub_name varchar(50) not null,
    country varchar(30),
    primary key (pub_id)
);

create table book (
    isbn varchar(15),
    title varchar(100) not null,
    author_id varchar(10),
    pub_id varchar(10),
    genre varchar(20),
    price numeric(5,2),
    primary key (isbn),
    foreign key (author_id) references author,
    foreign key (pub_id) references publisher
);

create table promotion (
    promo_id varchar(10),
    isbn varchar(15),
    promo_month varchar(15),
    discount_pct numeric(4,2),
    primary key (promo_id),
    foreign key (isbn) references book
);

create table store_branch (
    branch_id varchar(10),
    branch_name varchar(50) not null,
    city varchar(30),
    primary key (branch_id)
);

create table inventory (
    branch_id varchar(10),
    isbn varchar(15),
    stock_quantity numeric(4,0),
    primary key (branch_id, isbn),
    foreign key (branch_id) references store_branch,
    foreign key (isbn) references book
);

-- EXTENDED DML: Populating Author Data
insert into author (author_id, name, country) values
('A100', 'Arthur Conan Doyle', 'UK'),
('A101', 'Agatha Christie', 'UK'),
('A102', 'Stephen King', 'USA'),
('A103', 'Haruki Murakami', 'Japan'),
('A104', 'J.K. Rowling', 'UK'),
('A105', 'George R.R. Martin', 'USA'),
('A106', 'Isaac Asimov', 'USA'),
('A107', 'Gabriel Garcia Marquez', 'Colombia');

-- EXTENDED DML: Populating Publisher Data
insert into publisher (pub_id, pub_name, country) values
('PUB1', 'Penguin Classics', 'UK'),
('PUB2', 'Scribner', 'USA'),
('PUB3', 'Vintage', 'USA'),
('PUB4', 'Bloomsbury', 'UK'),
('PUB5', 'Bantam Books', 'USA'),
('PUB6', 'HarperCollins', 'USA');

-- EXTENDED DML: Populating Book Data
insert into book (isbn, title, author_id, pub_id, genre, price) values
('B001', 'A Study in Scarlet', 'A100', 'PUB1', 'Mystery', 9.99),
('B002', 'Murder on the Orient Express', 'A101', 'PUB1', 'Mystery', 12.50),
('B003', 'The Shining', 'A102', 'PUB2', 'Horror', 15.00),
('B004', 'Norwegian Wood', 'A103', 'PUB3', 'Fiction', 14.25),
('B005', 'And Then There Were None', 'A101', 'PUB1', 'Mystery', 11.00),
('B006', 'Harry Potter and the Sorcerers Stone', 'A104', 'PUB4', 'Fantasy', 20.00),
('B007', 'A Game of Thrones', 'A105', 'PUB5', 'Fantasy', 25.00),
('B008', 'Foundation', 'A106', 'PUB2', 'Sci-Fi', 18.50),
('B009', 'I, Robot', 'A106', 'PUB2', 'Sci-Fi', 16.00),
('B010', 'One Hundred Years of Solitude', 'A107', 'PUB6', 'Fiction', 19.95);

-- EXTENDED DML: Populating Promotion Data
insert into promotion (promo_id, isbn, promo_month, discount_pct) values
('PRM1', 'B001', 'August', 10.00),
('PRM2', 'B002', 'August', 15.00),
('PRM3', 'B001', 'September', 5.00),
('PRM4', 'B004', 'September', 20.00),
('PRM5', 'B006', 'October', 10.00),
('PRM6', 'B007', 'October', 15.00),
('PRM7', 'B008', 'November', 25.00),
('PRM8', 'B006', 'December', 30.00);

-- EXTENDED DML: Populating Store Branch Data
insert into store_branch (branch_id, branch_name, city) values
('BR1', 'Downtown Seattle Books', 'Seattle'),
('BR2', 'Portland Reads', 'Portland'),
('BR3', 'Chicago Books', 'Chicago'),
('BR4', 'NYC Reads', 'New York'),
('BR5', 'Miami Booksellers', 'Miami');

-- EXTENDED DML: Populating Inventory Data
insert into inventory (branch_id, isbn, stock_quantity) values
('BR1', 'B001', 12),
('BR1', 'B003', 5),
('BR1', 'B004', 0),
('BR1', 'B006', 40),
('BR1', 'B007', 35),
('BR2', 'B002', 8),
('BR2', 'B003', 15),
('BR2', 'B008', 20),
('BR3', 'B005', 10),
('BR3', 'B009', 14),
('BR3', 'B010', 5),
('BR4', 'B006', 100),
('BR4', 'B007', 80),
('BR4', 'B001', 25),
('BR5', 'B010', 0),
('BR5', 'B008', 12);
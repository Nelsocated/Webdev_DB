-- Create Property_Types Table
CREATE TABLE Property_Types (
    type_id INT PRIMARY KEY,
    type_name VARCHAR(50),
    description VARCHAR(255)
);
-- Create Agents Table
CREATE TABLE Agents (
    agent_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    commission_rate DECIMAL(4, 2)
);
-- Create Clients Table
CREATE TABLE Clients (
    client_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50)
);
-- Create Properties Table
CREATE TABLE Properties (
    property_id INT PRIMARY KEY,
    address VARCHAR(150),
    city VARCHAR(50),
    price DECIMAL(10, 2),
    bedrooms INT,
    type_id INT,
    agent_id INT,
    status VARCHAR(20),
    FOREIGN KEY (type_id) REFERENCES Property_Types(type_id),
    FOREIGN KEY (agent_id) REFERENCES Agents(agent_id)
);
-- Create Transactions Table
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    property_id INT,
    client_id INT,
    sale_price DECIMAL(10, 2),
    sale_date DATE,
    FOREIGN KEY (property_id) REFERENCES Properties(property_id),
    FOREIGN KEY (client_id) REFERENCES Clients(client_id)
);
-- Insert Sample Data into Property_Types
INSERT INTO Property_Types (type_id, type_name, description)
VALUES (
        1,
        'Single Family',
        'Standalone residential home'
    ),
    (2, 'Condo', 'Individual unit within a complex'),
    (3, 'Townhouse', 'Multi-floor attached home');
-- Insert Sample Data into Agents
INSERT INTO Agents (
        agent_id,
        first_name,
        last_name,
        email,
        commission_rate
    )
VALUES (
        10,
        'Samantha',
        'Miller',
        'smiller@realestate.com',
        0.03
    ),
    (
        20,
        'David',
        'Ross',
        'dross@realestate.com',
        0.025
    ),
    (
        30,
        'Elena',
        'Torres',
        'etorres@realestate.com',
        0.03
    );
-- Insert Sample Data into Clients
INSERT INTO Clients (client_id, first_name, last_name, email, city)
VALUES (
        101,
        'Robert',
        'Chen',
        'rchen@gmail.com',
        'Seattle'
    ),
    (
        102,
        'Emily',
        'Watson',
        'ewatson@yahoo.com',
        'Denver'
    ),
    (
        103,
        'Marcus',
        'Vance',
        'mvance@outlook.com',
        'Seattle'
    );
-- Insert Sample Data into Properties
INSERT INTO Properties (
        property_id,
        address,
        city,
        price,
        bedrooms,
        type_id,
        agent_id,
        status
    )
VALUES (
        501,
        '742 Evergreen Terrace',
        'Seattle',
        450000.00,
        3,
        1,
        10,
        'Available'
    ),
    (
        502,
        '100 Sunset Blvd',
        'Denver',
        620000.00,
        4,
        1,
        20,
        'Available'
    ),
    (
        503,
        '123 Ocean Drive',
        'Seattle',
        280000.00,
        2,
        2,
        10,
        'Sold'
    ),
    (
        504,
        '456 Pine Street',
        'Seattle',
        890000.00,
        5,
        1,
        30,
        'Available'
    ),
    (
        505,
        '88 Maple Ave',
        'Denver',
        340000.00,
        3,
        3,
        20,
        'Sold'
    );
-- Insert Sample Data into Transactions
INSERT INTO Transactions (
        transaction_id,
        property_id,
        client_id,
        sale_price,
        sale_date
    )
VALUES (9001, 503, 101, 275000.00, '2023-08-14'),
    (9002, 505, 102, 335000.00, '2023-09-02');
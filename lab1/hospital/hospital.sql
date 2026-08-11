-- DDL for Hospital Appointment System
create table doctor (
    doc_id varchar(10),
    name varchar(50) not null,
    specialty varchar(30),
    salary numeric(10,2),
    primary key (doc_id)
);

create table patient (
    pat_id varchar(10),
    name varchar(50) not null,
    city varchar(30),
    primary key (pat_id)
);

create table appointment (
    app_id varchar(10),
    doc_id varchar(10),
    pat_id varchar(10),
    app_date date,
    diagnosis varchar(100),
    primary key (app_id),
    foreign key (doc_id) references doctor,
    foreign key (pat_id) references patient
);

create table ward (
    ward_id varchar(10),
    ward_name varchar(50) not null,
    capacity numeric(3,0),
    primary key (ward_id)
);

create table admission (
    admission_id varchar(10),
    pat_id varchar(10),
    ward_id varchar(10),
    admit_date date,
    discharge_date date,
    primary key (admission_id),
    foreign key (pat_id) references patient,
    foreign key (ward_id) references ward
);

create table prescription (
    rx_id varchar(10),
    app_id varchar(10),
    medication varchar(50) not null,
    dosage varchar(30),
    primary key (rx_id),
    foreign key (app_id) references appointment
);

-- EXTENDED DML: Populating Doctor Data
insert into doctor (doc_id, name, specialty, salary) values
('D01', 'Dr. Alice Smith', 'Cardiology', 120000.00),
('D02', 'Dr. Bob Jones', 'Neurology', 135000.00),
('D03', 'Dr. Charlie Brown', 'Pediatrics', 95000.00),
('D04', 'Dr. Diana Prince', 'Cardiology', 125000.00),
('D05', 'Dr. Gregory House', 'Diagnostic Medicine', 150000.00),
('D06', 'Dr. Meredith Grey', 'General Surgery', 142000.00),
('D07', 'Dr. John Dorian', 'Internal Medicine', 88000.00),
('D08', 'Dr. Stephen Strange', 'Neurology', 180000.00);

-- EXTENDED DML: Populating Patient Data
insert into patient (pat_id, name, city) values
('P01', 'John Doe', 'Seattle'),
('P02', 'Jane Roe', 'Portland'),
('P03', 'Mary Major', 'Seattle'),
('P04', 'Bruce Wayne', 'Gotham'),
('P05', 'Clark Kent', 'Metropolis'),
('P06', 'Lois Lane', 'Metropolis'),
('P07', 'Peter Parker', 'New York'),
('P08', 'Tony Stark', 'New York');

-- EXTENDED DML: Populating Appointment Data (Includes Nulls)
insert into appointment (app_id, doc_id, pat_id, app_date, diagnosis) values
('A001', 'D01', 'P01', '2026-08-15', 'Hypertension'),
('A002', 'D01', 'P02', '2026-08-16', null),
('A003', 'D03', 'P01', '2026-08-17', 'Routine Checkup'),
('A004', 'D02', 'P03', '2026-08-18', 'Migraine'),
('A005', 'D05', 'P04', '2026-08-19', 'Lupus (Ruled Out)'),
('A006', 'D06', 'P05', '2026-08-20', 'Appendicitis'),
('A007', 'D07', 'P06', '2026-08-21', 'Common Cold'),
('A008', 'D08', 'P07', '2026-08-22', 'Concussion'),
('A009', 'D01', 'P08', '2026-08-23', 'Arrhythmia'),
('A010', 'D05', 'P02', '2026-08-24', null);

-- EXTENDED DML: Populating Ward Data
insert into ward (ward_id, ward_name, capacity) values
('W1', 'General Recovery', 20),
('W2', 'Intensive Care Unit', 10),
('W3', 'Pediatrics Wing', 15),
('W4', 'Psychiatry', 12),
('W5', 'Orthopedics', 18);

-- EXTENDED DML: Populating Admission Data (Includes Nulls)
insert into admission (admission_id, pat_id, ward_id, admit_date, discharge_date) values
('ADM01', 'P01', 'W1', '2026-08-10', '2026-08-14'),
('ADM02', 'P03', 'W2', '2026-08-18', null),
('ADM03', 'P04', 'W4', '2026-08-01', '2026-08-05'),
('ADM04', 'P05', 'W1', '2026-08-20', '2026-08-22'),
('ADM05', 'P08', 'W2', '2026-08-23', null),
('ADM06', 'P07', 'W5', '2026-08-22', null);

-- EXTENDED DML: Populating Prescription Data
insert into prescription (rx_id, app_id, medication, dosage) values
('RX100', 'A001', 'Lisinopril', '10mg daily'),
('RX101', 'A004', 'Sumatriptan', '50mg as needed'),
('RX102', 'A005', 'Prednisone', '20mg daily'),
('RX103', 'A006', 'Amoxicillin', '500mg every 8 hours'),
('RX104', 'A007', 'Ibuprofen', '400mg as needed'),
('RX105', 'A009', 'Amiodarone', '200mg daily');
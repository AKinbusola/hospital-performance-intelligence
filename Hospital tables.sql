DROP TABLE IF EXISTS appointments;
DROP TABLE IF EXISTS physicians;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS patients;

CREATE TYPE gender_enum AS ENUM
(
'Male',
'Female'
);
CREATE TABLE patients (
patient_id SERIAL PRIMARY KEY,
patient_name VARCHAR(50) NOT NULL,
patient_gender gender_enum NOT NULL,
patient_dob DATE NOT NULL,
patient_address TEXT
);


INSERT INTO patients (patient_name, patient_gender, patient_dob, patient_address)
VALUES
('James Carter', 'Male', '1992-04-11', '128 Willow Creek Rd, Denver CO'),
('John Carter', 'Male', '1992-04-11', '128 Willow Creek Rd, Denver CO'),
('Amina Yusuf', 'Female', '1988-09-23', '54 Lakeview Drive, Columbus OH'),
('Victor Hernandez', 'Male', '1995-12-02', '901 Sunset Blvd, Phoenix AZ'),
('Chloe Bennett', 'Female', '1999-03-17', '22 Maple Ridge Ln, Portland OR'),
('Samuel Okoro', 'Male', '1985-07-29', '310 Riverbend St, Houston TX'),
('Linda Park', 'Female', '1991-01-05', '77 Orchard Hill Ave, Seattle WA'),
('Marcus Green', 'Male', '1993-10-14', '450 Pine Forest Rd, Atlanta GA'),
('Naomi Stein', 'Female', '1987-06-08', '19 Crestwood Blvd, Boston MA'),
('Elijah Brooks', 'Male', '2000-11-30', '812 Meadowbrook Ct, Chicago IL'),
('Fatima Ali', 'Female', '1994-02-19', '65 Brookside Way, Minneapolis MN'),
('Daniel Foster', 'Male', '1989-05-26', '204 Oak Hollow Dr, Nashville TN'),
('Sophia Martins', 'Female', '1996-08-12', '93 Highland Park Rd, Miami FL'),
('Kelvin Wright', 'Male', '1983-03-03', '501 Cedar Springs Ln, Charlotte NC'),
('Grace Thompson', 'Female', '1997-12-21', '14 Birchwood Ave, Kansas City MO'),
('Andre Silva', 'Male', '1990-09-01', '700 Redwood Trail, San Diego CA'),
('Hannah O’Connor', 'Female', '1986-04-28', '38 Cloverfield St, Newark NJ'),
('Patrick Johnson', 'Male', '1998-07-15', '120 Evergreen Cir, Detroit MI'),
('Zainab Mohammed', 'Female', '1993-10-09', '59 Valley Crest Rd, Austin TX'),
('Terrence Cole', 'Male', '1984-01-27', '442 Spring Meadow Ln, Baltimore MD'),
('Olivia Reyes', 'Female', '1999-06-04', '75 Horizon Ridge Ct, Las Vegas NV');




CREATE TABLE departments (
department_id SERIAL PRIMARY KEY,
department_name VARCHAR(50) UNIQUE
);

INSERT INTO departments (department_name)
VALUES
('Surgery'),
('Pediatric'),
('Dentistry'),
('Psychiatry'),
('Dermatology');


CREATE TABLE physicians (
physician_id SERIAL PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
department_id INT NOT NULL REFERENCES departments(department_id)
);

INSERT INTO physicians (first_name, last_name, department_id)
VALUES
('Morgan', 'Jackson', 2),
('Victoria', 'Alao', 4),
('Samuel', 'Rivers', 5),
('Chloe', 'Anderson', 1),
('David', 'Okoye', 3),
('Fatima', 'Hassan', 2),
('Marcus', 'Hill', 4),
('Linda', 'Park', 1),
('Elijah', 'Brooks', 5),
('Naomi', 'Stein', 3),
('Terrence', 'Cole', 2),
('Sophia', 'Martins', 4),
('Andre', 'Silva', 1),
('Grace', 'Thompson', 5),
('Kelvin', 'Wright', 3),
('Hannah', 'O’Connor', 2),
('Patrick', 'Johnson', 4),
('Zainab', 'Mohammed', 1),
('Olivia', 'Reyes', 5),
('James', 'Carter', 3);


CREATE TABLE appointments (
appointment_id SERIAL PRIMARY KEY,
physician_id INT NOT NULL REFERENCES physicians(physician_id),
patient_id INT NOT NULL REFERENCES patients(patient_id),
appointment_date DATE NOT NULL,
time_in TIME NOT NULL,
time_out TIME NOT NULL,
CHECK (time_in < time_out)
);

INSERT INTO appointments (physician_id, patient_id, appointment_date, time_in, time_out)
VALUES
(4, 16, '2026-09-10', '14:00:00', '15:00:00'),
(1, 3, '2026-09-11', '09:00:00', '10:00:00'),
(2, 7, '2026-09-11', '10:00:00', '11:00:00'),
(3, 12, '2026-09-11', '11:00:00', '12:00:00'),
(5, 19, '2026-09-11', '13:00:00', '14:00:00'),
(6, 4, '2026-09-11', '15:00:00', '16:00:00'),
(7, 10, '2026-09-12', '09:00:00', '10:00:00'),
(8, 2, '2026-09-12', '10:00:00', '11:00:00'),
(9, 14, '2026-09-12', '11:00:00', '12:00:00'),
(10, 6, '2026-09-12', '13:00:00', '14:00:00'),
(3, 18, '2026-09-12', '15:00:00', '16:00:00'),
(4, 1, '2026-09-13', '09:00:00', '10:00:00'),
(5, 8, '2026-09-13', '10:00:00', '11:00:00'),
(6, 11, '2026-09-13', '11:00:00', '12:00:00'),
(7, 5, '2026-09-13', '13:00:00', '14:00:00'),
(8, 17, '2026-09-13', '15:00:00', '16:00:00'),
(9, 9, '2026-09-14', '09:00:00', '10:00:00'),
(10, 13, '2026-09-14', '10:00:00', '11:00:00'),
(1, 20, '2026-09-14', '11:00:00', '12:00:00'),
(2, 4, '2026-09-14', '13:00:00', '14:00:00'),
(3, 15, '2026-09-14', '15:00:00', '16:00:00'),
(4, 7, '2026-09-15', '09:00:00', '10:00:00'),
(5, 2, '2026-09-15', '10:00:00', '11:00:00'),
(6, 16, '2026-09-15', '11:00:00', '12:00:00'),
(7, 12, '2026-09-15', '13:00:00', '14:00:00'),
(8, 19, '2026-09-15', '15:00:00', '16:00:00'),
(9, 3, '2026-09-16', '09:00:00', '10:00:00'),
(10, 8, '2026-09-16', '10:00:00', '11:00:00'),
(1, 14, '2026-09-16', '11:00:00', '12:00:00'),
(2, 6, '2026-09-16', '13:00:00', '14:00:00'),
(3, 18, '2026-09-16', '15:00:00', '16:00:00'),
(4, 10, '2026-09-17', '09:00:00', '10:00:00'),
(5, 1, '2026-09-17', '10:00:00', '11:00:00'),
(6, 13, '2026-09-17', '11:00:00', '12:00:00'),
(7, 5, '2026-09-17', '13:00:00', '14:00:00'),
(8, 17, '2026-09-17', '15:00:00', '16:00:00'),
(9, 11, '2026-09-18', '09:00:00', '10:00:00'),
(10, 4, '2026-09-18', '10:00:00', '11:00:00'),
(1, 9, '2026-09-18', '11:00:00', '12:00:00'),
(2, 15, '2026-09-18', '13:00:00', '14:00:00'),
(3, 7, '2026-09-18', '15:00:00', '16:00:00'),
(4, 20, '2026-09-19', '09:00:00', '10:00:00'),
(5, 6, '2026-09-19', '10:00:00', '11:00:00'),
(6, 12, '2026-09-19', '11:00:00', '12:00:00'),
(7, 3, '2026-09-19', '13:00:00', '14:00:00'),
(8, 18, '2026-09-19', '15:00:00', '16:00:00');

-- Student Enrollment Database Management System

-- Create the database
CREATE DATABASE student_enrollment;
USE student_enrollment;

-- 1. Departments Table
CREATE TABLE Departments (
    Department_id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL UNIQUE,
    Location VARCHAR(100) NOT NULL
);

-- 2. Students Table
CREATE TABLE Students (
    Student_id INT AUTO_INCREMENT PRIMARY KEY,
    First_name VARCHAR(50) NOT NULL,
    Last_name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Enrollment_date DATE NOT NULL,
    Department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- 3. Courses Table
CREATE TABLE courses (
    Course_id INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Code VARCHAR(20) UNIQUE NOT NULL,
    Department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- 4. Instructors Table
CREATE TABLE Instructors (
    Instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    First_name VARCHAR(50) NOT NULL,
    Last_name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- 5. Enrollment Junction Table (M-M Relationship)
CREATE TABLE Enrollments (
    Enrollment_id INT AUTO_INCREMENT PRIMARY KEY,courses
    Student_id INT NOT NULL,
    Course_id INT NOT NULL,
    Enrollment_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    Grade CHAR(2),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    UNIQUE (student_id, course_id)
);

-- Adding details into the Tables
-- Insert data into Departments
INSERT INTO Departments (Name, Location) VALUES
('Tourism Department', 'Nairobi Campus, Block A'),
('Hospitality Department', 'Nairobi Campus, Block B');

-- Insert Tourism Courses
INSERT INTO Courses (Title, Code, Department_id) VALUES
('Diploma in Tourism Management', 'DTM101', 1),
('Certificate in Wildlife Management', 'CWM102', 1);

-- Insert Hospitality Courses
INSERT INTO Courses (Title, Code, Department_id) VALUES
('Diploma in Culinary Arts', 'DCA201', 2),
('Diploma in Food Nutrition', 'DFN202', 2),
('Certificate in Bakery', 'CBK203', 2);

-- Insert Instructors
INSERT INTO Instructors (First_name, Last_name, Email, Department_id) VALUES
-- Tourism Department Instructors
('Kamau', 'Mwangi', 'kamau.mwangi@school.ac.ke', 1),
('Wanjiru', 'Njoroge', 'wanjiru.njoroge@school.ac.ke', 1),
-- Hospitality Department Instructors
('Auma', 'Ochieng', 'auma.ochieng@school.ac.ke', 2),
('Kipchoge', 'Kenyatta', 'kipchoge.kenyatta@school.ac.ke', 2);

-- Insert Students (10 students with Kenyan names)
INSERT INTO Students (First_name, Last_name, Email, Enrollment_date, Department_id) VALUES
-- Tourism Students
('Njeri', 'Wambui', 'njeri.wambui@student.school.ac.ke', '2023-01-10', 1),
('Maina', 'Gitonga', 'maina.gitonga@student.school.ac.ke', '2023-01-10', 1),
('Akinyi', 'Odhiambo', 'akinyi.odhiambo@student.school.ac.ke', '2023-01-15', 1),
('Mutua', 'Mbithi', 'mutua.mbithi@student.school.ac.ke', '2023-02-05', 1),
('Wairimu', 'Kariuki', 'wairimu.kariuki@student.school.ac.ke', '2023-02-10', 1),
-- Hospitality Students
('Otieno', 'Omondi', 'otieno.omondi@student.school.ac.ke', '2023-01-10', 2),
('Adhiambo', 'Atieno', 'adhiambo.atieno@student.school.ac.ke', '2023-01-15', 2),
('Mumbi', 'Wafula', 'mumbi.wafula@student.school.ac.ke', '2023-02-01', 2),
('Korir', 'Kiprop', 'korir.kiprop@student.school.ac.ke', '2023-02-15', 2),
('Chebet', 'Jepkosgei', 'chebet.jepkosgei@student.school.ac.ke', '2023-03-01', 2);

-- Insert Enrollments
INSERT INTO Enrollments (Student_id, Course_id, Enrollment_date, Grade) VALUES
-- Tourism Department Enrollments
(1, 1, '2023-01-10', 'A-'),  -- Njeri in Diploma in Tourism Management
(1, 2, '2023-01-10', 'B+'),  -- Njeri in Certificate in Wildlife Management
(2, 1, '2023-01-10', 'B'),   -- Maina in Diploma in Tourism Management
(3, 2, '2023-01-15', 'A'),   -- Akinyi in Certificate in Wildlife Management
(4, 1, '2023-02-05', 'C+'),  -- Mutua in Diploma in Tourism Management
(5, 2, '2023-02-10', 'B-'),  -- Wairimu in Certificate in Wildlife Management
-- Hospitality Department Enrollments
(6, 3, '2023-01-10', 'A'),   -- Otieno in Diploma in Culinary Arts
(6, 5, '2023-01-10', 'B+'),  -- Otieno in Certificate in Bakery
(7, 4, '2023-01-15', 'A-'),  -- Adhiambo in Diploma in Food Nutrition
(8, 3, '2023-02-01', 'B'),   -- Mumbi in Diploma in Culinary Arts
(9, 4, '2023-02-15', 'C+'),  -- Korir in Diploma in Food Nutrition
(10, 5, '2023-03-01', 'A');  -- Chebet in Certificate in Bakery
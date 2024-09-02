/*Project: Student Database Management System (PostgreSQL)
Objective: Design and implement a student database management system using PostgreSQL that allows storing and retrieving student information efficiently. The project will include the following tasks:
1. Database Setup
Create a database named "student_database."
Create a table called " student_table" with the following columns: Student_id (integer), Stu_name (text), Department (text), email_id (text), Phone_no (numeric), Address (text), Date_of_birth (date), Gender (text), Major (text), GPA (numeric), Grade (text) should be A,B,C etc.
*/

CREATE TABLE student_table (
    student_id SERIAL PRIMARY KEY,           -- Auto-incrementing primary key
    stu_name TEXT NOT NULL,                 -- Student's name (cannot be null)
    department TEXT,                        -- Department (optional)
    email_id TEXT UNIQUE,                   -- Email address (must be unique)
    phone_no VARCHAR(15),                   -- Phone number (allows for formatting)
    address TEXT,                           -- Address (optional)
    date_of_birth DATE,                     -- Date of birth
    gender TEXT CHECK (gender IN ('Male', 'Female', 'Other')), -- Gender with allowed values
    major TEXT,                             -- Major (optional)
    gpa NUMERIC(3, 2), -- GPA
    grade CHAR(1) CHECK (grade IN ('A', 'B', 'C', 'D', 'E', 'F'))  -- Grade with allowed values
);


-- 2. Insert 10 sample records onto student_table using Insert command.


INSERT INTO student_table (stu_name, department, email_id, phone_no, address, date_of_birth, gender, major, gpa, grade)
VALUES
('Jaffer', 'Computer Science', 'Jaffer@orkut.com', '2343454567', 'Ranji street', '1987-03-15', 'Male', 'Software Engineering', 9.05, 'A'),
('Shewag', 'Mathematics', 'Vshewag319@facebook.com', '3192972191', 'Delhi daredevils St', '1984-07-22', 'Male', 'Applied Mathematics', 8.40, 'B'),
('Rahul Dravid', 'Economics', 'Jammy@indianwall.com', '9871112312', 'India cements road', '1986-02-18', 'Male', 'International Economics', 8.20, 'B'),
('Sachin Tendulkar', 'Biology', 'Littlemaster@God.com', '1001001001', 'Mumbai maidan St', '1988-11-30', 'Male', 'Molecular Biology', 5.70, 'D'),
('Sourav Ganguly', 'Physics', 'Dadagiri@Kolkatha.com', '4567890123', 'Eden gardens', '2000-06-10', 'Male', 'Astrophysics', 7.40, 'C'),
('VVS Laxman', 'Chemistry', 'VVS@Hyderabad.com', '5678901234', 'VVS St', '1990-09-05', 'Male', 'Organic Chemistry', 8.70, 'B'),
('MS Dhoni', 'Engineering', 'Thala@captaincool.com', '7777777777', 'Chepauk stadium', '1987-07-07', 'Male', 'Civil Engineering', 9.20, 'A'),
('Harbajan Singh', 'History', 'Singh@Punjab.com', '8901234567', 'Punjabi St', '2000-10-14', 'Male', 'Modern History', 4.60, 'E'),
('Zaheer Khan', 'Philosophy', 'Newball@mumbai.com', '9012345678', 'LSG admin St', '1987-01-09', 'Male', 'Ethics', 7.90, 'C'),
('Sreeshanth', 'Psychology', 'RRR@Kerala.com', '1123456789', 'KXIP St', '2000-08-27', 'Male', 'Clinical Psychology', 8.80, 'B'),
('Smrithi Mandhana', 'Science', 'RCB@Insta.com', '1343456789', 'Opener St', '2000-03-12', 'Female', 'Theoritical Physics', 7.60, 'C'),
('Jemimah Rodrigues', 'Psychology', 'DC@WPL.com', '1123456789', 'Middle St', '2000-08-05', 'Female', 'Clinical Psychology', 8.50, 'B');

select * from student_table

/* 3. Student Information Retrieval
 Develop a query to retrieve all students' information from the "student_table" and sort them in descending order by their grade. */

SELECT * 
FROM student_table
ORDER BY grade ASC;

/* 4. Query for Male Students:
Implement a query to retrieve information about all male students from the "student_table." */
SELECT *
FROM student_table
WHERE gender = 'Male';

/* 5. Query for Students with GPA less than 5.0
Create a query to fetch the details of students who have a GPA less than 5.0 from the "student_table." */

SELECT *
FROM student_table
WHERE gpa < 5.0;

/* 6. Update Student Email and Grade
Write an update statement to modify the email and grade of a student with a specific ID in the "student_table." */

UPDATE student_table
SET email_id = 'FormerIndiaplayer@ICC.com',  
    grade = 'B',
	gpa = '8.90' -- Also changed gpa as B grade should be between 9-8.5 (Previously the student had it was 9.05)
WHERE student_id = 1;                 

--  to show the changes

SELECT *
FROM student_table
WHERE student_id = 1;


/* 7. Query for Students with Grade "B"
Develop a query to retrieve the names and ages of all students who have a grade of "B" from the "student_table." */

SELECT stu_name,
       EXTRACT(YEAR FROM AGE(date_of_birth)) AS age
FROM student_table
WHERE grade = 'B';


/* 8. Grouping and Calculation 
Create a query to group the "student_table" by the "Department" and "Gender" columns and calculate the average GPA for each combination. */

SELECT department,
       gender,
       ROUND(AVG(gpa), 2) AS average_gpa
FROM student_table
GROUP BY department, gender
ORDER BY department, gender;

/* 9. Table Renaming
Rename the "student_table" to "student_info" using the appropriate SQL statement. */

ALTER TABLE student_table
RENAME TO student_info;

/* 10. Retrieve Student with Highest GPA
Write a query to retrieve the name of the student with the highest GPA from the "student_info" table. */

SELECT stu_name
FROM student_info
ORDER BY GPA DESC
LIMIT 1;

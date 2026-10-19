--                    ============================================================
--                        Assignment 1 : University Course Management System    
--                    ============================================================


-- Creating Database for Unviersity Project :
CREATE DATABASE Unviversity_Management;

-- Creating Tables :
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Instructors;
DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Departments;


--------------------- Creating Department Table ---------------------

CREATE TABLE Departments(
        Department_ID VARCHAR PRIMARY KEY,
		Department_Name VARCHAR (100) NOT NULL
);		


------------ Creating Student Table ---------------

CREATE TABLE Students(
        Student_ID SERIAL PRIMARY KEY,
		First_Name VARCHAR (100) NOT NULL,
		Last_Name VARCHAR (100) NOT NULL,
		Email VARCHAR (200) UNIQUE,
		Birth_Date DATE,
		Enrollment_Date DATE
);


---------------- Creating Courses Table ----------------

CREATE TABLE Courses(
        Course_ID VARCHAR (20) PRIMARY KEY,
		Course_Name	VARCHAR (100) NOT NULL,
		Department_ID VARCHAR (100) NOT NULL,
		Credits INT NOT NULL,
		    CONSTRAINT fk_Courses_Department
			   FOREIGN KEY (Department_ID)
			   REFERENCES Departments(Department_ID)
			   ON DELETE CASCADE
);


--------------------- Creating Instructor Table ----------------------

CREATE TABLE Instructors(
        Instructor_ID SERIAL PRIMARY KEY,
		First_Name VARCHAR (100) NOT NULL,
	    Last_Name VARCHAR (100) NOT NULL,
		Email VARCHAR (200) UNIQUE,
        Department_ID VARCHAR (100) NOT NULL,
		     CONSTRAINT fk_Instructor_Departement 
		         FOREIGN KEY (Department_ID)
				 REFERENCES Departments(Department_ID)
				 ON DELETE SET NULL
);		


--------------------- Creating Enrollments Table ------------------------

CREATE TABLE Enrollments(
        Enrollment_ID SERIAL PRIMARY KEY,
		Student_ID INT NOT NULL,
		Course_ID VARCHAR (20) NOT NULL,
		Enrollment_Date DATE,
		   CONSTRAINT fk_Enrollments_Student
		      FOREIGN KEY (student_ID)
			  REFERENCES Students(student_ID)
			  ON DELETE CASCADE,		  
		   CONSTRAINT fk_Enrollments_Course
		      FOREIGN KEY (Course_ID)
			  REFERENCES Courses(Course_ID)
			  ON DELETE CASCADE
);




------------------------------------------ INSERTING VALUES ---------------------------------------------


-- Department Table :

INSERT INTO Departments (Department_ID, Department_Name)
   VALUES ('1', 'Computer Science'),
          ('2', 'Information Technology'),
          ('3', 'Mechanical Engineering'),
          ('4', 'Civil Engineering'),
          ('5', 'Electrical Engineering'),
          ('6', 'Electronics'),
          ('7', 'Mathematics'),
          ('8', 'Physics'),
          ('9', 'Chemistry'),
          ('10', 'Management');


-- Student Table :

INSERT INTO Students (Student_ID, First_Name, Last_Name, Email, Birth_Date, Enrollment_Date)
   VALUES ('1', 'John', 'Doe', 'john.doe@email.com', '2000-01-15', '2022-08-01'),
          ('2', 'Jane', 'Smith', 'jane.smith@email.com', '1999-05-25', '2021-08-01'),
		  ('3', 'Rahul', 'Sharma', 'rahul.sharma@gmail.com', '2003-05-14', '2020-07-15'),
          ('4', 'Priya', 'Verma', 'priya.verma@gmail.com', '2004-02-20', '2021-09-10'),
          ('5', 'Aman', 'Singh', 'aman.singh@gmail.com', '2002-11-08', '2022-04-20'),
          ('6', 'Sneha', 'Gupta', 'sneha.gupta@gmail.com', '2003-09-25', '2023-08-05'),
          ('7', 'Rohit', 'Kumar', 'rohit.kumar@gmail.com', '2004-04-12', '2024-02-12'),
          ('8', 'Anjali', 'Yadav', 'anjali.yadav@gmail.com', '2003-12-03', '2020-08-01'),
          ('9', 'Vikas', 'Mishra', 'vikas.mishra@gmail.com', '2002-06-18', '2021-11-25'),
          ('10', 'Pooja', 'Patel', 'pooja.patel@gmail.com', '2004-01-30', '2022-08-15'),
          ('11', 'Arjun', 'Mehta', 'arjun.mehta@gmail.com', '2003-07-09', '2023-12-18'),
          ('12', 'Neha', 'Joshi', 'neha.joshi@gmail.com', '2004-10-22', '2024-08-08');


-- Courses Table :

INSERT INTO Courses (Course_ID, Course_Name, Department_ID, Credits)
   VALUES ('101', 'Introduction to SQL', '1', '3'),
          ('102', 'Data Stucture', '2', '4'),
          ('103', 'Btech Mechanical Engineering', '3', '5'),
          ('104', 'M.E. Civil Engineering', '4', '6'),
          ('105', 'Mtech Electrical Engineering', '5', '4'),
          ('106', 'VLSI Designing', '6', '3'),
          ('107', 'Statistics', '7', '7'),
          ('108', 'Ray Optics', '8', '5');

-- Instructor Table :

INSERT INTO Instructors (Instructor_ID, First_Name, Last_Name, Email, Department_ID)
   VALUES ('1', 'Alice', 'Johnson', 'alice.johnson@univ.com', '1'),
          ('2', 'Bob', 'Lee', 'bob.lee@univ.com', '2'),
          ('3', 'Amit', 'Sharma', 'amit.sharma@gmail.com', '3'),
          ('4', 'Priya', 'Verma', 'priya.verma@gmail.com', '4'),
          ('5', 'Rajesh', 'Singh', 'rajesh.singh@gmail.com', '5'),
          ('6', 'Neha', 'Gupta', 'neha.gupta@gmail.com', '6'),
          ('7', 'Vikram', 'Kumar', 'vikram.kumar@gmail.com', '7');



-- Enrollment Table :

INSERT INTO Enrollments (Enrollment_ID, Student_ID, Course_ID, Enrollment_Date)
   VALUES ('1', '1', '101', '2022-08-01'),
          ('2', '2', '102', '2021-08-01'),
          ('3', '3', '103', '2020-07-15'),
          ('4', '4', '104', '2021-08-10'),
          ('5', '5', '105', '2022-09-20'),
          ('6', '6', '106', '2023-04-05'),
          ('7', '7', '107', '2024-11-12'),
          ('8', '8', '108', '2020-08-01'),
          ('9', '9', '103', '2021-07-25'),
          ('10', '10', '102', '2022-02-15'),
          ('11', '11', '108', '2023-06-18'),
          ('12', '12', '103', '2024-08-08'),
          ('13', '11', '107', '2021-03-20'),
          ('14', '9', '108', '2022-11-12'),
          ('15', '4', '101', '2023-07-10'),
          ('16', '2', '105', '2024-08-18'),
          ('17', '5', '104', '2020-05-22'),
          ('18', '1', '106', '2021-06-05'),
          ('19', '3', '102', '2022-05-14'),
          ('20', '6', '107', '2023-10-20'),
          ('21', '7', '105', '2024-07-25'),
          ('22', '12', '108', '2020-08-15');




--------------------------------------- Data Insertion Compelete ----------------------------------------


-- QUERRIES TO PERFORM :
 
-- 1. Perform CRUD Operations on all tables.

--------- On Student Table:-----------------------------

------- Assumtion : I have Taken the Random Values to perform CRUD.
                 -- Student_ID : 13
                 -- First_Name : Rahul
				 -- Last_Name : Kumar 
				 -- Email : rahul.kumar@gmail.com
				 -- Birth_Date : 2001-02-14
				 --Enrollment_Date : 2021-09-17. 

-- Create :
Insert Into Students (Student_ID, First_Name, Last_Name, Email, Birth_Date, Enrollment_Date)
   Values ('13', 'Rahul', 'Kumar', 'rahul.kumar@gmail.com', '2001-02-14', '2021-09-17');

-- I have Inserted the New Values.   

-- Read :
Select
*
From Students;

-- I have checked that the Inserted Value is Showing or not.

----------- Asuumtion : I am Updating Last_Name of Rahul from 'Kumar' to 'Singh'.
-- Update :
Update Students
Set Last_Name = 'Singh'
Where Student_ID = (13);

Select
*
From Students
Where Student_ID = (13);

-- I have updated the Last Name of Rahul.

-- Delete :
Delete
From Students
Where Student_ID = (13);

Select 
*
From Students 
Where Student_ID = (13);

-- I have Deleted the Record of Inserted Value.


--------- On Department Table:-----------------------------

------- Assumtion : I have Taken the Random Values to perform CRUD.
                 -- Department_ID : 11
                 -- Department_Name : Economics

-- Create :
INSERT INTO Departments (Department_ID, Department_Name)
   VALUES ('11', 'Economics');
   
-- I have Inserted the New Values.   

-- Read :
Select
*
From Departments;

-- I have checked that the Inserted Value is Showing or not.

----------- Asuumtion : I am Updating Department_Name of Department_ID 3 from 'Economics' to 'History'.
-- Update :
Update Departments
Set Department_Name = 'History'
Where Department_ID = '11';

Select
*
From Departments
Where Department_ID = '11';

-- I have updated the Last Name of Rahul.

-- Delete :
Delete
From Departments
Where Department_ID = '11';

Select 
*
From Departments
Where Department_ID = '11';
				 
-- I have Deleted the Record of Inserted Value.


--------- On Courses Table:-----------------------------

------- Assumtion : I have Taken the Random Values to perform CRUD.
                 -- Course_ID : 109
                 -- Course_Name : Digital Marketing
				 -- Department_ID : 9
				 -- Credits : 5

-- Create :
INSERT INTO Courses (Course_ID, Course_Name, Department_ID, Credits)
   Values ('109', 'Digital Marketing', '3', '9');

-- I have Inserted the New Values.   

-- Read :
Select
*
From Courses;

-- I have checked that the Inserted Value is Showing or not.

----------- Asuumtion : I am Updating Credits of Course_ID 103 from '5' to '2'.
-- Update :
Update Courses
Set Credits = '2'
Where Course_ID = '109';

Select
*
From Courses
Where Course_ID = '109';

-- I have updated the Last Name of Rahul.

-- Delete :
Delete
From Courses
Where Course_ID = '109';

Select 
*
From Courses
Where Course_ID = '109';
				 
-- I have Deleted the Record of Inserted Value.


--------- On Instructor Table:-----------------------------

------- Assumtion : I have Taken the Random Values to perform CRUD.
                 -- Instructor_ID : 8
                 -- First_Name : James
				 -- Last_Name : Bond
				 -- Email : james.bond@gmail.com
				 -- Department_ID : 8
				 
--Create :
Insert Into Instructors(Instructor_ID, First_Name, Last_Name, Email, Department_ID)
   Values ('8', 'James', 'Bond', 'james.bond@gmail.com', '8');

-- I have Inserted the New Values.   

--Read :
Select
*
From Instructors;

-- I have checked that the Inserted Value is Showing or not.

----------- Asuumtion : I am Updating Last_Name of James from 'Bond' to 'Anderson'.
-- Update :
Update Instructors
Set Last_Name = 'Anderson'
Where First_Name = 'James';

Select
*
From Instructors
Where First_Name = 'James';

-- I have updated the Last Name of Rahul.

-- Delete :
Delete
From Instructors
Where First_Name = 'James';

Select
*
From Instructors
Where First_Name = 'James';


-- Note : Now we can delete that Inserted Department Row.


--------- On Enrollment Table:-----------------------------

------- Assumtion : I have Taken the Random Values to perform CRUD.
                 -- Student_ID : 3
                 -- Enrollment_ID : 23
				 -- Course_ID : 103
				 --Enrollment_Date : 2021-09-17. 

-- Create :
INSERT INTO Enrollments (Enrollment_ID, Student_ID, Course_ID, Enrollment_Date)
   VALUES ('23', '3', '103', '2021-09-17');
		  
-- I have Inserted the New Values.   

-- Read :
Select
*
From Enrollments;

-- I have checked that the Inserted Value is Showing or not.

----------- Asuumtion : I am Updating Enrollment_Date of Enrollment_ID 3 from '2021-09-17' to '2020-08-18'.
-- Update :
Update Enrollments
Set Enrollment_Date = '2020-08-18'
Where Enrollment_ID = '23';

Select
*
From Enrollments
Where Enrollment_ID = '23';

-- I have updated the Last Name of Rahul.

-- Delete :
Delete
From Enrollments
Where Enrollment_ID = '23';

Select 
*
From Enrollments
Where Enrollment_ID = '23';

-- I have Deleted the Record of Inserted Value.

-- Note : Now we can Delete all the Re-inserted Rows Again.

--------------------------------------------------------------------------------------------------------------------------------------------------


-- 2. Retrieve students who enrolled after 2022.

Select 
*
From Enrollments
Where Enrollment_Date >= '01-01-2023';

-----------------------------------------------------------------------------------------------------------------------------------


-- 3. Retrieve courses offered by the Mathematics department with a limit of 5 courses.

Select d.Department_Name, c.Course_Name
From Courses c
Join Departments d
	On c.Department_ID = d.Department_ID
Where d.department_Name = 'Mathematics'
Limit 5;

-- My Data have Only one Course offered by Mathematics Department.

---------------------------------------------------------------------------------------------------------------


-- 4. Get the number of students enrolled in each course, filtering for courses with more than 5 students.

Select c.Course_Name, 
	Count(Distinct e.Student_ID) As Total_Students
From Courses c
Join Enrollments e 
	On c.Course_ID = e.Course_ID
Group By c.Course_Name
    Having Count(Distinct e.Student_ID) > 5;

-- My Data Dosen't have more than 5 students for a particular Course.

--------------------------------------------------------------------------------------------------------------------


-- 5. Find students who are enrolled in both Introduction to SQL and Data Structures.

Select s.Student_Id, s.First_Name, s.Last_Name
From Students s
Join Enrollments e 
	On s.Student_ID = e.Student_ID
Join Courses c
	On e.Course_ID = c.Course_ID
Where c.Course_Name 
	In ('Introduction to SQL', 'Data Structure')
Group By s.Student_Id, s.First_Name, s.Last_Name
Having Count(Distinct Course_Name) = 2;

-- My data has no Student who enrolled in both Courses.

------------------------------------------------------------------------------------------------------------------


-- 6. Find students who are either enrolled in Introduction to SQL or Data Structures.

Select s.Student_Id, s.First_Name, s.Last_Name
From Students s
Join Enrollments e 
	On s.Student_ID = e.Student_ID
Join Courses c
	On e.Course_ID = c.Course_ID
Where c.Course_Name 
	In ('Introduction to SQL', 'Data Structure')
Group By s.Student_Id, s.First_Name, s.Last_Name;

------------------------------------------------------------------------------------------------------------


-- 7. Calculate the average number of credits for all courses.

SELECT Round(AVG(Credits),2) AS Average_Credits
FROM Courses;

------------------------------------------------------------------------------------------------------------


-- 8. Find the maximum salary of instructors in the Computer Science department.

-- My Data doesn't have Salary Column so I have Inserted the Column by Alter Table.

Alter Table Instructors
ADD COLUMN Salary DECIMAL (10,2);


-- Now We will update the Column Values one by One.

Update Instructors
Set Salary = 20000
Where Instructor_ID = 1;

Update Instructors
Set Salary = 30000
Where Instructor_ID = 2;

Update Instructors
Set Salary = 40000
Where Instructor_ID = 3;

Update Instructors
Set Salary = 50000
Where Instructor_ID = 4;

Update Instructors
Set Salary = 10000
Where Instructor_ID = 5;

Update Instructors
Set Salary = 80000
Where Instructor_ID = 6;

Update Instructors
Set Salary = 60000
Where Instructor_ID = 7;


-- Now we will Check that our Column is appering or not.

Select 
*
From Instructors;

-- Now we Will Find the Maximum Salary :

Select Max(i.Salary) As MaximumSalary
From Instructors i
Join Departments d
On i.Department_ID = d.Department_ID
Where d.Department_Name = 'Computer Science';

-----------------------------------------------------------------------------------------------------------------------


-- 9. Count the number of students enrolled in each department.

Select d.Department_ID, d.Department_Name,
       Count(Distinct e.Student_ID) As TotalStudents
From Departments d
Join Courses c 
	On d.Department_ID = c.Department_ID
Join Enrollments e
	On c.Course_ID = e.Course_ID
Group By d.Department_Name, d.Department_ID;

-----------------------------------------------------------------------------------------------------------------------


-- 10. INNER JOIN: Retrieve students and their corresponding courses.

Select s.First_Name, s.Last_Name, c.Course_Name
From Students s
Inner Join Enrollments e
On s.Student_ID = e.Student_ID
Inner Join Courses c
On e.Course_Id = c.Course_ID
Order By s.First_Name, s.Last_Name, c.Course_Name;

-------------------------------------------------------------------------------------------------------------------------


-- 11. LEFT JOIN: Retrieve all students and their corresponding courses, if any.

Select s.First_Name, s.Last_Name, c.Course_Name
From Students s
Left Join Enrollments e
On s.Student_ID = e.Student_ID
Left Join Courses c
On e.Course_Id = c.Course_ID
Order By s.First_Name, s.Last_Name, c.Course_Name;

-------------------------------------------------------------------------------------------------------------------------


-- 12. Subquery: Find students enrolled in courses that have more than 10 students.

Select First_Name, Last_Name
From Students
Where Student_ID
In (Select Student_ID From Enrollments Where Course_ID 
      In (Select Course_ID From Enrollments 
	       Group By Course_ID 
		   Having Count (Distinct Student_ID)>10));

-- My Data dosen't have any course in which more than 10 students have enrolled.


-------------------- Alternative Way -------------------------

-- Select s.Student_ID, s.First_Name, s.Last_Name
-- From Students s
-- Join Enrollments e
--     On s.Student_ID = e.Student_ID
-- Where e.Course_ID In (
--     Select Course_ID
--     From Enrollments
--     Group By Course_ID
--     Having Count(Distinct Student_ID) > 10);

------------------------------------------------------------------------------------------------------------------------


-- 13. Extract the year from the EnrollmentDate of students.

Select Student_ID, First_Name, Last_Name,
Extract (Year From Enrollment_Date) As Enrollment_Year
From Students;

------------------------------------------------------------------------------------------------------------------------


-- 14. Concatenate the instructor's first and last name.

Select Concat (First_Name, ' ', Last_Name)
As Full_Name
From Instructors;

-----------------------------------------------------------------------------------------------------------------------


-- 15. Calculate the running total of students enrolled in courses.

Select Enrollment_ID, Student_ID, Course_ID,
    Count(*)
       Over(Order By Enrollment_ID)
	   As Running_Total_Students
From Enrollments
Order By Enrollment_ID;

---------------------------------------------------------------------------------------------------------------------------


-- 16. Label students as 'Senior' or 'Junior' based on their year of enrollment. (If the enrollment date is more than 4
--     years from the current date, put the label 'Senior' otherwise 'Junior')

Select Student_ID, First_Name, Last_Name, Enrollment_Date,
Case
     When Enrollment_Date < Current_Date - Interval '4 Years'
	 Then 'Senior'
	 Else 'Junior'
 	 End As Student_Exp
From Students;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                         \\\\\\\\\\\\\\\\\\\\\    END    /////////////////////                                                               
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

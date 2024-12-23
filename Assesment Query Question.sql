DROP DATABASE studentdb;

CREATE DATABASE studentdb;

USE studentdb

CREATE TABLE studentpersonal (
  studentId INT(11) NOT NULL AUTO_INCREMENT,
  firstname VARCHAR(50) DEFAULT NULL,
  lastname VARCHAR(50) DEFAULT NULL,
  fathername VARCHAR(50) DEFAULT NULL,
  mothername VARCHAR(50) DEFAULT NULL,
  email VARCHAR(50) DEFAULT NULL,
  phonenumber VARCHAR(15) DEFAULT NULL,
  city VARCHAR(50) DEFAULT NULL,
  areas VARCHAR(50) DEFAULT NULL,
  fulladdress TEXT DEFAULT NULL,
  bloodgroup VARCHAR(10) DEFAULT NULL,
  religion VARCHAR(50) DEFAULT NULL,
  Gender VARCHAR(10) DEFAULT NULL,
  PRIMARY KEY (studentId)
)
SELECT * FROM studentpersonal;

DROP TABLE studentpersonal

SELECT firstname, lastname, phonenumber, fulladdress FROM studentpersonal WHERE bloodgroup IN ("O+","A-");


INSERT  INTO `studentpersonal`(`studentId`,`firstname`,`lastname`,`fathername`,`mothername`,`email`,`phonenumber`,`city`,`areas`,`fulladdress`,`bloodgroup`,`religion`,`Gender`) VALUES 
(1,'John','Doe','Michael Doe','Jane Doe','john@test.com','1572698','New York','Manhattan','123 5th Avenue, Manhattan, New York, NY 10001','O+','Christian','Male'),
(2,'Emily','Smith','Robert Smith','Sarah Smith','emily@test.com','2597888','Los Angeles','Downtown','456 Sunset Boulevard, Downtown, Los Angeles, CA 90001','A-','Christian','Female'),
(3,'Mohammed','Khan','Abdul Khan','Fatima Khan','mdkhan@test.com','1598777','Houston','Westside','789 Richmond Avenue, Westside, Houston, TX 77042','B+','Muslim','Male'),
(4,'Priya','Patel','Raj Patel','Anita Patel','priya@test.com','1024957','Chicago','Lincoln Park','1010 Fullerton Ave, Lincoln Park, Chicago, IL 60614','AB+','Hindu','Female'),
(5,'Chen','Lee','Yuan Lee','Mei Lee','lee@test.com','1326444','San Francisco','Chinatown','1212 Grant Ave, Chinatown, San Francisco, CA 94133','O-','Buddhist','Male'),
(6,'Alice','Green','John Green','Emily Green','alice@test.com','1879541','Boston','Back Bay','123 Commonwealth Ave, Back Bay, Boston, MA 02116','A+','Christian','Male'),
(7,'Ryan','White','David White','Linda White','ryan@test.com','1364592','Seattle','Capitol Hill','456 Broadway E, Capitol Hill, Seattle, WA 98102','O-','Christian','Male'),
(8,'Ibrahim','Hussain','Muhammad Hussain','Amina Hussain','ibrahim@test.com','1247496','New York','Oak Lawn','789 Oak Lawn Ave, Oak Lawn, Dallas, TX 75219','B-','Muslim','Male'),
(9,'Priya','Rao','Suresh Rao','Lakshmi Rao','priyarao@test.com','1248976','San Diego','La Jolla','1010 Prospect St, La Jolla, San Diego, CA 92037','AB+','Hindu','Female'),
(10,'Yuki','Tanaka','Kenji Tanaka','Mika Tanaka','yuki@test.com','2345796','Chicago','Japantown','1212 Jackson St, Japantown, San Jose, CA 95112','A-','Buddhist','Male');

DROP TABLE subjects

CREATE TABLE subjects (
  subjectCode VARCHAR(10) NOT NULL,
  subjectTitle VARCHAR(100) NOT NULL,
  departmentCode VARCHAR(10) DEFAULT NULL,
  teacherId INT NOT NULL,
  PRIMARY KEY (subjectCode),
  FOREIGN KEY (departmentCode) REFERENCES departments(departmentCode),
  FOREIGN KEY (teacherId) REFERENCES teachers(teacherId)
)
SELECT departmentName,departmentCode,subjectTitle FROM departments WHERE subjectCode="EE102"

TRUNCATE TABLE subjects;

SELECT * FROM subjects;

INSERT INTO subjects (subjectCode, subjectTitle, departmentCode, teacherId) VALUES
('BT201', 'Genetics', 'BT105', 1),
('CE201', 'Structural Engineering', 'CE104', 2),
('CE202', 'Construction Materials', 'CE104', 2),
('CS201', 'Introduction to Programming', 'CS101', 3),
('CS202', 'Data Structures', 'CS101', 3),
('CS203', 'Algorithms', 'CS101', 3),
('EE201', 'Circuit Analysis', 'EE102', 4),
('EE202', 'Electromagnetics', 'EE102', 4),
('ME201', 'Thermodynamics', 'ME103', 5),
('ME202', 'Fluid Mechanics', 'ME103', 5);

-- Ensure the tables use InnoDB engine
SHOW TABLE STATUS LIKE 'studentpersonal';
SHOW TABLE STATUS LIKE 'subjects';

SHOW CREATE TABLE studentpersonal;
SHOW CREATE TABLE subjects;
SHOW CREATE TABLE student_subjects;


DROP TABLE student_subjects

CREATE TABLE student_subjects (
  studentId INT(11) NOT NULL,
  subjectCode VARCHAR(10) NOT NULL,
  subjectTitle VARCHAR(100) NOT NULL,
  PRIMARY KEY (studentId, subjectCode),
  FOREIGN KEY (studentId) REFERENCES studentpersonal(studentId)
);

SELECT * FROM student_subjects;
SELECT subjectCode FROM subjects;

TRUNCATE TABLE student_subjects;

INSERT INTO student_subjects (studentId, subjectCode, subjectTitle) VALUES 
(1, 'BT201', 'Genetics'),
(2, 'CE201', 'Structural Engineering'),
(3, 'CE202', 'Construction Materials'),
(4, 'CS201', 'Introduction to Programming'),
(5, 'ME201', 'Thermodynamics'),
(6, 'CS203', 'Algorithms');


DROP TABLE departments

CREATE TABLE `departments` (
  `departmentCode` VARCHAR(10) NOT NULL,
  `departmentName` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`departmentCode`)
)

SELECT * FROM departments;

INSERT  INTO departments(departmentCode,departmentName) VALUES 
('BT105','Biotechnology'),
('CE104','Civil Engineering'),
('CS101','Computer Science'),
('EE102','Electrical Engineering'),
('ME103','Mechanical Engineering');


CREATE TABLE courses (
  studentId VARCHAR(15) NOT NULL,
  subjectCode VARCHAR(50) NOT NULL,
  PRIMARY KEY (studentId, subjectCode),
  KEY subjectCode (subjectCode)
) 

SELECT * FROM courses;
DROP TABLE courses

INSERT  INTO courses(studentId,subjectCode) VALUES 
('1','CS201'),
('1','CS202'),
('2','CE201'),
('2','CS203');

/*Table structure for table `payment` */

DROP TABLE IF EXISTS payment;

CREATE TABLE payment (
  paymentId VARCHAR(100) NOT NULL,
  studentId INT(11) DEFAULT NULL,
  amount DECIMAL(10,2) DEFAULT NULL,
  paymentDate DATE DEFAULT NULL,
  PRIMARY KEY (paymentId)
  );
  
  SELECT * FROM payment;
  /*Data for the table `payment` */

INSERT  INTO `payment`(`paymentId`,`studentId`,`amount`,`paymentDate`) VALUES 
('TXN1001',1,500.00,'2024-01-15'),
('TXN1002',2,600.00,'2024-01-16'),
('TXN1003',3,700.00,'2024-01-17'),
('TXN1004',4,800.00,'2024-01-18'),
('TXN1005',5,500.00,'2024-01-19'),
('TXN1006',6,500.00,'2024-01-20'),
('TXN1008',8,700.00,'2024-01-22'),
('TXN1009',9,800.00,'2024-01-23');
  
  /*Table structure for table `studentacademic` */

DROP TABLE IF EXISTS `studentacademic`;

CREATE TABLE `studentacademic` (
  `studentId` INT(11) NOT NULL,
  `departmentCode` VARCHAR(10) DEFAULT NULL,
  `session` VARCHAR(20) DEFAULT NULL,
  `semester` INT(11) DEFAULT NULL,
  `totalSemesterFees` DECIMAL(10,2) DEFAULT NULL,
  PRIMARY KEY (`studentId`),
  KEY `departmentCode` (`departmentCode`),
  CONSTRAINT `studentacademic_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `studentpersonal` (`studentId`) ON DELETE CASCADE,
  CONSTRAINT `studentacademic_ibfk_2` FOREIGN KEY (`departmentCode`) REFERENCES `departments` (`departmentCode`) ON DELETE SET NULL
) 
SELECT*FROM studentacademic

/*Data for the table `studentacademic` */

INSERT  INTO `studentacademic`(`studentId`,`departmentCode`,`session`,`semester`,`totalSemesterFees`) VALUES 
(1,'CS101','2023-2024',1,1500.00),
(2,'EE102','2022-2023',2,1600.00),
(3,'ME103','2023-2024',1,1700.00),
(4,'CE104','2021-2022',3,1800.00),
(5,'CS101','2023-2024',2,1500.00),
(6,'CS101','2023-2024',1,1500.00),
(7,'EE102','2022-2023',2,1600.00),
(8,'ME103','2023-2024',1,1400.00),
(9,'CE104','2021-2022',3,2200.00),
(10,'EE102','2023-2024',2,1500.00);

DROP TABLE IF EXISTS `student_semester_fees`;

CREATE TABLE student_semester_fees (
  feeId INT AUTO_INCREMENT,
  studentId INT(11) NOT NULL,
  feeAmount DECIMAL(10, 2),
  departmentCode VARCHAR(10) NOT NULL,
  PRIMARY KEY (feeId, departmentCode),
  FOREIGN KEY (studentId) REFERENCES studentpersonal(studentId)
);
SELECT * FROM student_semester_fees;

DESCRIBE student_semester_fees;

/*Data for the table `student_semester_fees` */

INSERT INTO student_semester_fees (studentId, feeAmount, departmentCode) VALUES
(1, 5000.00, 'CS101'),
(2, 4500.00, 'CS101'),
(3, 6000.00, 'EE102'),
(4, 5500.00, 'CS101');

/*Table structure for table `teacheracademic` */

DROP TABLE IF EXISTS `teacheracademic`;

CREATE TABLE `teacheracademic` (
  `teacherId` INT(11) NOT NULL,
  `departmentCode` VARCHAR(10) DEFAULT NULL,
  `Designation` VARCHAR(50) DEFAULT NULL,
  `salary` DECIMAL(10,2) DEFAULT NULL,
  PRIMARY KEY (`teacherId`),
  KEY `departmentCode` (`departmentCode`),
  CONSTRAINT `teacheracademic_ibfk_1` FOREIGN KEY (`teacherId`) REFERENCES `teacherpersonal` (`teacherId`) ON DELETE CASCADE,
  CONSTRAINT `teacheracademic_ibfk_2` FOREIGN KEY (`departmentCode`) REFERENCES `departments` (`departmentCode`) ON DELETE SET NULL
) 

SELECT*FROM teacheracademic;

/*Data for the table `teacheracademic` */

INSERT  INTO `teacheracademic`(`teacherId`,`departmentCode`,`Designation`,`salary`) VALUES 
(1,'CS101','Sr. Lecturer',5500.00),
(2,'EE102','Sr. Lecturer',5400.00),
(3,'ME103','Lecturer',5300.00),
(4,'CE104','Lecturer',5100.00),
(5,'BT105','Associate Professor',6000.00);

/*Table structure for table `teacherpersonal` */

DROP TABLE IF EXISTS `teacherpersonal`;

CREATE TABLE `teacherpersonal` (
  `teacherId` INT(11) NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(50) DEFAULT NULL,
  `lastname` VARCHAR(50) DEFAULT NULL,
  `fathername` VARCHAR(50) DEFAULT NULL,
  `mothername` VARCHAR(50) DEFAULT NULL,
  `city` VARCHAR(50) DEFAULT NULL,
  `area` VARCHAR(50) DEFAULT NULL,
  `fulladdress` TEXT DEFAULT NULL,
  `bloodgroup` VARCHAR(10) DEFAULT NULL,
  `religion` VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (`teacherId`)
);

SELECT*FROM teacherpersonal;

/*Data for the table `teacherpersonal` */

INSERT  INTO `teacherpersonal`(`teacherId`,`firstname`,`lastname`,`fathername`,`mothername`,`city`,`area`,`fulladdress`,`bloodgroup`,`religion`) VALUES 
(1,'David','Johnson','Mark Johnson','Laura Johnson','New York','Manhattan','123 6th Avenue, Manhattan, New York, NY 10001','O+','Christian'),
(2,'Sarah','Brown','Thomas Brown','Nancy Brown','Los Angeles','Hollywood','789 Hollywood Blvd, Los Angeles, CA 90028','A-','Christian'),
(3,'Ahmed','Ali','Hassan Ali','Fatima Ali','Houston','Downtown','101 Main St, Downtown, Houston, TX 77002','B+','Muslim'),
(4,'Sanjay','Mehta','Rajesh Mehta','Kavita Mehta','Chicago','South Loop','2022 Wabash Ave, South Loop, Chicago, IL 60616','AB+','Hindu'),
(5,'Wei','Zhang','Ling Zhang','Xiao Zhang','San Francisco','Chinatown','303 Grant Ave, Chinatown, San Francisco, CA 94108','O-','Buddhist');

DROP TABLE teachers

CREATE TABLE teachers (
  teacherId INT NOT NULL,
  firstname VARCHAR(50) NOT NULL,
  lastname VARCHAR(50) NOT NULL,
  designation VARCHAR(50) NOT NULL,
  city VARCHAR(50) NOT NULL,
  PRIMARY KEY (teacherId)
);

INSERT INTO teachers (teacherId, firstname, lastname, designation,city) VALUES
(1, 'John', 'Smith', 'Professor', 'New York'),
(2, 'Mary', 'Johnson', 'Associate Professor', 'Los Angeles'),
(3, 'James', 'Williams', 'Assistant Professor', 'Houston'),
(4, 'Patricia', 'Brown', 'Lecturer', 'Chicago'),
(5, 'Robert', 'Jones', 'Senior Lecturer', 'San Francisco');

CREATE TABLE studentInfo (
  teacherId INT NOT NULL,
  PRIMARY KEY (teacherId)
);

/* Here is the Question Answer 2 */

SELECT departments.departmentName,departments.departmentCode,subjects.subjectTitle
FROM subjects
INNER JOIN departments
ON subjects.departmentCode = departments.departmentCode
WHERE departments.departmentCode = "EE102";

/* Here is the Question Answer 3 */

SELECT bloodgroup, COUNT(*) AS Total_Student
FROM studentpersonal 
GROUP BY bloodGroup
HAVING COUNT(*) >= 2;

/* Here is the Question Answer 4 */

SELECT studentpersonal.firstname,studentpersonal.lastname,subjects.subjectTitle
FROM studentpersonal
INNER JOIN student_subjects ON studentpersonal.studentId = student_subjects.studentId
INNER JOIN subjects ON student_subjects.subjectCode = subjects.subjectCode
INNER JOIN departments ON subjects.departmentCode = departments.departmentCode
WHERE departments.departmentCode = "CS101";


/* Here is the Question Answer 5 */

SELECT SUM(f.feeAmount) AS totalFeeCollected
FROM studentpersonal
INNER JOIN student_semester_fees AS f ON studentpersonal.studentId = f.studentId
INNER JOIN departments ON f.departmentCode = departments.departmentCode
WHERE departments.departmentCode = 'CS101'

DESCRIBE student_semester_fees;

/* Here is the Question Answer 6 */
UPDATE student_semester_fees
SET feeAmount = feeAmount * 1.10
WHERE departmentCode = 'CS101';

SELECT * FROM student_semester_fees
WHERE departmentCode = 'CS101';

/* Here is the Question Answer 7 */

SELECT studentpersonal.firstname AS studentFirstName,
       studentpersonal.lastname AS studentLastName,
       teachers.lastname AS teacherLastName,
       teachers.designation AS teacherDesignation
FROM studentpersonal
INNER JOIN student_subjects ON studentpersonal.studentId = student_subjects.studentId
INNER JOIN subjects ON student_subjects.subjectCode = subjects.subjectCode
INNER JOIN teachers ON subjects.teacherId = teachers.teacherId
WHERE subjects.departmentCode = 'CS101';

/* Here is the Question Answer 8 */

SELECT studentpersonal.firstname AS studentFirstName,
       teachers.lastname AS teacherLastName
FROM studentpersonal
INNER JOIN teachers ON studentpersonal.city = teachers.city

/* Here is the Question Answer 9 */

SELECT studentpersonal.firstname AS studentFirstName,
       studentpersonal.lastname AS studentLastName,
       studentpersonal.email AS teacherEmail,
       subjects.subjectCode AS SubjectCode,
       subjects.subjectTitle AS SubjectTitle
FROM studentpersonal
INNER JOIN student_subjects ON studentpersonal.studentId = student_subjects.studentId
INNER JOIN subjects ON student_subjects.subjectCode = subjects.subjectCode
WHERE subjects.subjectTitle = 'Algorithms';

/* Here is the Question Answer 10 */

UPDATE teachers
SET designation = CASE 
    WHEN designation = 'Lecturer' THEN 'Senior Lecturer'
    WHEN designation = 'Senior Lecturer' THEN 'Associate Professor'
    ELSE designation
END;

SELECT * FROM teachers
WHERE designation IN ('Lecturer', 'Senior Lecturer', 'Associate Professor')

/* Here is the Question Answer 11 */

SELECT teacherpersonal.firstname AS teacherFirstName,
       teacherpersonal.lastname AS teacherLastName
FROM teacherpersonal
INNER JOIN teacheracademic ON teacherpersonal.teacherId = teacheracademic.teacherId
WHERE salary = (SELECT MAX(salary) FROM teacheracademic
WHERE salary < (SELECT MAX(salary) FROM teacheracademic));


SELECT *
FROM teacherpersonal
INNER JOIN teacheracademic ON teacherpersonal.teacherId = teacheracademic.teacherId
WHERE salary = (SELECT MAX(salary) FROM teacheracademic
WHERE salary < (SELECT MAX(salary) FROM teacheracademic));

/* Here is the Question Answer 12 */

SELECT teachers.firstname AS teacherFirstName,
       teachers.lastname AS teacherLastName,
       studentpersonal.firstname AS studentFirstName,
       studentpersonal.lastname AS studentLastName,
       studentpersonal.city AS studentsCity,
       subjects.departmentCode AS departmentCode
FROM teacheracademic
INNER JOIN teachers ON teachers.teacherId = teachers.teacherId
INNER JOIN subjects ON teachers.teacherId = subjects.teacherId
INNER JOIN student_subjects ON subjects.subjectCode = student_subjects.subjectCode
INNER JOIN studentpersonal ON student_subjects.studentId = studentpersonal.studentId
WHERE salary = (SELECT MAX(salary) FROM teacheracademic
WHERE salary < (SELECT MAX(salary) FROM teacheracademic));

SELECT *
FROM teacheracademic
INNER JOIN teachers ON teachers.teacherId = teachers.teacherId
INNER JOIN subjects ON teachers.teacherId = subjects.teacherId
INNER JOIN student_subjects ON subjects.subjectCode = student_subjects.subjectCode
INNER JOIN studentpersonal ON student_subjects.studentId = studentpersonal.studentId
WHERE salary = (SELECT MAX(salary) FROM teacheracademic
WHERE salary < (SELECT MAX(salary) FROM teacheracademic));
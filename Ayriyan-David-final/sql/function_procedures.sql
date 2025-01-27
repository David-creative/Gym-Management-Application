-- addClient Function
DROP FUNCTION IF EXISTS addClient;
Delimiter $$
CREATE FUNCTION addClient(client_first_name VARCHAR(50), client_last_name VARCHAR(50), email_address VARCHAR(100),
	age INT
)
RETURNS INT
DETERMINISTIC
BEGIN
	INSERT INTO Clients (client_first_name, client_last_name, email_address, age)
	VALUES (client_first_name, client_last_name, email_address, age);
	RETURN 1;
END $$

DELIMITER ;



-- getTeacherId Function a)
DROP FUNCTION IF EXISTS getTeacherId;
Delimiter $$
CREATE FUNCTION getTeacherId(
	firstName VARCHAR(50), 
    lastName VARCHAR(50)
)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE teacherId INT;
    
    SELECT teacher_id
    INTO teacherId
    FROM teacher
    WHERE teacher_first_name = firstName
    AND teacher_last_name = lastName
    LIMIT 1;
    
	RETURN teacherId;
END $$

DELIMITER ;

-- Procedure #1 : getAllStudents
-- DROP PROCEDURE IF EXISTS getAllStudents $$
-- DELIMITER $$

-- CREATE PROCEDURE getAllStudents()
-- BEGIN
--     -- Select all students from the student table
--     SELECT * 
--     FROM student;
-- END $$

-- DELIMITER ;-- 



-- Procedure #2 : getTeacherStudents
DROP PROCEDURE IF EXISTS getTeacherStudents;
DELIMITER $$

CREATE PROCEDURE getTeacherStudents(teacher_first_name VARCHAR(50), 
	teacher_last_name VARCHAR(50)
)
BEGIN

    DECLARE teacher_id INT;
    
    -- Get the teacher's ID using the getTeacherId function
    SET teacher_id = getTeacherId(teacher_first_name, teacher_last_name);
    
    -- Select all students who have the specified teacher_id
    SELECT s.first_name, s.last_name
    FROM student s
    JOIN classes c ON s.student_id = c.student_id
    JOIN teacher t ON c.teacher_id = t.teacher_id
    WHERE t.teacher_id = teacher_id;
    
END $$

DELIMITER ;


# Module 05: Join Student Table
-- Procedure: getStudentsSubjects
DROP PROCEDURE IF EXISTS getStudentsSubjects;
DELIMITER $$

CREATE PROCEDURE getStudentsSubjects()
BEGIN
    
    -- Select all students who have the specified teacher_id
    SELECT s.first_name, s.last_name, s.email_address, c.subject
    FROM student s
    JOIN classes c ON s.student_id = c.student_id;
    
END $$

DELIMITER ;

############# Modify and Read Procedures (Final) ###############


-- Procedure #1: addClientEntry
DROP PROCEDURE IF EXISTS addClientEntry;
Delimiter $$
CREATE PROCEDURE addClientEntry(client_first_name VARCHAR(50), client_last_name VARCHAR(50), email_address VARCHAR(100),
	age INT
)

DETERMINISTIC
BEGIN
	INSERT INTO Clients(client_first_name, client_last_name, email_address, age)
	VALUES (client_first_name, client_last_name, email_address, age);
END $$

DELIMITER ;


-- Procedure #2 : getAllClients
DROP PROCEDURE IF EXISTS getAllClients;
DELIMITER $$

CREATE PROCEDURE getAllClients()
BEGIN
    -- Select all students from the student table
    SELECT * 
    FROM clients;
END $$

DELIMITER ;


-- Procedure #3: getClientsWorkouts
DROP PROCEDURE IF EXISTS getClientsWorkouts;
DELIMITER $$

CREATE PROCEDURE getClientsWorkouts()
BEGIN
    
    -- Select all clients who have the specified coach_id
    SELECT cli.client_first_name, cli.client_last_name, cli.email_address, c.workout
    FROM clients cli
    JOIN classes c ON cli.client_id = c.client_id;
    
END $$

DELIMITER ;

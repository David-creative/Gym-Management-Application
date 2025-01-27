-- /*
-- SET FOREIGN_KEY_CHECKS = 0;

-- TRUNCATE Teacher;
-- TRUNCATE Classes;
-- TRUNCATE Student;

-- SET FOREIGN_KEY_CHECKS = 1;
-- */
-- /*
-- SELECT * 
-- FROM Classes;

-- SELECT *
-- FROM Teacher;

-- SELECT *
-- FROM Student;
-- */
-- -- ------------------

-- SELECT 
--     s.first_name AS student_first_name,
--     s.last_name AS student_last_name,
--     c.subject AS class_name,
--     CONCAT(t.teacher_first_name, ' ', t.teacher_last_name) AS teacher_name,
--     c.class_grade
-- FROM 
--     STUDENT s
-- JOIN 
--     CLASSES c ON s.student_id = c.student_id
-- LEFT JOIN 
--     TEACHER t ON c.teacher_id = t.teacher_id
-- ORDER BY 
--     s.first_name, 
--     s.last_name,
--     c.class_grade ASC;

-- -- Calling Functions

-- SELECT addStudent('Brian', 'Smith', 'brian223@yahoo.com', '2007-10-11', 11);

-- SELECT getTeacherId('James', 'Anderson');

-- CALL getAllStudents;

-- CALL getTeacherStudents('Emily', 'Clark');

SELECT * FROM Client;

SELECT User, Host FROM mysql.user WHERE User = 'admin_user';

DROP USER 'admin_user'@'localhost';
DROP USER 'read_only'@'localhost';
DROP USER 'modify_user'@'localhost';

SHOW PROCEDURE STATUS WHERE Db = 'school' AND Name = 'getStudentsSubjects';

SHOW GRANTS FOR 'read_only'@'localhost';

CALL school.getStudentsSubjects();

SHOW GRANTS FOR 'read_only'@'localhost';
SHOW GRANTS FOR 'admin_user'@'localhost';

SET ROLE 'read_role';
SELECT CURRENT_ROLE();
SHOW CREATE PROCEDURE getStudentsSubjects;

ALTER PROCEDURE getStudentsSubjects SQL SECURITY INVOKER;

SHOW GRANTS FOR 'root'@'host';

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE Coaches;
TRUNCATE Classes;
TRUNCATE Clients;
SET FOREIGN_KEY_CHECKS = 1;

SELECT * FROM Coaches;
SELECT * FROM Classes;
SELECT * FROM Clients;

 CALL getClientsWorkouts;
DROP DATABASE IF EXISTS GYM;
CREATE DATABASE GYM;
USE GYM;

-- Start of Decomposed Tables -- 

CREATE TABLE Coaches (
    coach_id INT AUTO_INCREMENT PRIMARY KEY, -- primary key
--    FOREIGN KEY (class_id) REFERENCES CLIENTS(client_id),
    coach_first_name VARCHAR(50),
    coach_last_name VARCHAR(50),
    coach_email VARCHAR(100) UNIQUE
);

CREATE TABLE Classes (
    class_id INT AUTO_INCREMENT PRIMARY KEY, -- primary key
    coach_id INT, -- Foreign key
	FOREIGN KEY (coach_id) REFERENCES Coaches(coach_id), -- Foreign key constraint
    day_of_week VARCHAR(50),
    client_performance INT, -- client performance in workout class (_%)
    workout VARCHAR(100)
);

CREATE TABLE Clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY, -- primary key
    -- class_id INT, -- Foreign key linking to Classes
	-- FOREIGN KEY (class_id) REFERENCES Classes(class_id), -- Foreign key constraint
    client_first_name VARCHAR(50),
    client_last_name VARCHAR(50),
    email_address VARCHAR(100) UNIQUE,
    age INT
--     student_grade INT
);

ALTER TABLE CLASSES
ADD COLUMN client_id INT,
ADD FOREIGN KEY (client_id) REFERENCES CLIENTS(client_id);




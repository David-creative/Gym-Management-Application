
INSERT INTO Coaches (coach_first_name, coach_last_name, coach_email)
VALUES
('James', 'Anderson', 'james.anderson12@yahoo.com'), -- Strength Training Coach
('Emily', 'Clark', 'emily.clark57@gmail.com'),		-- Swimming Coach
('Michael', 'Harris', 'michael.harris88@yahoo.com'), -- Gymmnastics Coach
--
('Sarah', 'Lewis', 'sarah.lewis91@gmail.com');		-- Basketball Coach


INSERT INTO Clients (client_first_name, client_last_name, email_address, age)
VALUES 
('Rochelle', 'Sanders', 'rochelle.sanders@gmail.com', 45),
('Ethan', 'Johnson', 'ethan.johnson@gmail.com', 32),
('Sophia', 'Williams', 'sophia.williams@gmail.com', 27);

-- Clients and their Classes
-- -----------------

-- Rochelle Sanders' Enrollments
INSERT INTO CLASSES (day_of_week, client_performance, workout, client_id, coach_id)
VALUES
('Monday', '86','Strength Training', 1, 1), -- Strength Training Coach
('Tuesday', '95','Swimming', 1, 2),   -- Swimming Coach
('Wednesday', '95','Gymmnastics', 1, 3),   -- Gymmnastics Coach
('Thursday', '55','Basketball', 1, 4);   -- Basketball Coach
  

-- Ethan Johnson's Enrollments
INSERT INTO CLASSES (day_of_week, client_performance, workout, client_id, coach_id)
VALUES
('Monday', '99','Strength Training', 2, 1), 
('Tuesday', '92','Swimming', 2, 2),   
('Wednesday', '35','Gymmnastics', 2, 3),   
('Thursday', '75','Basketball', 2, 4); 


-- Sophia Williams' Enrollments
INSERT INTO CLASSES (day_of_week, client_performance, workout, client_id, coach_id)
VALUES
('Monday', '71','Strength Training', 3, 1), 
('Tuesday', '80','Swimming', 3, 2),   
('Wednesday', '100','Gymmnastics', 3, 3),   
('Thursday', '87','Basketball', 3, 4);  



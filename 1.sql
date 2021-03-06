CREATE TABLE Product (ID varchar(25) PRIMARY KEY NOT NULL,
					  Type varchar(50) NOT NULL,
					  Name varchar(50) NOT NULL,
					  Ppu float NOT NULL);
					  
CREATE TABLE Batter (ID varchar(25) PRIMARY KEY NOT NULL,
					Type varchar(50) NOT NULL);
					
CREATE TABLE Topping (ID varchar(25) PRIMARY KEY NOT NULL,
					Type varchar(50) NOT NULL);
					
INSERT INTO Product(ID, Type, Name, Ppu)
VALUES
('0001', 'Donut', 'Cake', 0.55),
('0002', 'Donut', 'Raised', 0.55),
('0003', 'Donut', 'Old Fashioned', 0.55);
					
INSERT INTO Batter(ID, Type)
VALUES
('1001', 'Regular'),
('1002', 'Chocolate'),
('1003', 'Blueberry'),
('1004', 'Devil''s Food');

INSERT INTO Topping(ID, Type)
VALUES
('5001', 'None'),
('5002', 'Glazed'),
('5003', 'Chocolate'),
('5004', 'Maple'),
('5005', 'Sugar'),
('5006', 'Chocolate with Sprinkles'),
('5007', 'Powdered Sugar');

SELECT p.ID, p.Type, p.Name, p.Ppu,
(SELECT ARRAY_AGG(b.ID || ', ' || b.Type) AS Batters
 FROM Batter b
 WHERE b.ID = '1001' OR b.ID = '1002'
	OR b.ID = '1003' OR b.ID = '1004'),
 (SELECT ARRAY_AGG(t.ID || ', ' || t.Type) AS Toppings
  FROM Topping t
  WHERE t.ID = '5001' OR t.ID = '5002'
 	OR t.ID = '5005' OR t.ID = '5007'
 	OR t.ID = '5006' OR t.ID = '5003'
 	OR t.ID = '5004')
FROM Product p
WHERE p.ID = '0001'
UNION ALL
SELECT p.ID, p.Type, p.Name, p.Ppu,
(SELECT ARRAY_AGG(b.ID || ', ' || b.Type) AS Batters
 FROM Batter b
 WHERE b.ID = '1001'),
 (SELECT ARRAY_AGG(t.ID || ', ' || t.Type) AS Toppings
  FROM Topping t
  WHERE t.ID = '5001' OR t.ID = '5002'
 	OR t.ID = '5005' OR t.ID = '5003'
 	OR t.ID = '5004')
FROM Product p
WHERE p.ID = '0002'
UNION ALL
SELECT p.ID, p.Type, p.Name, p.Ppu,
(SELECT ARRAY_AGG(b.ID || ', ' || b.Type) AS Batters
 FROM Batter b
 WHERE b.ID = '1001' OR b.ID = '1002'),
 (SELECT ARRAY_AGG(t.ID || ', ' || t.Type) AS Toppings
  FROM Topping t
  WHERE t.ID = '5001' OR t.ID = '5002'
 	OR t.ID = '5003' OR t.ID = '5004')
FROM Product p
WHERE p.ID = '0003'
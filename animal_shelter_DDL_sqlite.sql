DROP TABLE IF EXISTS Animals;
CREATE TABLE Animals (
    animalID INTEGER PRIMARY KEY,
    species varchar(10),
    animalName varchar(20) NOT NULL,
    age varchar(10) NOT NULL,
    gender varchar(1),
    breed varchar(20),
    pictureURL varchar(256)
);

DROP TABLE IF EXISTS Vaccines;
CREATE TABLE Vaccines (
    vaccineID INTEGER PRIMARY KEY,
    name varchar(50) UNIQUE NOT NULL,
    doses INTEGER,
    species varchar(20)
);

DROP TABLE IF EXISTS Prescriptions;
CREATE TABLE Prescriptions (
    animalID INTEGER NOT NULL,
    name varchar(20),
    frequency varchar(30),
    PRIMARY KEY (animalID, name),
    FOREIGN KEY (animalID) REFERENCES Animals(animalID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Patrons;
CREATE TABLE Patrons (
    patronID INTEGER PRIMARY KEY,
    firstName varchar(15),
    lastName varchar(15),
    phoneNumber varchar(12),
    address varchar(50)
);

DROP TABLE IF EXISTS FostersAndAdoptions;
CREATE TABLE FostersAndAdoptions (
    animalID INTEGER NOT NULL,
    patronID INTEGER,
    fosteredOrAdopted varchar(1),
    date date,
    PRIMARY KEY (animalID),
    FOREIGN KEY (animalID) REFERENCES Animals(animalID) ON DELETE CASCADE,
    FOREIGN KEY (patronID) REFERENCES Patrons(patronID)
);

DROP TABLE IF EXISTS Adoptable;
CREATE TABLE Adoptable (
    animalID INTEGER NOT NULL,
    restrictions text,
    PRIMARY KEY (animalID),
    FOREIGN KEY (animalID) REFERENCES Animals(animalID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS VaccinesAdministered;
CREATE TABLE VaccinesAdministered (
    animalID INTEGER NOT NULL,
    vaccineName varchar(50),
    vaccineID INTEGER,
    dateGiven date,
    dateExpires date,
    PRIMARY KEY (animalID, vaccineName),
    FOREIGN KEY (animalID) REFERENCES Animals(animalID) ON DELETE CASCADE,
    FOREIGN KEY (vaccineID) REFERENCES Vaccines(vaccineID) ON DELETE SET NULL
);

INSERT INTO Animals (species, animalName, age, gender, breed, pictureURL)
VALUES ('Canine','Fido', '3 yr', 'M', 'Pitbull Terrier', 'https://images.unsplash.com/photo-1620001796685-adf7110fe1a7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1964&q=80'),
('Canine','Shiloh', '2 yr', 'M', 'Beagle', 'https://images.unsplash.com/photo-1543466835-00a7907e9de1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1074&q=80'),
('Feline','Grumpy', '12 yr', 'F', 'Calico', 'https://images.unsplash.com/photo-1513245543132-31f507417b26?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=735&q=80'),
('Feline','Salem', '6 yr', 'M', 'Siamese', 'https://images.unsplash.com/photo-1592652426689-4e4f12c4aef5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80'),
('Canine', 'Scooby Doo', '4 yr', 'M', 'Great Dane', 'https://images.unsplash.com/photo-1592424701959-07bd1a04dc47?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1332&q=80'),
('Canine', 'Bananas', '7 mo', 'F', 'Shih Tzu', 'https://images.unsplash.com/photo-1583511655826-05700d52f4d9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cHVwcHl8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60');

INSERT INTO Vaccines (name, doses, species)
VALUES ('Rabies', '8', 'D'),
('Distemper', '21', 'D'),
('Parvovirus', '16', 'D'),
('Calicivirus', '12', 'C'),
('Panleukopenia', '34', 'C');

INSERT INTO Prescriptions(animalID, name, frequency)
VALUES ('1', 'Acepromozie', 'Once every 8 hours'),
('1', 'Ivermectin', 'Once every month'),
('3', 'Ketamine', 'Once every 8 hours until 07-21-2023'),
('2', 'Fenbendezole', 'Once a day');

INSERT INTO Patrons(firstName, lastName, phoneNumber, address)
VALUES ('Jeremey', 'Jones', '808-747-9876','1234 SW West South st, Timbuktu'),
('Jackie', 'Cho', '971-646-9797','2002 Shanghai St, Knight City'),
('Margaret', 'Houlihan', '541-669-5543','8765 Radar Way, MASH 4077'),
('Arthur', 'Morgan', '154-768-4996', '6 Horeshoe Dr, Saint Denis'),
('Jane', 'Doe', '422-223-3355', '147 Made Up St, Imaginary City');

INSERT INTO FostersAndAdoptions(animalID, patronID, fosteredOrAdopted, date)
VALUES ('1', '3', 'F', '2023-7-16'),
('2', '2', 'A', '2022-6-15'),
('4', '3', 'F', '2023-7-16'),
('3', '1', 'F', '2022-6-15');

INSERT INTO Adoptable(animalID, restrictions)
VALUES ('1', 'Can''t eat hard food'),
('4', 'Indoor Cat Only'),
('3', 'Does not get along with dogs or children'),
('5', 'Will only eat Scooby Snacks');

INSERT INTO VaccinesAdministered(animalID, vaccineID, vaccineName, dateGiven, dateExpires)
VALUES ('1', 1, (SELECT name FROM Vaccines WHERE vaccineID = 1), '2022-12-1', '2023-10-12'),
('1', 2, (SELECT name FROM Vaccines WHERE vaccineID = 2),'2022-12-1', '2023-10-12' ),
('2', 2, (SELECT name FROM Vaccines WHERE vaccineID = 2), '2022-12-1', '2023-10-12'),
('2', 1,  (SELECT name FROM Vaccines WHERE vaccineID = 1), '2022-12-10', '2023-10-12'),
('3', 4,  (SELECT name FROM Vaccines WHERE vaccineID = 4), '2022-03-10', '2023-03-12'),
('6', 2,  (SELECT name FROM Vaccines WHERE vaccineID = 2), '2022-12-1', '2023-01-12'),
('5', 1,  (SELECT name FROM Vaccines WHERE vaccineID = 1), '2022-12-1', '2023-10-12'),
('5', 2,  (SELECT name FROM Vaccines WHERE vaccineID = 2), '2021-12-1', '2023-10-12');
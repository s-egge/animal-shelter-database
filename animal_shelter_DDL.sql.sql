SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Animals;
CREATE TABLE `Animals` (
    `animalID` int NOT NULL AUTO_INCREMENT,
    `species` varchar(10),
    `animalName` varchar(20) NOT NULL,
    `age` varchar(10) NOT NULL,
    `gender` varchar(1),
    `breed` varchar(20),
    `pictureURL` varchar(256),
    PRIMARY KEY (`animalID`)
);

DROP TABLE IF EXISTS Vaccines;
CREATE TABLE `Vaccines` (
    `name` varchar(50) NOT NULL,
    `doses` int,
    `species` varchar(20),
    PRIMARY KEY (`name`)
);

DROP TABLE IF EXISTS VaccinesAdministered;
CREATE TABLE `VaccinesAdministered` (
    `animalID` int NOT NULL,
    `vaccineName` varchar(50),
    `dateGiven` date,
    `dateExpires` date,
    PRIMARY KEY (`animalID`, `vaccineName`),
    FOREIGN KEY (`animalID`) REFERENCES Animals(animalID) ON DELETE CASCADE,
    FOREIGN KEY (`vaccineName`) REFERENCES Vaccines(name)
);

DROP TABLE IF EXISTS Prescriptions;
CREATE TABLE `Prescriptions` (
    `animalID` int NOT NULL,
    `name` varchar(20),
    `frequency` varchar(30),
    PRIMARY KEY (`animalID`, `name`),
    FOREIGN KEY (`animalID`) REFERENCES Animals(`animalID`) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Patrons;
CREATE TABLE `Patrons` (
    `patronID` int NOT NULL AUTO_INCREMENT,
    `firstName` varchar(15),
    `lastName` varchar(15),
    `phoneNumber` varchar(12),
    `address` varchar(50),
    PRIMARY KEY (`patronID`)
);

DROP TABLE IF EXISTS FostersAndAdoptions;
CREATE TABLE `FostersAndAdoptions` (
    `animalID` int NOT NULL,
    `patronID` int,
    `fosteredOrAdopted` varchar(1),
    `date` date,
    PRIMARY KEY (`animalID`),
    FOREIGN KEY (`animalID`) REFERENCES Animals(animalID) ON DELETE CASCADE,
    FOREIGN KEY (`patronID`) REFERENCES Patrons(patronID) ON DELETE SET NULL
);

DROP TABLE IF EXISTS Adoptable;
CREATE TABLE `Adoptable` (
    `animalID` int NOT NULL,
    `restrictions` text,
    PRIMARY KEY (`animalID`),
    FOREIGN KEY (`animalID`) REFERENCES Animals(animalID) ON DELETE CASCADE
);

INSERT INTO Animals (species, animalName, age, gender, breed, pictureURL)
VALUES ('Canine','Fido', '3 yr', 'M', 'Pitbull Terrier', 'https://images.unsplash.com/photo-1620001796685-adf7110fe1a7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1964&q=80'),
('Canine','Shiloh', '2 yr', 'M', 'Beagle', 'https://images.unsplash.com/photo-1543466835-00a7907e9de1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1074&q=80'),
('Feline','Grumpy', '12 yr', 'F', 'Calico', 'https://images.unsplash.com/photo-1513245543132-31f507417b26?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=735&q=80'),
('Feline','Salem', '6 yr', 'M', 'Siamese', 'https://images.unsplash.com/photo-1592652426689-4e4f12c4aef5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80'),
('Canine', 'Scooby Doo', '4 yr', 'M', 'Great Dane', 'https://images.unsplash.com/photo-1592424701959-07bd1a04dc47?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1332&q=80'),
('Canine', 'Bananas', '7 mo', 'F', 'Shih Tzu', 'https://images.unsplash.com/photo-1583511655826-05700d52f4d9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cHVwcHl8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60'),
('Canine', 'Bumblebee', '8 yr', 'F', 'Pug', 'https://images.unsplash.com/photo-1648882091596-c19366d27ee0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1331&q=80'),
('Feline', 'Navi', '3 mo', 'F', 'British Shorthair', 'https://images.unsplash.com/photo-1603314585442-ee3b3c16fbcf?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGtpdHRlbnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60');

INSERT INTO Vaccines (name, doses, species)
VALUES ('Rabies', '8', 'Canine'),
('Distemper', '21', 'Canine'),
('Parvovirus', '16', 'Canine'),
('Calicivirus', '12', 'Feline'),
('Panleukopenia', '34', 'Feline');

INSERT INTO VaccinesAdministered(animalID, vaccineName, dateGiven, dateExpires)
VALUES ('1', 'Rabies', '2022-12-1', '2023-10-12'),
('1', 'Distemper','2022-12-1', '2023-10-12' ),
('2', 'Distemper', '2022-12-1', '2023-10-12'),
('2', 'Rabies', '2022-12-10', '2023-10-12'),
('3', 'Calicivirus', '2022-03-10', '2023-03-12'),
('3', 'Panleukopenia', '2022-03-10', '2023-03-12'),
('4', 'Calicivirus', '2021-04-11', '2022-04-11'),
('6', 'Distemper', '2022-12-1', '2023-01-12'),
('5', 'Rabies', '2022-12-1', '2023-10-12'),
('5', 'Distemper', '2021-12-1', '2023-10-12');

INSERT INTO Prescriptions(animalID, name, frequency)
VALUES ('1', 'Acepromozie', 'Once every 8 hours'),
('1', 'Ivermectin', 'Once every month'),
('3', 'Ketamine', 'Once every 8 hours until 07-21-2023'),
('2', 'Fenbendezole', 'Once a day');

INSERT INTO Patrons(firstName, lastName, phoneNumber, address)
VALUES ('Jeremey', 'Jones', '808-747-9876','1234 SW West South st, Timbuktu'),
('Jackie', 'Chan', '971-646-9797','2002 Shanghai St, Knight City'),
('Margaret', 'Houlihan', '541-669-5543','8765 Radar Way, MASH 4077'),
('Arthur', 'Morgan', '154-768-4996', '6 Horeshoe Dr, Saint Denis'),
('Princess', 'Zelda', '345-123-4321', 'Hyrule Castle, Hyrule');

INSERT INTO FostersAndAdoptions(animalID, patronID, fosteredOrAdopted, date)
VALUES ('1', '3', 'F', '2023-7-16'),
('2', '2', 'A', '2022-6-15'),
('4', '3', 'F', '2023-7-16'),
('3', '1', 'F', '2022-6-15'),
('7', '4', 'A', '2023-8-1'),
('8', '5', 'A', '2020-4-8');

INSERT INTO Adoptable(animalID, restrictions)
VALUES ('1', "Can't eat hard food"),
('4', "Indoor Cat Only"),
('3', "Does not get along with dogs or children"),
('5', "Will only eat Scooby Snacks");

SET FOREIGN_KEY_CHECKS = 1;
CREATE TABLE Person ( 

    personID INT PRIMARY KEY, 

    firstName VARCHAR(25) NOT NULL, 

    lastName VARCHAR(25) NOT NULL, 

    address VARCHAR(60) NOT NULL, 

    email VARCHAR(60) NOT NULL 

); 

 

CREATE TABLE Customer ( 

    customerID INT PRIMARY KEY, 

    userName VARCHAR(25) NOT NULL, 

    password VARCHAR(20) NOT NULL, 

    memberScore INT, 

    cardType VARCHAR(20), 

    cardNumber char(16) 

); 

 

CREATE TABLE Brand ( 

    brandID number(5) PRIMARY KEY, 

    brandName VARCHAR(60) NOT NULL, 

    brandLevel number(3), 

    brandManagerID INT NOT NULL, 

    CONSTRAINT level_check CHECK (brandLevel BETWEEN 1 AND 5) 

); 

 

 

CREATE TABLE Location ( 

    locationID number(5) PRIMARY KEY, 

    address VARCHAR(60) NOT NULL, 

    locationManagerID INT NOT NULL, 

    brandID number(5) NOT NULL, 

    CONSTRAINT brand_fk FOREIGN KEY (brandID) REFERENCES Brand(brandID) 

); 

 

CREATE TABLE Employee ( 

    employeeID INT PRIMARY KEY, 

    sin INT, 

    position VARCHAR(25), 

    locationID number(5) NOT NULL, 

    CONSTRAINT location_fk FOREIGN KEY (locationID) REFERENCES Location(locationID) 

); 

 

CREATE TABLE Type ( 

    typeID number(5) PRIMARY KEY, 

    capacity number(3) NOT NULL, 

    standardPrice number(9,2) NOT NULL, 

    maintainCost number(9,2) NOT NULL, 

    locationID number(5) NOT NULL   

); 

 

CREATE TABLE Room ( 

    roomID INT PRIMARY KEY, 

    available number(1) NOT NULL, 

    typeID number(5) NOT NULL, 

    floorNumber number(3), 

    roomNumber INT, 

    locationID number(5) NOT NULL, 

    CONSTRAINT room_type_fk FOREIGN KEY (typeID) REFERENCES Type(typeID), 

    CONSTRAINT room_location_fk FOREIGN KEY (locationID) REFERENCES Location(locationID) 

); 

 

CREATE TABLE Reservation ( 

    reservationID INT PRIMARY KEY, 

    reservationDate Date NOT NULL, 

    reservationStatus number(1) NOT NULL, 

    customerID INT NOT NULL, 

    CONSTRAINT customer_fk FOREIGN KEY (customerID) REFERENCES Customer(customerID) 

); 

CREATE TABLE Reservation_Type ( 

    reservationID INT, 

    typeID number(5), 

    startDate Date NOT NULL, 

    endDate Date NOT NULL, 

    price number(9,2) NOT NULL, 

    CONSTRAINT reservation_pk PRIMARY KEY (reservationID, typeID), 

    CONSTRAINT reservation_fk FOREIGN KEY (reservationID) REFERENCES Reservation(reservationID), 

    CONSTRAINT type_fk FOREIGN KEY (typeID) REFERENCES Type(TypeID) 

); 

 

CREATE TABLE Payment ( 

    paymentID INT PRIMARY KEY, 

    name VARCHAR(25) NOT NULL, 

    cardType VARCHAR(25) NOT NULL, 

    cardNumber CHAR(16) NOT NULL, 

    payment number(9,2) NOT NULL, 

    transferDate Date NOT NULL, 

    reservationID INT NOT NULL, 

    CONSTRAINT payment_reservation_fk FOREIGN KEY (reservationID) REFERENCES Reservation(reservationID)    

); 

 

 
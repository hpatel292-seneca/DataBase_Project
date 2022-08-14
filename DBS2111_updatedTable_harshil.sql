CREATE TABLE country   (
    code char(2) NOT NULL PRIMARY KEY,
    Name varchar(60) NOT NULL
);

CREATE TABLE province(
    provcode char(2) PRIMARY KEY,
    provname varchar(40) NOT NULL,
    countrycode char(2) NOT NULL,
    CONSTRAINT province_country_fk FOREIGN KEY (countrycode) REFERENCES country(code)
);


CREATE TABLE Person ( 

    personID INT PRIMARY KEY, 

    firstName VARCHAR(25) NOT NULL, 

    lastName VARCHAR(25) NOT NULL, 
 
    email VARCHAR(60) NOT NULL, 

    provcode char(2),
    
    postalcode char(6),
    
    CONSTRAINT person_province_fk FOREIGN KEY (provcode) REFERENCES province(provcode)
); 

--CREATE TABLE brandmanager ( 
--
--    ID INT PRIMARY KEY, 
--
--    firstName VARCHAR(25) NOT NULL, 
--
--    lastName VARCHAR(25) NOT NULL, 
-- 
--    email VARCHAR(60) NOT NULL, 
--
--    provcode char(2),
--    
--    postalcode char(6),
--    
--    CONSTRAINT brandmanager_province_fk FOREIGN KEY (provcode) REFERENCES province(provcode)
--); 
--drop table brandmanager;

CREATE TABLE Customer ( 

    customerID INT PRIMARY KEY, 

    userName VARCHAR(25) NOT NULL, 

    password VARCHAR(20) NOT NULL, 

    memberScore INT, 

    cardType VARCHAR(20), 

    cardNumber char(16),
    
    CONSTRAINT cust_person_fk FOREIGN KEY (customerID) REFERENCES person(personID)

); 

-- done till here-- 

CREATE TABLE Payment ( 

    paymentID INT PRIMARY KEY, 

    name VARCHAR(25) NOT NULL, 

    cardType VARCHAR(25) NOT NULL, 

    cardNumber CHAR(16) NOT NULL, 

    payment number(9,2) NOT NULL, 

    transferDate Date NOT NULL 
); 

CREATE TABLE Reservation ( 

    reservationID INT PRIMARY KEY, 

    reservationDate Date NOT NULL, 

    reservationStatus number(1) NOT NULL, 

    customerID INT NOT NULL, 
    
    paymentID int,
    
    CONSTRAINT payment_reservation_fk FOREIGN KEY (paymentID) REFERENCES Payment(paymentID),

    CONSTRAINT customer_fk FOREIGN KEY (customerID) REFERENCES Customer(customerID) 

); 
 CREATE TABLE Type ( 

    typeID number(5) PRIMARY KEY, 

    capacity number(3) NOT NULL, 

    standardPrice number(9,2) NOT NULL, 

    maintainCost number(9,2) NOT NULL  

);   
CREATE TABLE Employee ( 

    employeeID INT PRIMARY KEY, 

    sin INT, 

    position VARCHAR(25), 

    CONSTRAINT employee_person_fk FOREIGN KEY (employeeid) REFERENCES person(personID)

); 
CREATE TABLE Brand ( 

    brandID number(5) PRIMARY KEY, 

    brandName VARCHAR(60) NOT NULL, 

    brandLevel number(3), 

    brandManagerID INT NOT NULL, 

    CONSTRAINT level_check CHECK (brandLevel BETWEEN 1 AND 5), 
    
    CONSTRAINT brand_manager_fk FOREIGN KEY (brandManagerID) REFERENCES employee(employeeID)

); 
--drop table brand;
CREATE TABLE Location ( 

    locationID number(5) PRIMARY KEY, 

    address VARCHAR(60) NOT NULL, 

    locationManagerID INT NOT NULL, 

    brandID number(5) NOT NULL, 

    CONSTRAINT brand_fk FOREIGN KEY (brandID) REFERENCES Brand(brandID),
    
    CONSTRAINT location_locationmanager_fk FOREIGN KEY (locationmanagerid) REFERENCES employee(employeeID)
    
); 

CREATE TABLE Employee_location ( 

    employeeID INT,

    locationID number(5),
    
    CONSTRAINT reservation_pk PRIMARY KEY (employeeID, locationID),
    
    CONSTRAINT employee_fk FOREIGN KEY (employeeid) REFERENCES employee(employeeid),

    CONSTRAINT location_fk FOREIGN KEY (locationid) REFERENCES location(locationID)
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

CREATE TABLE Reservation_room ( 

    reservationID INT, 

    roomID number(5), 

    startDate Date NOT NULL, 

    endDate Date NOT NULL, 

    price number(9,2) NOT NULL,
    
    CONSTRAINT m_reservation_pk PRIMARY KEY (reservationID, roomID), 

    CONSTRAINT m_reservation_bridge_fk FOREIGN KEY (reservationID) REFERENCES Reservation(reservationID), 


    CONSTRAINT m_room__bridge_fk FOREIGN KEY (roomID) REFERENCES room(roomID) 

); 

 





 


 

 
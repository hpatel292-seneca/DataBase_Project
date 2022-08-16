--senario 1: the room types population rank --
-- Firstly to create a view which list the room type popularity according to 
-- how many days it has been reserved.
create view popularType as
select typeID, sum(endDate - startDate) as dateSum 
from RESERVATION_TYPE left join RESERVATION
on RESERVATION_TYPE.typeID = RESERVATION.typeID
WHERE reservation.reservationStatus = 1
group by typeID 
order by sum(endDate - startDate) DESC ;
select * from popularType;

-- Secondly, create a view to rank all these types' popularity and also show locations.
-- According to this view, the manager can make desicion what kind of room type and which location are more attactive to customers.
create view popularRank as
select popularType.typeID, popularType.dateSum, room.locationID, location.city from popularType inner join room
on popularType.typeID = room.typeID
left join location
on room.locationID = location.locationID;


--senario 2: the room type of earning money rank --
--Firstly, create a view to select how much have been earned for each type.--
create view earningType as
select reservation_type.typeID, sum((reservation_type.endDate - reservation_type.startDate)*(reservation_type.price - type.maintainCost)) as earn
from reservation_type left join type
on reservation_type.typeID = type.typeID
left join RESERVATION
on RESERVATION_TYPE.typeID = RESERVATION.typeID
where reservation.reservationstatus = 1
group by reservation_type.typeid
order by sum((reservation_type.endDate - reservation_type.startDate)*(reservation_type.price - type.maintainCost));


-- Secondly, create view to show the earning money rank of types, to help manager make investment decision.
create view earningRank as
select * from earningType inner join room
on earningType.typeID = room.typeID
left join location
on room.locationID = location.locationID;



---senario 3: list every location
--Help manager to monitor how many employees in each location.
create view employeeLocation as
select distinct employee_location.locationID, location.street, location.city, province.provname, country.name, location.postalcode
from employee_location
left join location
on location.locationid = employee_location.locationID
left join province
on location.provcode = province.provcode
left join country
on province.countrycode = country.code;



--senario 4: order seasonal change
-- Calculate how much earned for every month--
-- To make it simple, we use accounting on cash basis.--
create view seasonalChange as
select sum((reservation_type.endDate - reservation_type.startDate)*(reservation_type.price - type.maintainCost)) as "earn", 
EXTRACT(MONTH FROM reservation_type.startDate) as "month"
from reservation_type left join type
on reservation_type.typeID = type.typeID
left join reservation
on reservation_type.reservationid = reservation.reservationid
where reservation.reservationstatus = 1
group by EXTRACT(MONTH FROM reservation_type.startDate)
order by sum((reservation_type.endDate - reservation_type.startDate)*(reservation_type.price - type.maintainCost)) desc;
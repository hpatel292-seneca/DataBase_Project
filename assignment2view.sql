--senario 1: the room types population rank --
create view popularType as
select typeID, sum(endDate - startDate) as dateSum 
from RESERVATION_TYPE
group by typeID 
order by sum(endDate - startDate) DESC ;
select * from popularType;

--create view popularRank as
select popularType.typeID, popularType.dateSum, room.locationID, location.city from popularType inner join room
on popularType.typeID = room.typeID
left join location
on room.locationID = location.locationID;


--senario 2: the room type of earning money rank --
create view earningType as
select reservation_type.typeID, sum((reservation_type.endDate - reservation_type.startDate)*(reservation_type.price - type.maintainCost)) as earn
from reservation_type left join type
on reservation_type.typeID = type.typeID
group by reservation_type.typeid
order by sum((reservation_type.endDate - reservation_type.startDate)*(reservation_type.price - type.maintainCost));

drop view earningType;

--create view earningRank as
select * from earningType inner join room
on earningType.typeID = room.typeID
left join location
on room.locationID = location.locationID;



---senario 3: check the employee in one location



--senario 4: order seasonal change 





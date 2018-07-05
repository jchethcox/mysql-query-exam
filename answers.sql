-- 1)
select distinct departAirport as Airports from flight;
-- 2)
select airline.name, flightNumber, scheduledDepartDateTime, arriveAirport, status
from airline
join flight on airline.ID = flight.airlineID
where status = 'delayed' and departAirport = 'SFO';
-- 3)
select distinct departAirport as Cities
from flight
where airlineID = 1;
-- 4)
select distinct airline.name as Airline
from airline
join flight on airline.ID = flight.airlineID
where flight.departAirport = 'ATL';
-- 5)
select airline.name as name, flightNumber, departAirport, arriveAirport
from airline
join flight on flight.airlineID = airlineID
where scheduledDepartDateTime = actualDepartDateTime and airline.ID = flight.airlineID
group by flight.ID;
-- 6)
select airline.name as Airline, flight.flightNumber as Flight, flight.gate as Gate, time(flight.scheduledArriveDateTime) as Arrival, flight.status as Status
from airline
join flight on airline.ID = flight.airlineID
where date(scheduledArriveDateTime) = '2017-10-30' and flight.arriveAirport = 'CLT';
-- 7) 
select flight.flightNumber as flight, count(reservation.flightID) as reservations
from flight
join reservation on flight.ID = reservation.flightID
group by flight.flightNumber
order by reservations desc;
-- 8) 
select airline.name as airline, flight.departAirport, flight.arriveAirport, avg(reservation.cost) as AverageCost
from airline
join flight on airline.ID = flight.airlineID
join reservation on flight.ID = reservation.flightID
where reservation.class = 'coach'
group by departAirport,  arriveAirport
order by AverageCost desc;
-- 9) I understand this isn't what you're looking for. I tried it without the where statement and a hundred different ways, but for some reason 
-- I couldn't get it to display the proper departAirport. it kept saying atlanta
select  departAirport, arriveAirport, miles
from flight
order by miles desc limit 1;
-- 10)
select firstName, lastName, sum(miles) as miles 
from passenger
join reservation on passenger.ID = reservation.passengerID
join flight on flight.ID = reservation.flightID
group by passengerID 
order by miles desc 
limit 5;
-- 11)
select airline.name as Name, concat_ws(' --> ', flight.departAirport, flight.arriveAirport) as Route, date(scheduledArriveDateTime) as 'Arrive Date', time(scheduledArriveDateTime) as 'Arrive Time'
from airline
join flight on airline.ID = flight.airlineID
where airlineID = 1
order by Route, date(scheduledArriveDateTime), time(scheduledArriveDateTime) ;
-- 12)
select airline.name as Airline, flight.flightNumber as Flight, concat_ws(' --> ', flight.departAirport, flight.arriveAirport) as Route,
count(reservation.flightID) as 'Reservation Count', sum(reservation.cost) as Revenue
from airline
join flight on airline.ID = flight.airlineID
join reservation on flight.ID = reservation.flightID
group by Route
order by Revenue desc;
-- 13)
select  concat_ws(' --> ', flight.departAirport, flight.arriveAirport) as Route, floor(avg(reservation.cost)) as 'Avg Revenue'
from flight
join reservation on flight.ID = reservation.flightID
group by Route
order by avg(reservation.cost) desc;
-- 14)
select airline.name as Airline, avg(flight.miles) as 'Avg Miles Per Flight'
from airline
join flight on airline.ID = flight.airlineID
group by Airline;
-- 15)
select distinct airline.name as Airline
from airline
join flight on airline.ID = flight.airlineID
where flight.scheduledArriveDateTime > flight.actualArriveDateTime;









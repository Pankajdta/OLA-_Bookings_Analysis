create database Ola
use ola


select Count(*) from bookings

select *from bookings

USE ola;

LOAD DATA LOCAL INFILE 'C:/Users/pankaj/Desktop/PROJECT/Bookings-100000-Rows.csv'
INTO TABLE `bookings`
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

TRUNCATE TABLE bookings;


#Retrieve all successful bookings
create view  successful_bookings as
select *from bookings where Booking_Status="Success"
 
#Find the average ride distance for each vehicle type:
create view ride_distance_for_each_vehicle_type as
select Vehicle_Type,avg( Ride_Distance)  as avg_distance from bookings group by Vehicle_Type

 #Get the total number of cancelled rides by customers:
 create view canceled_ride_by_customers as 
 select count(*) as total_canceled_ride from 
 bookings where Booking_Status="Canceled by customer"
 
 #List the top 5 customers who booked the highest number of rides:
 create view Top_5_Customers as
 select Customer_ID,count(Booking_ID) as total_rides from bookings 
 group by Customer_ID 
 ORDER BY total_rides desc limit 5

#Get the number of rides cancelled by drivers due to personal and car-related issues:
create view Rides_canceled_by_driver_P_C_issues as 
select count(*) from bookings where Canceled_Rides_by_Driver = "Personal & Car related issue"


#Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view MAX_MIN_ratings as 
select max(Driver_Ratings),min(Driver_Ratings) from bookings 
where Vehicle_Type="Prime Sedan"

#Retrieve all rides where payment was made using UPI:
create view UPI_Payment as
select *from bookings where Payment_Method="UPI"

#Find the average customer rating per vehicle type:
create view avg_cust_rating as 
select Vehicle_Type ,avg(Customer_Rating) as avg_customer_rating 
from bookings
group by Vehicle_Type

#Calculate the total booking value of rides completed successfully:
create view total_succesful_ride_value as
select sum(Booking_Value) as total_successful_value
from bookings where Booking_Status="Success"


#List all incomplete rides along with the reason:
create view incomplete_ride as 
select Booking_ID,Incomplete_Rides_Reason from bookings 
where Incomplete_Rides="Yes"


use credit_card;      # created databse of credit card
select * from clean_creditdata; # retrieving the data from the credit card

SQL QUERIES OF CLEANED DATA FROM CREDIT CARD APPROVAL PREDICTION DATA SET 
-----------------------------------------------------------------------
1.Group the customers based on their income type and find the average of their annual income.

select avg(Annual_Income),Type_Income from clean_creditdata
group by Type_Income;


2.Find the female owners of cars and property.
 select * from clean_creditdata;
 # female owners of cars and property
 SELECT Ind_ID,GENDER as "Female Owners",Car_Owner,Propert_Owner from clean_creditdata where GENDER='F' and Car_Owner='Y' AND Propert_Owner='Y' ;
 
 #total count of above female owners of cars and property
SELECT COUNT(*)as female_owners,GENDER,count(Car_Owner)as cars,count(Propert_Owner)as property from credit_card
where GENDER='F' and Car_Owner='Y' AND Propert_Owner='Y' ;


3.Find the male customers who are staying with their families.

select * from clean_creditdata;
#query1:male customers who are staying with their families.
select GENDER,Housing_type from clean_creditdata
where Housing_type='With parents' 
having GENDER='M';

#query2:No:of males customers staying with their families=37
select count(GENDER)AS NUM_MALE_CUSTOMERS,Housing_type from clean_creditdata
where Housing_type='With parents' GROUP BY GENDER
having GENDER='M';


4.Please list the top five people having the highest income.

select * from clean_creditdata;
SELECT Ind_ID,Annual_Income as "Top 5 people with highest income",GENDER from clean_creditdata ORDER BY Annual_Income DESC LIMIT 5;


5.How many married people are having bad credit?
select * from clean_creditdata;
SELECT count(Marital_status)as "No of Married people having bad credit" from clean_creditdata where Annual_income>=150000;
# NO:OF MARRIED PEOPLE:923


6.What is the highest education level and what is the total count?
select * from clean_creditdata;

#Query for the question :426- higher education
select count(*) as TOTAL_COUNT,EDUCATION FROM clean_creditdata where EDUCATION="Higher education";


7.Between married males and females, who is having more bad credit? 
select * from clean_creditdata;
# males=311 are having bad credit than females=306 
SELECT count(Marital_status)as "Gender with more bad credit" ,GENDER from clean_creditdata 
WHERE Marital_status="Married" and Annual_income>=150000
group by GENDER;


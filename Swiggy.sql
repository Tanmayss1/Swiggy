#How Many Restuarents have rating greater than 4.5
select count(*) from swiggy where rating > 4.5;

#Which is the top #1City with the highest number of restuarents ?
select max(city) as City_Name,count(city) as no_of_restuarents from swiggy group by city limit 1;

#How Many Restuarents have pizza in there name?
select count(*) as Restuarents_With_Pizza_In_Their_Name from swiggy where restaurant_name like '%pizza%';

#Additonal Query Found W.r.t To cities
select count(*) as Restuarents_With_Pizza_In_Their_Name,city from swiggy where restaurant_name like '%pizza%' group by city;

#What is the most common cuisine among the resrtuarents in the datasets? 
select cuisine, count(cuisine) as Cuisine_Counts from swiggy group by cuisine order by Cuisine_Counts desc limit 1;

#What is the average rating of restuarents in each city ?
select avg(rating) as Average_Rating , city from swiggy group by city;

#WHAT IS THE HIGHEST PRICE OF ITEM UNDER THE 'RECOMMENDED' MENUCATEGORY FOR EACH RESTAURANT?
select distinct restaurant_name , max(price) as highes_Price from swiggy where menu_category = "Recommended" group by restaurant_name order by highes_Price desc;


#FIND THE TOP 5 MOST EXPENSIVE RESTAURANTS THAT OFFER CUISINE OTHER THAN INDIAN CUISINE ?
select distinct restaurant_name , cost_per_person from swiggy WHERE cuisine <> 'Indian' order by cost_per_person desc limit 5;

#FIND THE RESTAURANTS THAT HAVE AN AVERAGE COST WHICH IS HIGHER THAN THE TOTAL AVERAGE COST OF ALL RESTAURANTS TOGETHER.
select distinct restaurant_name,cost_per_person from swiggy where cost_per_person>(select avg(cost_per_person) from swiggy);

#RETRIEVE THE DETAILS OF RESTAURANTS THAT HAVE THE SAME NAME BUT ARE LOCATED IN DIFFERENT CITIES.
select distinct t1.restaurant_name,t1.city as City_1,t2.city as City_2 from swiggy t1 join swiggy t2 on t1.restaurant_name=t2.restaurant_name and t1.city<>t2.city;



#WHICH RESTAURANT OFFERS THE MOST NUMBER OF ITEMS IN THE 'MAIN COURSE'CATEGORY ?
select distinct restaurant_name, count(item) as no_of_items, menu_category from swiggy where menu_category = "Main Course" group by menu_category,restaurant_name order by no_of_items desc limit 5;

#LIST THE NAMES OF RESTAURANTS THAT ARE 100% VEGEATARIAN IN ALPHABETICAL ORDER OF RESTAURANT NAME.
select distinct restaurant_name, (count(case when veg_or_nonveg='Veg' then 1 end)*100/ count(*)) as vegetarian_percetage from swiggy group by restaurant_name having vegetarian_percetage=100.00 order by restaurant_name;

#WHICH IS THE RESTAURANT PROVIDING THE LOWEST AVERAGE PRICE FOR ALL ITEMS?
select restaurant_name,avg(price) as Average_Price from swiggy group by restaurant_name order by Average_Price asc limit 1;


#WHICH TOP 5 RESTAURANT OFFERS HIGHEST NUMBER OF CATEGORIES?
select distinct restaurant_name, count(distinct menu_category) as Categories from swiggy group by restaurant_name order by Categories desc limit 5;



#WHICH RESTAURANT PROVIDES THE HIGHEST PERCENTAGE OF NON-VEGEATARIAN FOOD?
select distinct restaurant_name, (count(case when veg_or_nonveg='Non-veg' then 1 end)*100/count(*)) as nonvegetarian_percentage from swiggy group by restaurant_name order by nonvegetarian_percentage desc limit 1;


select count(restaurant_name) from swiggy;
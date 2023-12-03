CREATE DATABASE ECOMMERCE;
USE  ECOMMERCE;
CREATE TABLE SUPPLIER(
SUPP_ID INT not null ,
SUPP_NAME VARCHAR(50) NOT NULL,
SUPP_CITY varchar(50) NOT NULL,
SUPP_PHONE varchar(50) NOT NULL,
PRIMARY KEY(SUPP_ID));

CREATE  TABLE CUSTOMER(
CUS_ID INT ,
CUS_NAME VARCHAR(20) NOT NULL,
CUS_PHONE VARCHAR(10) NOT NULL,
CUS_CITY VARCHAR(30) NOT NULL,
CUS_GENDER CHAR,
PRIMARY KEY(CUS_ID));


CREATE TABLE CATEGORY(
CAT_ID INT,
CAT_NAME VARCHAR(20) NOT NULL,
PRIMARY KEY(CAT_ID)); 


CREATE TABLE PRODUCT(
PRO_ID INT,
PRO_NAME VARCHAR(20) NOT NULL DEFAULT "Dummy",
PRO_DESC VARCHAR(60) ,
CAT_ID INT,
PRIMARY KEY(PRO_ID),
FOREIGN KEY (CAT_ID) REFERENCES CATEGORY(CAT_ID));

CREATE TABLE SUPPLIER_PRICING(
PRICING_ID INT,
PRO_ID INT,
SUPP_ID INT,
SUPP_PRICE INT DEFAULT 0,
PRIMARY KEY(PRICING_ID),
FOREIGN KEY(PRO_ID) REFERENCES PRODUCT(PRO_ID),
FOREIGN KEY(SUPP_ID) REFERENCES SUPPLIER(SUPP_ID));

CREATE TABLE  `order`(
ORD_ID INT NOT NULL,
ORD_AMOUNT INT NOT NULL,
ORD_DATE DATE NOT NULL,
CUS_ID INT,
PRICING_ID INT NOT NULL,
FOREIGN KEY(CUS_ID) REFERENCES CUSTOMER(CUS_ID),
FOREIGN KEY(PRICING_ID) REFERENCES SUPPLIER_PRICING(PRICING_ID),
PRIMARY KEY(ORD_ID));

CREATE TABLE RATING(
RAT_ID INT NOT NULL,
ORD_ID INT NOT NULL,
RAT_RATSTARS INT NOT NULL,
PRIMARY KEY(RAT_ID),
FOREIGN KEY(ORD_ID) REFERENCES `order`(ORD_ID));

INSERT INTO SUPPLIER
(SUPP_ID , SUPP_NAME , SUPP_CITY, SUPP_PHONE)
VALUES(1 ,'Rajesh Retails' , 'Delhi' , '1234567890')
VALUES(2 , 'Appario Ltd.', 'Mumbai' ,  '2589631470') 
VALUES(3 , 'Knome products' , 'Banglore' ,'9785462315')
VALUES(4 , 'Bansal Retails' , 'Kochi' , '8975463285')
VALUES(5 , 'Mittal Ltd.' , 'Lucknow' , '7898456532')


INSERT INTO CUSTOMER
(CUS_ID , CUS_NAME , CUS_PHONE , CUS_CITY , CUS_GENDER)
VALUES(2 , 'AMAN' , '9785463215' , 'NOIDA','M')
VALUES(3 , 'NEHA' , '9999999999' , 'MUMBAI' , 'F')
VALUES(4 , 'MEGHA' , '9994562399' , 'KOLKATA' , 'F')
VALUES(5 , 'PULKIT' , '7895999999' , 'LUCKNOW' , 'M')



INSERT INTO CATEGORY
(CAT_ID , CAT_NAME)
VALUES(1,'BOOKS')
VALUES(2,'GAMES')
VALUES(3,'GROCERIES')
VALUES(4,'ELECTRONICS')
VALUES(5,'CLOTHES')



INSERT INTO PRODUCT
(PRO_ID, PRO_NAME ,PRO_DESC , CAT_ID)
VALUES(1,'GTA V','Windows 7 and above with i5 processor and 8GB RAM',2)
VALUES(2,'TSHIRT','SIZE-L with Black, Blue and White variations',2)
VALUES(3,'ROG LAPTOP' ,'Windows 10 with 15inch screen, i7 processor, 1TB SSD',4)
VALUES(4,'OATS','Highly Nutritious from Nestle',3)
VALUES(5,'HARRY POTTER','Best Collection of all time by J.K Rowling',1)
VALUES(6,'MILK','1L Toned MIlk',3)
VALUES(7,'Boat Earphones','1.5Meter long Dolby Atmos',4)
VALUES(8,'Jeans' , 'Stretchable Denim Jeans with various sizes and color',5)
VALUES(9,'Projct IGI','compatible with windows 7 and above',2)
VALUES(10,'Hoodie','Black GUCCI for 13 yrs and above',5 )
VALUES(11,'Rich Dad Poor Dad','Written by RObert Kiyosaki',1)
VALUES(12,'Train Your Brain','By Shireen Stephen',1)



INSERT INTO SUPPLIER_PRICING
(PRICING_ID,PRO_ID,SUPP_ID,SUPP_PRICE)
VALUES(1,1,2,1500)
VALUES(2,3,5,30000)
VALUES(3,5,1,3000)
VALUES(4,2,3,2500)
VALUES(5,4,1,1000)
VALUES(6,12,2,780)
VALUES(7,12,4,789)
VALUES(8,3,1,31000)
VALUES(9,1,5,1450)
VALUES(10,4,2,999)
VALUES(11,7,3,549)
VALUES(12,7,4,529)
VALUES(13,6,2,105)
VALUES(14,6,1,99)
VALUES(15,2,5,2999)
VALUES(16,5,2,2999)


INSERT INTO `order`
(ORD_ID , ORD_AMOUNT , ORD_DATE , CUS_ID ,PRICING_ID)
VALUES(101,1500,"2021-10-06",2,1)
VALUES(102, 1000, "2021-10-12" , 3 ,5)
VALUES(103,30000,"2021-09-16",5,2)
VALUES(104,1500,"2021-10-05",1,1)
VALUES(105,3000,"2021-08-16",4,3)
VALUES(106,1450,"2021-08-18",1,9)
VALUES(107,789,"2021-09-01",3,7)
VALUES(108,780,"2021-09-07",5,6)
VALUES(109,3000,"2021-09-10",5,3)
VALUES(110,2500,"2021-09-10",2,4)
VALUES(111 ,1000,"2021-09-15",4,5)
VALUES(112,789,"2021-09-16",4,7)
VALUES(113,31000,"2021-09-16",1,8)
VALUES(114,1000,"2021-09-16",3,5)
VALUES(115,3000,"2021-09-16",5,3)
VALUES(116,99,"2021-09-17",2,14)

INSERT INTO RATING
(RAT_ID , ORD_ID , RAT_RATSTARS)
VALUES(1,101,4)
VALUES(2,102,3)
VALUES(3,103,1)
VALUES(4,104,2)
VALUES(5,105,4)
VALUES(6,106,3)
VALUES(7,107,4)
VALUES(8,108,4)
VALUES(9,109,3)
VALUES(10,110,5)
VALUES(11,111,3)
VALUES(12,112,4)
VALUES(13,113,2)
VALUES(14,114,1)
VALUES(15,115,1)
VALUES(16,116,0)

-- 4) Display the total number of customers based on gender who have placed individual orders of worth at least Rs.3000.

SELECT V.CUSTOMERGEN , COUNT(V.CUSTOMERGEN)
FROM 
	(SELECT C.CUS_GENDER AS CUSTOMERGEN , C.CUS_ID AS CUSTOMERID ,C.CUS_NAME AS CUSTOMERNAME
	FROM CUSTOMER C 
	INNER JOIN `ORDER` O 
	ON C.CUS_ID = O.CUS_ID
	WHERE O.ORD_AMOUNT>=3000
    GROUP BY C.CUS_ID)
AS V  
GROUP BY V.CUSTOMERGEN;    


-- 5) Display all the orders along with product name ordered by a customer having CUSTOMER_ID = 2


	SELECT O.*  , P.PRO_NAME    
	FROM `ORDER` AS O
	INNER JOIN CUSTOMER AS C
	ON O.CUS_ID = C.CUS_ID
	INNER JOIN SUPPLIER_PRICING AS SP
	ON SP.PRICING_ID = O.PRICING_ID
	INNER JOIN PRODUCT AS P 
	ON P.PRO_ID = SP.PRO_ID
    WHERE O.CUS_ID = 2;

-- 6) Display the Supplier details who can supply more than one product.
 SELECT S.* , V.PRODUCT_COUNT 
 FROM
 SUPPLIER AS S INNER JOIN 
	 (SELECT SP.SUPP_ID , COUNT(SP.PRO_ID) AS PRODUCT_COUNT
	 FROM SUPPLIER_PRICING SP
	 GROUP BY SP.SUPP_ID)AS V
  ON S.SUPP_ID = V.SUPP_ID 
  WHERE V.PRODUCT_COUNT >1; 

-- 7) Find the least expensive product from each category and print the table with category id, name, product name and price of the product
-- 8) Display the Id and Name of the Product ordered after “2021-10-05”.
-- order, supplier_pricing ,product

select p.pro_id, p.pro_name
from `order` o
inner join supplier_pricing sp on sp.PRICING_ID=o.PRICING_ID
inner join product p on p.pro_id=sp.PRO_ID
where o.ORD_DATE> '2021-10-05';

-- 9) Display customer name and gender whose names start or end with character 'A'.

select * from customer c 
where c.cus_name like 'A%'
or c.cus_name like 'A%';

/*-- 10) Create a stored procedure to display supplier id, name, Rating(Average rating of all the products sold by every customer) and 
Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average 
Service” else print “Poor Service”. Note that there should be one rating per supplier*/

-- select * from rating

-- select * from `order`
-- select * from supplier_pricing sp
-- select * from supplier 



SELECT
  report.supp_id,
  report.supp_name,
  CASE
    WHEN report.average = 5 THEN 'Excellent Service'
    WHEN report.average > 4 THEN 'Good Service'
    WHEN report.average > 2 THEN 'Average Service'
    ELSE 'Poor Service'
  END AS type_of_service
FROM
  (
    SELECT
      s.*,
      final.average
    FROM
      supplier s
      INNER JOIN (
        SELECT
          vv.supp_id,
          AVG(vv.rat_ratstars) AS average
        FROM
          (
            SELECT
              sp.pricing_id,
              sp.pro_id,
              sp.supp_id,
              sp.supp_price,
              v.ord_id,
              v.rat_ratstars
            FROM
              supplier_pricing sp
              INNER JOIN (
                SELECT
                  o.ord_id,
                  o.pricing_id,
                  r.rat_ratstars
                FROM
                  `order` o
                  INNER JOIN rating r ON r.ord_id = o.ord_id
              ) AS v ON sp.pricing_id = v.pricing_id
          ) AS vv
        GROUP BY
          vv.supp_id
      ) AS final ON final.supp_id = s.supp_id
  ) AS report;

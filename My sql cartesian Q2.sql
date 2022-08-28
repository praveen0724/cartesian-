CREATE TABLE Customer (Customer_Id VARCHAR(300));
INSERT INTO Customer VALUES('Abhinash'),('Vipin'),('Mahesh'),('Bijoy'),('Bhabani'),('Ashutosh');
CREATE TABLE Voucher (Voucher_Id VARCHAR(300) UNIQUE);
INSERT INTO Voucher VALUES('ABXFH'),('SDFGH'),('ERTYY'),('PPLKM');
WITH cte as(SELECT *,ROW_NUMBER() OVER(ORDER BY Customer_Id) rr FROM Customer),cte2 AS(SELECT *,ROW_NUMBER() OVER(ORDER BY Voucher_Id) rr FROM Voucher)
SELECT Customer_Id Customer_Key,Voucher_Id Gift_Voucher_Key FROM cte c1 LEFT JOIN cte2 c2 ON c1.rr=c2.rr;

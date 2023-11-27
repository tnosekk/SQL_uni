--2. Podaj maksymalną cenę produktu dla produktów o cenach poniżej 20
 
 
SELECT  max(UnitPrice)
FROM Products
WHERE UnitPrice<20;


-- 4. Wypisz informację o wszystkich produktach o cenie powyżej średniej
select * 
from Products
where UnitPrice > (select avg(UnitPrice) from Products)

-- 5. Podaj sumę/wartość zamówienia o numerze 10250
 
select SUM(unitprice * quantity * (1-discount)) wartosc
from [Order Details]
where orderid = 10250
 
select ROUND(SUM(unitprice * quantity * (1-discount)),2) wartosc
from [Order Details]
where orderid = 10250

-- 1. Podaj maksymalną cenę zamawianego produktu dla każdego zamówienia
 
SELECT OrderId, max(UnitPrice)
FROM [Order Details]
GROUP BY OrderID
 
SELECT * 
FROM [Order Details]
Where OrderID = 10248


-- 2. Posortuj zamówienia wg maksymalnej ceny produktu
 
SELECT OrderId, max(UnitPrice)
FROM [Order Details]
GROUP BY OrderID
ORDER BY max(UnitPrice)

-- 3. Podaj maksymalną i minimalną cenę zamawianego produktu dla każdego zamówienia
 
SELECT OrderID, max(unitPrice), min(UnitPrice)
FROM [Order Details]
GROUP BY OrderID
ORDER BY OrderID


--4.Podaj liczbę zamówień dostarczanych przez poszczególnych spedytorów (przewoźników)
 
SELECT ShipVia, COUNT(*)
FROM Orders
GROUP BY ShipVia
 
SELECT ShipVia, COUNT(ShipVia)
FROM Orders
GROUP BY ShipVia
 
SELECT ShipVia, COUNT(ShippedDate)
FROM Orders
GROUP BY ShipVia



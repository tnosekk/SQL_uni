-- 1. Dla każdego zamówienia podaj łączną liczbę zamówionych jednostek towaru oraz
-- nazwę klienta.

SELECT
    o.OrderID,
    Quantity,
    Orders.CustomerID
FROM
    [Order Details] o INNER JOIN Orders 
    ON
        o.OrderID = Orders.OrderID

 


-- 2. Dla każdego zamówienia podaj łączną wartość zamówionych produktów (wartość
-- zamówienia bez opłaty za przesyłkę) oraz nazwę klienta.

SELECT
    o.orderid,
    orders.CustomerID,
    ROUND(SUM(o.UnitPrice * o.Quantity * (1-o.Discount)),2 ) AS TotalItemsValue
FROM
    [Order Details] o INNER JOIN Orders
    ON
        o.OrderID = Orders.OrderID
GROUP BY
    o.OrderID,
    orders.CustomerID


-- 3. Dla każdego zamówienia podaj łączną wartość tego zamówienia (wartość
-- zamówienia wraz z opłatą za przesyłkę) oraz nazwę klienta.

SELECT
    o.orderid,
    orders.CustomerID,
    ROUND((SUM(o.UnitPrice * o.Quantity * (1-o.Discount)))+Orders.Freight,2 ) AS TotalItemsValue
FROM
    [Order Details] o INNER JOIN Orders
    ON
        o.OrderID = Orders.OrderID
GROUP BY
    o.OrderID,
    orders.CustomerID,
    orders.Freight


-- 4. Zmodyfikuj poprzednie przykłady tak żeby dodać jeszcze imię i nazwisko pracownika
-- obsługującego zamówień

SELECT
    o.OrderID,
    e.FirstName,
    e.LastName,
    o.CustomerID,
    ROUND((SUM(od.UnitPrice * od.Quantity * (1-od.Discount)))+o.Freight,2 ) AS TotalItemsValue
FROM
    Orders o
JOIN 
    [Order Details] od ON o.OrderID = od.OrderID
JOIN
    Employees e ON o.EmployeeID = e.EmployeeID
GROUP BY
    o.OrderID,
    e.FirstName,
    e.LastName,
    o.CustomerID,
    o.Freight

---------------------------------------------------------------------------------------------


-- 1. Dla każdej kategorii produktu (nazwa), podaj łączną liczbę zamówionych przez
-- klientów jednostek towarów z tej kategorii.

SELECT
    c.CategoryName,
    sum(od.Quantity) AS TotalUnitsOrdered
FROM
    [Order Details] od
JOIN
    Products p on p.ProductID = od.ProductID
JOIN
    Categories c on c.CategoryID = p.CategoryID
Group BY
    c.CategoryName
    



-- 2. Dla każdej kategorii produktu (nazwa), podaj łączną liczbę zamówionych w 1997r
-- jednostek towarów z tej kategorii.


SELECT
    c.CategoryName,
    o.orderdate,
    sum(od.Quantity) AS TotalUnitsOrdered
FROM
    [Order Details] od
JOIN
    Products p on p.ProductID = od.ProductID
JOIN
    Categories c on c.CategoryID = p.CategoryID
JOIN
    Orders o on o.OrderID = od.OrderID
WHERE
    YEAR(o.orderdate) = '1997'
Group BY
    c.CategoryName,
    o.OrderDate


-- 3. Dla każdej kategorii produktu (nazwa), podaj łączną wartość zamówionych przez
-- klientów jednostek towarów z tek kategorii.


SELECT
    c.CategoryName,
    o.CustomerID,
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS TotalValueOrdered
FROM
    [Order Details] od
JOIN
    Products p on p.ProductID = od.ProductID
JOIN
    Categories c on c.CategoryID = p.CategoryID
JOIN
    Orders o on o.OrderID = od.OrderID
Group BY
    c.CategoryName,
    o.CustomerID

-- 4. Dla każdej kategorii produktu (nazwa), podaj łączną wartość zamówionych towarów z
-- tej kategorii.

SELECT
    c.CategoryName,
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS TotalValueOrdered
FROM
    [Order Details] od
JOIN
    Products p on p.ProductID = od.ProductID
JOIN
    Categories c on c.CategoryID = p.CategoryID
Group BY
    c.CategoryName

---------------------------------------------------------------------------------------

--1. Dla każdego przewoźnika (nazwa) podaj liczbę zamówień które przewieźli w 1997r

SELECT
    s.ShipperID,
    COUNT(OrderID)
FROM
    Orders o
JOIN Shippers s
    ON s.ShipperID = o.ShipVia
WHERE
    year(o.orderdate) = 1997
GROUP BY
    s.ShipperID


--2. Który z przewoźników był najaktywniejszy (przewiózł największą liczbę zamówień) w
--1997r, podaj nazwę tego przewoźnika

SELECT TOP(1)
    s.ShipperID,
    COUNT(orderID) as numorders
from
    orders o
join shippers s
    on s.ShipperID = o.shipvia
WHERE
    year(o.orderdate) = 1997
group by
    s.shipperid
order by 
    numorders DESC


--3. Dla każdego przewoźnika podaj łączną wartość "opłat za przesyłkę" przewożonych
--przez niego zamówień od '1998-05-03' do '1998-05-29'

select
    companyname,
    isnull(sum(freight),0) as freight_sum
from
    orders o
join shippers s
    on o.shipvia = s.shipperid
where
    o.orderdate between '1998-05-03' and '1998-05-29'
group by
    s.CompanyName


--4. Dla każdego pracownika (imię i nazwisko) podaj łączną wartość zamówień
--obsłużonych przez tego pracownika w maju 1996

SELECT
    LastName,
    FirstName,
    count(orderid)
from
    orders o
join employees e
    on o.EmployeeID = e.EmployeeID
WHERE
    orderdate BETWEEN '1997-05-1' and '1997-05-31'
Group BY
    LastName,
    FirstName



--5. Który z pracowników obsłużył największą liczbę zamówień w 1996r, podaj imię i
--nazwisko takiego pracownika

SELECT top(5)
    e.EmployeeID,
    count(OrderID) as order_num
FROM 
    Orders o
JOIN
    Employees e
    on o.EmployeeID = e.EmployeeID
WHERE
    YEAR(OrderDate) = 1996
Group  BY
    e.EmployeeID
ORDER BY
    order_num DESC



--6. Który z pracowników był najaktywniejszy (obsłużył zamówienia o największej
--wartości) w 1996r, podaj imię i nazwisko takiego pracownika


------------------------------------------------------------------------

--Dla każdego pracownika (imię i nazwisko) podaj łączną wartość zamówień
--obsłużonych przez tego pracownika
--Ogranicz wynik tylko do pracowników
--a) którzy mają podwładnych
--b) którzy nie mają podwładnych
--2. Napisz polecenie, które wyświetla klientów z Francji którzy w 1998r złożyli więcej niż
---dwa zamówienia oraz klientów z Niemiec którzy w 1997r złożyli więcej niż trzy
---zamówienia


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


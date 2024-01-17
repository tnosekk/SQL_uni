---Który ze spedytorów był najaktywniejszy w 1997 roku (największa liczba dostaw):

SELECT 
    s.CompanyName,
    COUNT(Orders.OrderID) AS NumberOfDeliveries
FROM 
    Orders
INNER JOIN Shippers s 
    ON Orders.ShipVia = s.ShipperID
WHERE 
    YEAR(Orders.OrderDate) = 1997
GROUP BY 
    s.CompanyName
ORDER BY 
    NumberOfDeliveries DESC



--- Dla każdego zamówienia podaj wartość zamówionych produktów:

SELECT 
    o.OrderID,
    o.OrderDate,
    c.CompanyName, 
    SUM(od.UnitPrice *od.Quantity * (1 - od.Discount)) AS TotalValue
FROM 
    Orders o
INNER JOIN Customers c 
    ON o.CustomerID = c.CustomerID
INNER JOIN [Order Details] od 
    ON o.OrderID = od.OrderID
GROUP BY 
    o.OrderID,
    o.OrderDate,
    c.CompanyName;


-- Dla każdego zamówienia podaj jego pełną wartość (wliczając opłatę za przesyłkę):

SELECT 
    o.OrderID,
    OrderDate,
    CompanyName, 
    SUM(od.UnitPrice * Quantity * (1 - Discount)) + Freight AS TotalOrderValue
FROM 
    Orders o 
JOIN Customers c 
    ON o.CustomerID = c.CustomerID
JOIN [Order Details] od 
    ON o.OrderID = od.OrderID
GROUP BY 
    o.OrderID, OrderDate, CompanyName, Freight
ORDER BY 
    o.orderid



-- Dla każdego produktu podaj wartość sprzedaży tego produktu w marcu 1997:

SELECT 
    p.ProductID,
    p.productname,
    isnull(SUM(od.UnitPrice * Quantity * (1 - Discount)),0) AS SalesValue
FROM 
    [Order Details] od 
JOIN Orders o 
    ON od.OrderID = o.OrderID and YEAR(o.OrderDate) = 1997 AND MONTH(o.OrderDate) = 3
right join Products p on p.ProductID = od.ProductID
GROUP BY 
    p.ProductID,
    p.ProductName



--- Wybierz nazwy i numery telefonów klientów, którym w 1997 roku przesyłki dostarczała firma ‘United Package’:

SELECT DISTINCT 
    c.Companyname,
    c.phone
FROM
    Orders o
JOIN customers c 
    on o.CustomerID = c.customerid
Join shippers s
    on o.shipvia = s.shipperid
where
    s.CompanyName = 'United Package' and year(o.OrderDate) = 1997
GROUP BY
    C.CompanyName, c.Phone

--- Wybierz nazwy i numery telefonów klientów, którym w 1997 roku przesyłek nie dostarczała firma ‘United Package’:

select
    c.CompanyName,
    c.phone
from customers c
where c.CustomerID not in (
    select o.CustomerID
    from orders o
    inner join shippers s
        on o.shipvia = s.ShipperID
    WHERE
        s.CompanyName = 'United Package' and year(o.OrderDate) = 1997
)

--- CWICZENIE 1

--- 1. Napisz polecenie, które oblicza wartość każdego zamówienia i zwraca wynik posortowany w malejącej kolejności wg wartości zamówień.

SELECT 
    OrderID,
    ROUND((UnitPrice * Quantity * (1-Discount)),2) as Total_Price
FROM
    [Order Details]
ORDER BY
    Total_Price

--- 2. Zmodyfikuj zapytanie z poprzedniego punktu, tak aby zwracało pierwszych 10 wierszy

SELECT TOP 10 
    OrderID,
    ROUND((UnitPrice * Quantity * (1-Discount)),2) as Total_Price
FROM
    [Order Details]
ORDER BY
    Total_Price

--- 3. Podaj  nr zamówienia oraz wartość  zamówienia, dla zamówień, dla których łączna liczba zamawianych jednostek produktów jest większa niż 250

SELECT
    orderID,
    SUM(UnitPrice * Quantity * (1-Discount)) as Total_Price,
    SUM(Quantity) as Suma_jednostek
FROM
    [Order Details]
GROUP BY
    OrderID
HAVING
    SUM(Quantity) > 250

    
--- 4. Podaj liczbę zamówionych jednostek produktów dla  produktów, dla których productid jest mniejszy niż 3

SELECT
    SUM(Quantity)
FROM
    [Order Details]
WHERE
    ProductID < 3



--- CWICZENIE 4.

-- 1. Dla każdego pracownika podaj liczbę obsługiwanych przez niego zamówień
SELECT
    EmployeeID,
    COUNT(OrderID) as no_of_orders
FROM
    Orders
GROUP BY
    EmployeeID

 
-- 2. Dla każdego spedytora/przewoźnika podaj łączną wartość "opłat za przesyłkę" dla przewożonych przez niego zamówień
SELECT
    ShipVia,
    SUM(freight)
FROM
    Orders
GROUP BY
    ShipVia
-- 3. Dla każdego spedytora/przewoźnika podaj łączną wartość "opłat za przesyłkę" przewożonych przez niego zamówień w latach od 1996 do 1997
SELECT
    ShipVia,
    SUM(Freight)
FROM
    Orders
WHERE 
    OrderDate BETWEEN '1996-01-01' AND '1996-12-31'
Group BY
    ShipVia

-- CWICZENIE 5.

-- 1. Dla każdego pracownika podaj liczbę obsługiwanych przez niego zamówień z podziałem na lata
SELECT
    EmployeeID,
    YEAR(Orderdate) as OrderYear,
    count(*) as no_of_orders
FROM
    Orders
GROUP BY
    YEAR(OrderDate),
    EmployeeID
    
-- 2. Dla każdego pracownika podaj liczbę obsługiwanych przez niego zamówień z podziałem na lata i miesiące.
SELECT
    EmployeeID,
    YEAR(Orderdate) as OrderYear,
    MONTH(Orderdate) as OrderMonth,
    count(*) as no_of_orders
FROM
    Orders
GROUP BY
    MONTH(OrderDate),
    YEAR(OrderDate),
    EmployeeID

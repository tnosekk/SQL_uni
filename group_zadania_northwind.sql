
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




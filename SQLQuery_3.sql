use Northwind

--- 3. Wybierz zamówienia złozne w 1997r. Wynik po sortuj malejąco wg numeru
--- miesiąca, a w ramach danego mesiąca rosnąco według ceny za przesyłkę

select 
    OrderID,
    Freight,
    OrderDate,
    MONTH(OrderDate) as 'Month'
from Orders
WHERE
    OrderDate >= '1997-01-01'
ORDER BY
    MONTH(OrderDate) DESC,
    Freight

--- Napisz polecenie, które oblicza wartość kazdej pozycji zamówienia o numerze 10250

SELECT
    Orderid,
    (unitprice*(1-discount))*quantity as total_price,
    Discount
FROM
    [Order details]
WHERE
    orderid = 10250


--- 2. Napisz polecenie które dla każdego dostawcy (supplier) 
--- pokaże pojedynczą kolumnę zawierającą nr telefonu i nr faksu w formacie
--- (numer telefonu i faksu mają być oddzielone przecinkiem)

SELECT CompanyName,
    CASE
        WHEN Fax is NULL then Phone+ ',No fax'
        WHEN Fax is not NULL then Phone+ ',' + Fax
    end [Phone and Fax]
FROM Suppliers;



select top 5
    orderid,
    productid,
    quantity
FROM
    [order details]
order by Quantity DESC

select top 5 with ties
    orderid,
    productid,
    quantity
FROM
    [order details]
order by Quantity DESC




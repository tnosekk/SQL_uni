--- Napisz instrukcję select tak aby wybrać numer zlecenia, datę zamówienia, numer klienta 
---  dla wszystkich niezrealizowanych jeszcze zleceń, dla których krajem odbiorcy jest Argentyna

SELECT
    Orderid,
    orderdate,
    customerid,
    ShipCountry
FROM
    Orders
WHERE
    ShipCountry = 'argentina' and (ShippedDate IS NULL or ShippedDate > GETDATE())


--- 1. Wybierz nazwy i kraje wszystkich klientów, wyniki posortuj według kraju, w ramach danego kraju nazwy firm posortuj alfabetycznie

SELECT
    companyname,
    country
FROM
    Customers
ORDER BY
    Country,
    CompanyName

--- 2. Wybierz informację o produktach (grupa, nazwa, cena), produkty posortuj wg grup a w grupach malejąco wg ceny

SELECT
    CategoryID,
    ProductName,
    UnitPrice
from
    Products
order BY
    CategoryID,
    UnitPrice DESC


--- 3. Wybierz nazwy i kraje wszystkich klientów mających siedziby w Japonii (Japan) 
--- lub we Włoszech (Italy), wyniki posortuj tak jak w pkt 1

SELECT
    CompanyName,
    Country
FROM
    Customers
WHERE
    Country = 'Japan' or Country = 'Italy'
order BY
    Country,
    CompanyName



--- Napisz polecenie, które oblicza wartość każdej pozycji zamówienia o numerze 10250
--- wartos kazdej pozycji = (unitprice*(1-discount))*quanitity

SELECT
    Orderid,
    (unitprice*(1-discount))*quantity as total_price
FROM
    [Order details]
WHERE
    orderid = 10250

--- 2. Napisz polecenie które dla każdego dostawcy (supplier) pokaże pojedynczą kolumnę zawierającą nr telefonu i nr faksu w formacie
--- (numer telefonu i faksu mają być oddzielone przecinkiem)

SELECT
    *
FROM Suppliers;
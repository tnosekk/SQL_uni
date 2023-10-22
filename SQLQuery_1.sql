use Northwind

-- Wybiersz nazwy i adresy klientów

SELECT
    CompanyName,
    Address,
    PostalCode,
    City,
    Country
From
    Customers

-- Wybierz nazwiska i numery telefonow pracownikow

SELECT
    LastName,
    HomePhone
FROM
    Employees

--- Wiberrz nazwy i ceny produktów

SELECT
    ProductName,
    UnitPrice
FROM
    Products

--- Pokaz wszystkie kategorie produktów (nazwy i opisy)

SELECT
    CategoryName,
    Description
FROM
    Categories

--- Pokaz nazwy i adresy stron www dostawcow

SELECT
    CompanyName,
    HomePage
FROM
    Suppliers


---1. Wybierz nazwy i adresy wszystkich klientów mających siedziby w Londynie
SELECT
    CompanyName,
    Address,
    PostalCode,
    City,
    Country
FROM
    Customers
WHERE
    City = 'London'

---2. Wybierz nazwy i adresy wszystkich klientów mających siedziby we Francji lub w Hiszpanii
SELECT
    CompanyName,
    Address,
    PostalCode,
    City,
    Country
FROM
    Customers
Where
    Country = 'France' OR Country = 'Spain'
---3. Wybierz nazwy i ceny produktów o cenie jednostkowej pomiędzy 20.00 a 30.00
SELECT
    ProductName,
    UnitPrice
FROM
    Products
WHERE
    UnitPrice >= 20.00 AND UnitPrice <= 30.00
---4. Wybierz nazwy i ceny produktów z kategorii 'Meat/Poultry'
SELECT
    CategoryID,
    CategoryName
FROM
    Categories

SELECT
    ProductName,
    UnitPrice
FROM
    Products
WHERE 
    CategoryID = 6

---5. Wybierz nazwy produktów oraz inf. o stanie magazynu dla produktów dostarczanych przez firmę ‘Tokyo Traders’
SELECT
    SupplierID,
    CompanyName
FROM
    Suppliers
--- Tokyo Trades ID = 4

SELECT
    ProductName,
    UnitsInStock
FROM
    Products
WHERE
    SupplierID = 4


---6. Wybierz nazwy produktów których nie ma w magazynie

SELECT
    ProductName
FROM
    Products
WHERE
    UnitsInStock = 0


--- 1. Szukamy informacji o produktach sprzedawanych w butelkach (‘bottle’)
SELECT
    Productname
FROM
    Products
Where
    QuantityPerUnit LIKE '%bottle%'

--- 2. Wyszukaj informacje o stanowisku pracowników, których nazwiska zaczynają się na literę z zakresu od B do L
SELECT
    Firstname,
    LastName,
    Title
FROM
    Employees
WHERE
    ---LastName LIKE '[B-L]%'
    LastName >= 'B' ANd LastName <= 'M'

--- 2. Ale inaczej

SELECT
    Firstname,
    LastName,
    Title
FROM
    Employees
WHERE
    LastName LIKE '[B-L]%'
--- 3. Wyszukaj informacje o stanowisku pracowników, których nazwiska zaczynają się na literę B lub L
SELECT
    FirstName,
    LastName,
    Title
FROM
    Employees
WHERE
    LastName LIKE '[BL]%'

--- 4. Znajdź nazwy kategorii, które w opisie zawierają przecinek
SELECT
    CategoryName,
    [Description]
FROM
    Categories
WHERE
    Description LIKE '%,%'


--- 5. Znajdź klientów, którzy w swojej nazwie mają w którymś miejscu słowo ‘Store’

SELECT
    CompanyName
FROM
    Customers
WHERE
    CompanyName LIKE '%Store%'


--- 1. Szukamy informacji o produktach o cenach mniejszych niż 10 lub większych niż 20

--- 2. Wybierz nazwy i ceny produktów o cenie jednostkowej pomiędzy 20.00 a 30.00
SELECT
    Productname,
    UnitPrice
FROM
    Products
Where
    UnitPrice >= 20.00 AND UnitPrice <= 30.00
ORDER BY
    UnitPrice DESC

--- 3. WYbierz zamowienia zlozone w 1997 roku
SELECT
    OrderId,
    OrderDate
FROM
    Orders
WHERE
    OrderDate >= '1997' AND Orderdate < '1998'
ORDER BY
    OrderDate

--- Napisz instrukcję select tak aby wybrać numer zlecenia, 
--- datę zamówienia, numer klienta dla wszystkich niezrealizowanych jeszcze zleceń, dla których krajem odbiorcy jest Argentyna

SELECT
    OrderId,
    CustomerID,
    OrderDate,
    Shippeddate
FROM
    Orders
WHERE
    ShipCountry = 'Argentina' and (Shippeddate IS NULL OR Shippeddate > GETDATE())


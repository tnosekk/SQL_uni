-- 1. Ilu jest dorosłych członków biblioteki

SELECT
    COUNT(member_no)
FROM
    adult

-- 2. Ile jest dzieci zapisanych do biblioteki

SELECT
    COUNT(member_No)
FROM
    Juvenile


-- 3. Ilu z dorosłych członków biblioteki mieszka w Arizonie (AZ)

SELECT
    COUNT(member_no)
FROM
    adult
WHERE
    state = 'AZ'


-- 4. Dla każdego członka biblioteki podaj liczbę jego dzieci.

SELECT
    adult_member_no,
    COUNT(member_no) as ChilderNUm
FROM
    juvenile
GROUP BY
    adult_member_no




-- 5. Dla każdego członka biblioteki podaj liczbę jego dzieci urodzonych przed 1998r

SELECT
    adult_member_no,
    COUNT(member_no) as ChilderNum
FROM
    juvenile
WHERE
    YEAR(birth_date) < 1998
GROUP BY
    adult_member_no



-- 6. Dla każdego członka biblioteki mieszkającego w Arizonie podaj liczbę jego dzieci. Uwzględnij tylko takich członków biblioteki którzy mają więcej niż dwoje dzieci

SELECT
    j.adult_member_no,
    COUNT(j.member_no) as ChilderNum
FROM
    juvenile j,
    adult a
WHERE
    j.adult_member_no = a.member_no
    AND a.state = 'AZ'
GROUP BY
    adult_member_no
HAVING
    COUNT(*) > 2





--- CWICZENIE 3.



--1. Dla każdego członka biblioteki podaj liczbę zarezerwowanych przez niego książek

SELECT
    member_no,
    COUNT(isbn) as reserved_no
FROM
    reservation
GROUP BY
    member_no


--2. Dla każdego członka biblioteki podaj liczbę wypożyczonych przez niego książek

SELECT
    member_no,
    COUNT(*) as loan_no
FROM
    loan
GROUP BY
    member_no
ORDER BY
    loan_no DESC




--3. Dla każdego członka biblioteki podaj liczbę książek zwróconych przez niego w 2001r.

select 
    member_no,
    COUNT(*) as book_in_2001
FROM
    loanhist
WHERE
    YEAR(in_date) = 2001
GROUP BY
    member_no
ORDER BY 
    book_in_2001 DESC


--- CWICZENIE 6


-- 1. Na jak długo średnio były wypożyczane książki w maju 2001
SELECT
    AVG(DATEDIFF(DAY,out_date, in_date)) as avg_loan_length
FROM
    loanhist
Where
    YEAR(out_date) = 2002 AND MONTH(out_date) = 5

SELECT 
    AVG(DATEDIFF(day, out_date, due_date)) AS AverageLoanDuration
FROM 
    loanhist
WHERE 
    YEAR(out_date) = 2001 AND MONTH(out_date) = 5;

-- 2. Na jak długo średnio były wypożyczane poszczególne tytuły książki w maju 2001
SELECT
    title_no,
    AVG(DATEDIFF(DAY,out_date, in_date)) as avg_loan_length
FROM
    loanhist
Where
    YEAR(out_date) = 2002 AND MONTH(out_date) = 5
GROUP BY
    title_no

-- 3. Który z tytułów był najczęściej wypożyczany w 2001r
SELECT
    title_no,
    COUNT(*) as no_of_loans
FROM
    loanhist
WHERE
    YEAR(out_date) = 2001
GROUP BY
    title_no
ORDER BY
    no_of_loans DESC



-- 4 Który z tytułów był najczęściej oddawany po terminie
SELECT
    title_no,
    COUNT(*) as LateReturns
FROM
    loanhist
WHERE
    in_date > due_date
GROUP BY
    title_no
ORDER BY
    LateReturns DESC
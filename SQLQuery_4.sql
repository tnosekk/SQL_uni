USE library

-- 1. Napisz polecenie select za pomocą którego uzyskasz identyfikator/numer tytułu oraz tytuł ksiązki



SELECT
    title_no,
    title
FROM
    title

-- 2. Napisz polecenie, które wybiere tytul o numerze/identyfikatorze 10

SELECT
    title_no,
    title
FROM
    title
WHERE
    title_no = 10


-- 3. Napisz polecenie za pomocą ktorego uzyskach nr ksiazki (nr tytulu) i
-- autora dla wszystkich ksiazek, ktorych autorem jest Charles Dickens lub Jane Austen



SELECT
    title_no,
    author
FROM
    title
WHERE
    author = 'Charles Dickens' or author = 'Jane Austen'
    



-- 1. Napisz polecenie, ktore wybiera numer tytulu i tytul dla wszystkich
-- ksiazek, ktorych tytul zawiera slowo 'adventure'

SELECT
    title_no,
    title
FROM
    title
WHERE
    title LIKE '%adventure%'


-- 2. Napisz polecenie ktore wybiera numer czytelnika, oraz zaplacona karte
-- dla wszystkich ksiazek ktore zostaly zwrocone w listopadzie 2001


SELECT
    member_no,
    fine_paid,
    in_date
FROM
    loanhist
WHERE
    fine_paid is not NULL and (MONTH(in_date) = '11' and YEAR(in_date) = '2001')
ORDER BY
    in_date

-- 3. Napisz polecenie ktore wybiera wszystkie unikalne pary miast i stanow z tablicy adult

SELECT
    DISTINCT a.city, a.state
FROM
    adult as a


-- 4. Napisz polecenie ktore wybiera wszystkie tytuly z tablicy title,
-- i wyswietla je w porzadku alfabetycznym

SELECT
    title
FROM
    title
ORDER BY
    title
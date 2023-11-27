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
    COUNT(member_no) as ChilderNUm
FROM
    juvenile
WHERE
    YEAR(birth_date) < 1998
GROUP BY
    adult_member_no



-- 6. Dla każdego członka biblioteki mieszkającego w Arizonie podaj liczbę jego dzieci. Uwzględnij tylko takich członków biblioteki którzy mają więcej niż dwoje dzieci

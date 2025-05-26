1) method - 1: 
SELECT DISTINCT col1, col2
FROM InputTbl;
method - 2:
SELECT col1, col2
FROM InputTbl
GROUP BY col1, col2;
2) SELECT *
FROM TestMultipleZero
WHERE NOT (ISNULL(A, 0) = 0 AND ISNULL(B, 0) = 0 AND ISNULL(C, 0) = 0 AND ISNULL(D, 0) = 0);
3) SELECT *
FROM section1
WHERE id % 2 = 1;
4) SELECT TOP 1 *
FROM section1
ORDER BY id ASC;
5) SELECT TOP 1 *
FROM section1
ORDER BY id DESC;
6) SELECT *
FROM section1
WHERE name LIKE 'b%';
7) SELECT *
FROM ProductCodes
WHERE Code LIKE '%\_%' ESCAPE '\';

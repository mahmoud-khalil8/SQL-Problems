SELECT
    b.n,
    CASE
        WHEN b.p IS NULL THEN 'Root'
        WHEN (SELECT COUNT(*) FROM bst WHERE P =b.N) = 0 THEN 'Leaf'
        ELSE 'Inner'
    END
FROM
    bst b
ORDER BY
    N;

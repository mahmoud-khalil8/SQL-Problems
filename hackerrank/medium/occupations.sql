WITH doctor AS (
    SELECT 
        name,
        ROW_NUMBER() OVER (ORDER BY name) AS rn
    FROM occupations 
    WHERE occupation = 'Doctor'
),
professor AS (
    SELECT 
        name,
        ROW_NUMBER() OVER (ORDER BY name) AS rn
    FROM occupations 
    WHERE occupation = 'Professor'
),
singer AS (
    SELECT 
        name,
        ROW_NUMBER() OVER (ORDER BY name) AS rn
    FROM occupations 
    WHERE occupation = 'Singer'
),
actor AS (
    SELECT 
        name,
        ROW_NUMBER() OVER (ORDER BY name) AS rn
    FROM occupations 
    WHERE occupation = 'Actor'
)
SELECT 
    d.name AS doctor_name,
    p.name AS professor_name,
    s.name AS singer_name,
    a.name AS actor_name
FROM professor p
LEFT JOIN doctor d ON d.rn = p.rn
LEFT JOIN actor a ON a.rn = p.rn
LEFT JOIN singer s ON s.rn = p.rn;

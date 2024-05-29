CREATE TABLE prim_num (num INT);

DECLARE @nr INT = 2;
DECLARE @div INT;
DECLARE @flag BIT;

WHILE @nr <= 1000
BEGIN
    SET @div = @nr - 1;
    SET @flag = 1;

    WHILE @div > 1
    BEGIN
        IF @nr % @div = 0
        BEGIN
            SET @flag = 0;
            BREAK;
        END
        SET @div = @div - 1;
    END

    IF @flag = 1
    BEGIN
        INSERT INTO prim_num (num) VALUES (@nr);
    END

    SET @nr = @nr + 1;
END

SELECT string_agg(num,'&') FROM prim_num;

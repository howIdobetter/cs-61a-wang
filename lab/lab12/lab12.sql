CREATE TABLE finals AS
  SELECT "RSF" AS hall, "61A" as course UNION
  SELECT "Wheeler"    , "61A"           UNION
  SELECT "Pimentel"   , "61A"           UNION
  SELECT "Li Ka Shing", "61A"           UNION
  SELECT "Stanley"    , "61A"           UNION
  SELECT "RSF"        , "61B"           UNION
  SELECT "Wheeler"    , "61B"           UNION
  SELECT "Morgan"     , "61B"           UNION
  SELECT "Wheeler"    , "61C"           UNION
  SELECT "Pimentel"   , "61C"           UNION
  SELECT "Soda 310"   , "61C"           UNION
  SELECT "Soda 306"   , "10"            UNION
  SELECT "RSF"        , "70";

CREATE TABLE sizes AS
  SELECT "RSF" AS room, 900 as seats    UNION
  SELECT "Wheeler"    , 700             UNION
  SELECT "Pimentel"   , 500             UNION
  SELECT "Li Ka Shing", 300             UNION
  SELECT "Stanley"    , 300             UNION
  SELECT "Morgan"     , 100             UNION
  SELECT "Soda 306"   , 80              UNION
  SELECT "Soda 310"   , 40              UNION
  SELECT "Soda 320"   , 30;

CREATE TABLE sharing AS
  SELECT 
    f1.course,
    COUNT(DISTINCT f1.hall) AS shared
  FROM finals f1
  WHERE EXISTS (
    SELECT 1
    FROM finals f2
    WHERE f1.hall = f2.hall
    AND f1.course != f2.course
  )
  GROUP BY f1.course;

CREATE TABLE pairs AS
  SELECT 
    s1.room || ' and ' || s2.room || ' together have ' || (s1.seats + s2.seats) || ' seats' AS rooms
  FROM sizes s1, sizes s2
  WHERE s1.room < s2.room  -- 确保不重复组合且按字母顺序排列
    AND (s1.seats + s2.seats) >= 1000
  ORDER BY (s1.seats + s2.seats) DESC;

CREATE TABLE big AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";

CREATE TABLE remaining AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";


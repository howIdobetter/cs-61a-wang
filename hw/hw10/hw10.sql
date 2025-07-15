CREATE TABLE parents AS
  SELECT "ace" AS parent, "bella" AS child UNION
  SELECT "ace"          , "charlie"        UNION
  SELECT "daisy"        , "hank"           UNION
  SELECT "finn"         , "ace"            UNION
  SELECT "finn"         , "daisy"          UNION
  SELECT "finn"         , "ginger"         UNION
  SELECT "ellie"        , "finn";

CREATE TABLE dogs AS
  SELECT "ace" AS name, "long" AS fur, 26 AS height UNION
  SELECT "bella"      , "short"      , 52           UNION
  SELECT "charlie"    , "long"       , 47           UNION
  SELECT "daisy"      , "long"       , 46           UNION
  SELECT "ellie"      , "short"      , 35           UNION
  SELECT "finn"       , "curly"      , 32           UNION
  SELECT "ginger"     , "short"      , 28           UNION
  SELECT "hank"       , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT p.child from parents as p join dogs as d on p.parent = d.name order by d.height desc;


-- The size of each dog
CREATE TABLE size_of_dogs AS
SELECT d.name, s.size
FROM dogs d, sizes s
WHERE d.height > s.min AND d.height <= s.max;

-- [Optional] Filling out this helper table is recommended
CREATE TABLE siblings AS
  SELECT a.child as sibling1, b.child as sibling2
  from parents a, parents b
  where a.parent = b.parent
    and a.child < b.child;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT 'The two siblings, ' || s.sibling1 || ' and ' || s.sibling2 || 
         ', have the same size: ' || d1.size AS sentence
  FROM siblings s
  JOIN size_of_dogs d1 ON s.sibling1 = d1.name
  JOIN size_of_dogs d2 ON s.sibling2 = d2.name
  WHERE d1.size = d2.size;


-- Height range for each fur type where all of the heights differ by no more than 30% from the average height
CREATE TABLE low_variance AS
  SELECT d1.fur,
    MAX(d1.height) - MIN(d1.height) AS height_range
  FROM dogs d1
  GROUP BY d1.fur
  HAVING MAX(d1.height) <= 1.3 * AVG(d1.height)
     AND MIN(d1.height) >= 0.7 * AVG(d1.height);;


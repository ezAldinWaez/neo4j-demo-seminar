// Age at marriage vs lifespan summary (tabular)
MATCH (p:Person)-[:SPOUSE_OF]->(f:Family)
WITH p, f,
  duration.inYears(p.birth_date, f.marriage_date).years AS age_at_marriage,
  CASE
    WHEN p.death_date IS NULL THEN NULL
    ELSE duration.inYears(p.birth_date, p.death_date).years
  END AS lifespan_years
WHERE age_at_marriage IS NOT NULL
WITH
  p.sex AS sex,
  CASE
    WHEN age_at_marriage < 20 THEN 'UNDER_20'
    WHEN age_at_marriage < 25 THEN '20_24'
    WHEN age_at_marriage < 30 THEN '25_29'
    WHEN age_at_marriage < 35 THEN '30_34'
    ELSE '35_PLUS'
  END AS age_bucket,
  age_at_marriage,
  lifespan_years
RETURN
  sex,
  age_bucket,
  count(*) AS people,
  round(avg(age_at_marriage), 1) AS avg_age_at_marriage,
  round(avg(lifespan_years), 1) AS avg_lifespan
ORDER BY sex, age_bucket;

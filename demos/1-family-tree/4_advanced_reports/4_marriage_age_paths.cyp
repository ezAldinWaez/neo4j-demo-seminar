// Extremes of age at marriage with spouse paths (graph)
CALL {
  MATCH (p:Person)-[:SPOUSE_OF]->(f:Family)<-[:SPOUSE_OF]-(spouse:Person)
  WITH p, f, spouse, duration.inYears(p.birth_date, f.marriage_date).years AS age_at_marriage
  ORDER BY age_at_marriage ASC
  LIMIT 5
  RETURN 'YOUNGEST' AS cohort, p, spouse, f, age_at_marriage
  UNION ALL
  MATCH (p:Person)-[:SPOUSE_OF]->(f:Family)<-[:SPOUSE_OF]-(spouse:Person)
  WITH p, f, spouse, duration.inYears(p.birth_date, f.marriage_date).years AS age_at_marriage
  ORDER BY age_at_marriage DESC
  LIMIT 5
  RETURN 'OLDEST' AS cohort, p, spouse, f, age_at_marriage
}
WITH cohort, p, spouse, f, age_at_marriage,
  CASE
    WHEN p.death_date IS NULL THEN NULL
    ELSE duration.inYears(p.birth_date, p.death_date).years
  END AS lifespan_years
MATCH path = (p)-[:SPOUSE_OF]->(f)<-[:SPOUSE_OF]-(spouse)
RETURN cohort, path, p, spouse, f, age_at_marriage, lifespan_years
ORDER BY cohort, age_at_marriage;

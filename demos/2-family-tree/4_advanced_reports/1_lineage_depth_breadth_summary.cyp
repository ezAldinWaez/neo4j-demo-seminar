// Lineage depth and breadth summary (tabular)
MATCH path = (root:Person)-[:SPOUSE_OF|CHILD_OF*2..12]-(descendant:Person)
WHERE root <> descendant
WITH root, descendant, relationships(path) AS rels
WHERE size(rels) % 2 = 0
  AND all(i IN range(0, size(rels) - 1) WHERE
    (i % 2 = 0 AND type(rels[i]) = 'SPOUSE_OF') OR
    (i % 2 = 1 AND type(rels[i]) = 'CHILD_OF')
  )
WITH root, descendant,
  size([r IN rels WHERE type(r) = 'CHILD_OF']) AS generation_depth
RETURN
  root.id AS person_id,
  root.first_name AS first_name,
  root.last_name AS last_name,
  count(DISTINCT descendant) AS total_descendants,
  max(generation_depth) AS max_generation_depth
ORDER BY max_generation_depth DESC, total_descendants DESC, last_name, first_name;

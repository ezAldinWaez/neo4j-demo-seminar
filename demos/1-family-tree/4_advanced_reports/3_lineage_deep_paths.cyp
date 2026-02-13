// Deepest lineage paths for visualization (graph)
MATCH path = (root:Person)-[:SPOUSE_OF|CHILD_OF*2..12]-(descendant:Person)
WHERE root <> descendant
WITH path, root, descendant, relationships(path) AS rels
WHERE size(rels) % 2 = 0
  AND all(i IN range(0, size(rels) - 1) WHERE
    (i % 2 = 0 AND type(rels[i]) = 'SPOUSE_OF') OR
    (i % 2 = 1 AND type(rels[i]) = 'CHILD_OF')
  )
WITH path, root, descendant,
  size([r IN rels WHERE type(r) = 'CHILD_OF']) AS generation_depth
ORDER BY generation_depth DESC, root.last_name, root.first_name
LIMIT 10
RETURN path, root, descendant, generation_depth;

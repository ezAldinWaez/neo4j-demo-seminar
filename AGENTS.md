# AGENTS.md

This file provides guidance to agents when working with code in this repository.

# Project Guidelines

## Code Style
- Cypher scripts use `//` comments, uppercase keywords, and a single comma-delimited `CREATE` block for node/relationship creation. See demos/1-family-tree/1_init/load_cruz_young_family_tree.cyp.
- Dates are stored as `date('YYYY-MM-DD')`, and enums are uppercase strings (e.g., `HUSBAND`, `WIFE`, `ACTIVE`). See demos/1-family-tree/1_init/load_cruz_young_family_tree.cyp.

## Architecture
- This is a Neo4j seminar demo centered on a family tree dataset. The main dataset is defined in demos/1-family-tree/1_init/load_cruz_young_family_tree.cyp.
- `Person` nodes have `id`, `first_name`, `last_name`, `sex`, `birth_date`, optional `death_date`, `education`, `works`.
- `Family` nodes have `id`, `marriage_date`, `status`, optional `divorce_date`.
- Relationships: `SPOUSE_OF` (with `role` = `HUSBAND` or `WIFE`) and `CHILD_OF` from person to family.

## Build and Test
- No build system in this repo; run Cypher scripts directly in Neo4j.
- Start Neo4j locally (Docker): `docker run -d -p 7474:7474 -p 7687:7687 -e NEO4J_AUTH=neo4j/password neo4j:latest`.
- Load data: open demos/1-family-tree/1_init/load_cruz_young_family_tree.cyp in Neo4j Browser and execute the script.
- Validate data with the single-purpose checks in demos/1-family-tree/2_validation_queries (spouse count/roles, gender consistency, birth before marriage, death after birth).

## Project Conventions
- Constraints are created with `IF NOT EXISTS` for idempotent runs. See demos/1-family-tree/1_init/load_cruz_young_family_tree.cyp.
- Validation queries are separate, scoped scripts under demos/1-family-tree/2_validation_queries.
- Reports live in demos/1-family-tree/3_basic_reports; advanced reports are staged under demos/1-family-tree/4_advanced_reports.

## Integration Points
- Neo4j database (5.x or 6.x). Optional Python driver usage is documented in the dev environment note below.

## Security
- Demo credentials in the Docker example (`neo4j/password`) are for local use only.

## Development Environment
- Python 3.14 venv with Neo4j libraries: `neo4j` (6.0.3), `neomodel` (6.0.1), `py2neo` (2021.2.4).
- Activate the venv with: `source .venv/bin/activate`.

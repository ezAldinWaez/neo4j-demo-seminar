# AGENTS.md

This file provides guidance to agents when working with code in this repository.

# Project Guidelines

## Code Style
- **General**: Cypher scripts use `//` comments and uppercase keywords (e.g., `MATCH`, `CREATE`).
- **Family Tree**: Uses single comma-delimited `CREATE` blocks. Dates are `date('YYYY-MM-DD')`. Enums are uppercase strings (`HUSBAND`, `WIFE`). See `demos/1-family-tree/1_init/load_cruz_young_family_tree.cyp`.
- **Movies**: Follows standard Neo4j conventions. PascalCase labels (`Person`, `Movie`), UPPER_SNAKE_CASE relationships (`ACTED_IN`), and camelCase properties (`tagline`). See `demos/2-movies/1_create/create_movies.cyp`.
- **Python**: Standard `snake_case`. Uses type hinting and `textwrap.dedent` for Cypher queries.

## Architecture
- **Family Tree (`demos/1-family-tree`)**:
  - `Person` nodes: `id`, `first_name`, `last_name`, `sex`, `birth_date`, `death_date`.
  - `Family` nodes: `id`, `marriage_date`, `status`, `divorce_date`.
  - Relationships: `SPOUSE_OF` (roles `HUSBAND`/`WIFE`), `CHILD_OF`.
- **Movies (`demos/2-movies`)**:
  - `Person` nodes (`name`, `born`) connected to `Movie` nodes (`title`, `released`, `tagline`) via `ACTED_IN`, `DIRECTED`, etc.
- **Python App (`demos/3-movies-python-bolt`)**:
  - Web app with Sync (Flask) and Async (FastAPI) modes.
  - Frontend: `static/index.html` (jQuery, d3.js).
  - Backend: Connects to Neo4j via official Python driver.

## Build and Test
- **Family Tree**:
  - Start Neo4j: `docker run -d -p 7474:7474 -p 7687:7687 -e NEO4J_AUTH=neo4j/password neo4j:latest`.
  - Load: Run `demos/1-family-tree/1_init/load_cruz_young_family_tree.cyp`.
  - Validate: Run scripts in `demos/1-family-tree/2_validation_queries`.
- **Movies Python App**:
  - Requires Python 3.10+.
  - Install dependencies: `pip install -r demos/3-movies-python-bolt/requirements-sync.txt` (or separate async reqs).
  - Run Sync: `python demos/3-movies-python-bolt/movies_sync.py` (http://127.0.0.1:8080).
  - Run Async: `python demos/3-movies-python-bolt/movies_async.py` (http://127.0.0.1:8080).
  - Config: Set `NEO4J_URI`, `NEO4J_USER`, `NEO4J_PASSWORD` environment variables if not using default.

## Project Conventions
- **Family Tree**: Constraints created with `IF NOT EXISTS`. Validation queries are strictly scoped. Reports in `3_basic_reports` and `4_advanced_reports`.
- **Movies**: Numbered folders (`1_create` -> `6_clean_up`) indicate execution order.
- **Python**: Scripts suffixed with `_sync` or `_async`.

## Integration Points
- **Database**: Neo4j 5.x or 6.x.
- **Drivers**: Python `neo4j` driver used in `demos/3-movies-python-bolt`.
- **Visualization**: `neomodel` and `py2neo` libraries available in the environment.

## Security
- **Credentials**: Default Docker credentials (`neo4j/password`) are for local development only. Do not commit real credentials.

## Development Environment
- Python virtual environment is recommended (`.venv`).
- Activate with: `source .venv/bin/activate`.
- Key libraries: `neo4j`, `neomodel`, `py2neo`.

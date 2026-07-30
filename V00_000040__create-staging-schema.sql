\pset pager off
\echo 'Creating staging schema shell after public schema validation...'

create schema if not exists staging;

comment on schema staging is
    'DataVerse proof-of-concept staging schema. Source joins should reference public tables explicitly until promoted to managed migrations.';

select schema_name
from information_schema.schemata
where schema_name = 'staging';

\echo 'Staging schema smoke test passed.'

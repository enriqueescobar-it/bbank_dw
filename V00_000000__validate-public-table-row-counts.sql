\pset pager off
\echo 'Validating public base-table row counts...'

drop table if exists pg_temp.public_table_row_counts;

create temp table public_table_row_counts as
select
    n.nspname as schema_name,
    c.relname as table_name,
    0::bigint as total_rows
from pg_class c
join pg_namespace n on n.oid = c.relnamespace
where n.nspname = 'public'
  and c.relkind = 'r'
order by c.relname;

do $$
declare
    r record;
begin
    for r in
        select schema_name, table_name
        from public_table_row_counts
    loop
        execute format(
            'update public_table_row_counts set total_rows = (select count(*) from %I.%I) where schema_name = %L and table_name = %L',
            r.schema_name,
            r.table_name,
            r.schema_name,
            r.table_name
        );
    end loop;
end $$;

select *
from public_table_row_counts
order by total_rows asc, table_name;

do $$
declare
    failing_count integer;
begin
    select count(*)
    into failing_count
    from public_table_row_counts
    where total_rows < 10;

    if failing_count > 0 then
        raise exception 'Public table row-count validation failed: % table(s) have fewer than 10 rows.', failing_count;
    end if;
end $$;

\echo 'Public base-table row-count validation passed.'

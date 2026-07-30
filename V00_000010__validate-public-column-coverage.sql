\pset pager off
\echo 'Validating public column non-null coverage...'

drop table if exists pg_temp.public_column_coverage;

create temp table public_column_coverage (
    schema_name text not null,
    table_name text not null,
    column_name text not null,
    data_type text not null,
    non_null_rows bigint not null,
    total_rows bigint not null
);

do $$
declare
    r record;
begin
    for r in
        select
            c.table_schema,
            c.table_name,
            c.column_name,
            c.data_type
        from information_schema.columns c
        join information_schema.tables t
          on t.table_schema = c.table_schema
         and t.table_name = c.table_name
        where c.table_schema = 'public'
          and t.table_type = 'BASE TABLE'
        order by c.table_name, c.ordinal_position
    loop
        execute format(
            'insert into public_column_coverage
             select %L, %L, %L, %L, count(%I), count(*)
             from %I.%I',
            r.table_schema,
            r.table_name,
            r.column_name,
            r.data_type,
            r.column_name,
            r.table_schema,
            r.table_name
        );
    end loop;
end $$;

select *
from public_column_coverage
where non_null_rows < 10
order by table_name, column_name;

do $$
declare
    failing_count integer;
begin
    select count(*)
    into failing_count
    from public_column_coverage
    where non_null_rows < 10;

    if failing_count > 0 then
        raise exception 'Public column coverage validation failed: % column(s) have fewer than 10 non-null rows.', failing_count;
    end if;
end $$;

\echo 'Public column coverage validation passed.'

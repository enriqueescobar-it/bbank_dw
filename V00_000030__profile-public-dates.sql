\pset pager off
\echo 'Profiling public date/timestamp columns for staging filter and join readiness...'

drop table if exists pg_temp.public_date_column_profile;

create temp table public_date_column_profile (
    schema_name text not null,
    table_name text not null,
    column_name text not null,
    data_type text not null,
    non_null_rows bigint not null,
    total_rows bigint not null,
    min_value text,
    max_value text
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
          and (
              c.data_type in ('date', 'timestamp without time zone', 'timestamp with time zone')
              or c.column_name ilike '%date%'
              or c.column_name ilike '%time%'
              or c.column_name ilike '%created%'
              or c.column_name ilike '%updated%'
              or c.column_name ilike '%activated%'
          )
        order by c.table_name, c.ordinal_position
    loop
        execute format(
            'insert into public_date_column_profile
             select %L, %L, %L, %L, count(%I), count(*), min(%I)::text, max(%I)::text
             from %I.%I',
            r.table_schema,
            r.table_name,
            r.column_name,
            r.data_type,
            r.column_name,
            r.column_name,
            r.column_name,
            r.table_schema,
            r.table_name
        );
    end loop;
end $$;

select *
from public_date_column_profile
order by table_name, column_name;

\echo 'Date/timestamp profiling completed. Review sparse or null-heavy columns before staging filters or joins depend on them.'

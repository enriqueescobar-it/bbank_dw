\pset pager off
\echo 'Profiling public join keys for staging join readiness...'

drop table if exists pg_temp.public_join_key_profile;

create temp table public_join_key_profile (
    source_schema text not null,
    source_table text not null,
    source_column text not null,
    source_data_type text not null,
    referenced_schema text,
    referenced_table text,
    referenced_column text,
    referenced_data_type text,
    constraint_name text,
    total_rows bigint not null,
    non_null_rows bigint not null,
    distinct_values bigint not null,
    unmatched_rows bigint
);

do $$
declare
    r record;
begin
    for r in
        select
            src_ns.nspname as source_schema,
            src_cls.relname as source_table,
            src_att.attname as source_column,
            format_type(src_att.atttypid, src_att.atttypmod) as source_data_type,
            ref_ns.nspname as referenced_schema,
            ref_cls.relname as referenced_table,
            ref_att.attname as referenced_column,
            format_type(ref_att.atttypid, ref_att.atttypmod) as referenced_data_type,
            con.conname as constraint_name
        from pg_constraint con
        join pg_class src_cls on src_cls.oid = con.conrelid
        join pg_namespace src_ns on src_ns.oid = src_cls.relnamespace
        join pg_class ref_cls on ref_cls.oid = con.confrelid
        join pg_namespace ref_ns on ref_ns.oid = ref_cls.relnamespace
        join unnest(con.conkey) with ordinality as src_cols(attnum, ord) on true
        join unnest(con.confkey) with ordinality as ref_cols(attnum, ord) on ref_cols.ord = src_cols.ord
        join pg_attribute src_att on src_att.attrelid = src_cls.oid and src_att.attnum = src_cols.attnum
        join pg_attribute ref_att on ref_att.attrelid = ref_cls.oid and ref_att.attnum = ref_cols.attnum
        where con.contype = 'f'
          and src_ns.nspname = 'public'
          and ref_ns.nspname = 'public'
        order by src_cls.relname, con.conname, src_cols.ord
    loop
        execute format(
            'insert into public_join_key_profile
             select %L, %L, %L, %L, %L, %L, %L, %L, %L,
                    count(*),
                    count(src.%I),
                    count(distinct src.%I),
                    count(*) filter (where src.%I is not null and ref.%I is null)
             from %I.%I src
             left join %I.%I ref on ref.%I = src.%I',
            r.source_schema,
            r.source_table,
            r.source_column,
            r.source_data_type,
            r.referenced_schema,
            r.referenced_table,
            r.referenced_column,
            r.referenced_data_type,
            r.constraint_name,
            r.source_column,
            r.source_column,
            r.source_column,
            r.referenced_column,
            r.source_schema,
            r.source_table,
            r.referenced_schema,
            r.referenced_table,
            r.referenced_column,
            r.source_column
        );
    end loop;
end $$;

select *
from public_join_key_profile
order by
    unmatched_rows desc nulls last,
    non_null_rows asc,
    source_table,
    source_column;

\echo 'Join-key profiling completed. Investigate non-zero unmatched_rows before staging joins depend on those keys.'

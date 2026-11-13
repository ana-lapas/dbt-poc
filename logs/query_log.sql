-- created_at: 2026-11-13T12:39:15.876861908+00:00
-- finished_at: 2026-11-13T12:39:17.911016504+00:00
-- elapsed: 2.0s
-- outcome: error
-- error vendor code: -2147483648
-- error message: Unknown: [BigQuery] googleapi: Error 404: Not found: Dataset meu-mvp-dbt:dbt_fin_ana_dbt_test__audit was not found in location US, notFound
-- dialect: bigquery
-- node_id: not available
-- query_id: not available
-- desc: Extracting freshness from information schema
SELECT
                 legacy.dataset_id AS table_schema,
                 legacy.table_id AS table_name,
                 IF(info.table_type = 'EXTERNAL', NULL, TIMESTAMP_MILLIS(legacy.last_modified_time)) AS last_altered,
                 (legacy.type = 2) AS is_view
             FROM `meu-mvp-dbt`.`dbt_fin_ana_dbt_test__audit`.__TABLES__ legacy
             LEFT JOIN `meu-mvp-dbt`.`dbt_fin_ana_dbt_test__audit`.INFORMATION_SCHEMA.TABLES info
               ON info.table_schema = legacy.dataset_id
              AND info.table_name = legacy.table_id;

-- created_at: 2026-11-13T12:39:15.876970872+00:00
-- finished_at: 2026-11-13T12:39:20.800106128+00:00
-- elapsed: 4.9s
-- outcome: success
-- dialect: bigquery
-- node_id: not available
-- query_id: adbc-a1ae2b02-2bef-4abf-81a3-6542c2068043
-- desc: Extracting freshness from information schema
SELECT
                 legacy.dataset_id AS table_schema,
                 legacy.table_id AS table_name,
                 IF(info.table_type = 'EXTERNAL', NULL, TIMESTAMP_MILLIS(legacy.last_modified_time)) AS last_altered,
                 (legacy.type = 2) AS is_view
             FROM `meu-mvp-dbt`.`dbt_fin_ana`.__TABLES__ legacy
             LEFT JOIN `meu-mvp-dbt`.`dbt_fin_ana`.INFORMATION_SCHEMA.TABLES info
               ON info.table_schema = legacy.dataset_id
              AND info.table_name = legacy.table_id;

-- created_at: 2026-11-13T12:39:15.877160452+00:00
-- finished_at: 2026-11-13T12:39:21.159654863+00:00
-- elapsed: 5.3s
-- outcome: success
-- dialect: bigquery
-- node_id: not available
-- query_id: adbc-8ca231c8-41bc-4ebf-a181-18fd3b9b4643
-- desc: dbt State run clock
SELECT UNIX_MILLIS(CURRENT_TIMESTAMP());

-- created_at: 2026-11-13T12:39:21.171380564+00:00
-- finished_at: 2026-11-13T12:39:23.558653896+00:00
-- elapsed: 2.4s
-- outcome: success
-- dialect: bigquery
-- node_id: not available
-- query_id: adbc-d7f67f8d-a852-4888-8970-9e5b87231880
-- desc: Fetch view definitions
SELECT
    table_catalog,
    table_schema,
    table_name,
    view_definition
FROM `meu-mvp-dbt`.`dbt_fin_ana`.INFORMATION_SCHEMA.VIEWS
WHERE table_name IN ('fct_daily_gmv');

-- created_at: 2026-11-13T12:39:21.174719243+00:00
-- finished_at: 2026-11-13T12:39:23.932912603+00:00
-- elapsed: 2.8s
-- outcome: success
-- dialect: bigquery
-- node_id: not available
-- query_id: adbc-d2a891fd-0d4e-4a55-a65b-cd27bd03392f
-- desc: Fetch view definitions
SELECT
    table_catalog,
    table_schema,
    table_name,
    view_definition
FROM `meu-mvp-dbt`.`dbt_fin_ana`.INFORMATION_SCHEMA.VIEWS
WHERE table_name IN ('fct_daily_gmv');

-- created_at: 2026-11-13T12:39:21.172873127+00:00
-- finished_at: 2026-11-13T12:39:24.025291246+00:00
-- elapsed: 2.9s
-- outcome: success
-- dialect: bigquery
-- node_id: not available
-- query_id: adbc-4dadfe48-a2a7-4aa7-a5af-556bd4409169
-- desc: Fetch view definitions
SELECT
    table_catalog,
    table_schema,
    table_name,
    view_definition
FROM `meu-mvp-dbt`.`dbt_fin_ana`.INFORMATION_SCHEMA.VIEWS
WHERE table_name IN ('fct_daily_gmv');

-- created_at: 2026-11-13T12:39:21.177502284+00:00
-- finished_at: 2026-11-13T12:39:24.979127724+00:00
-- elapsed: 3.8s
-- outcome: success
-- dialect: bigquery
-- node_id: not available
-- query_id: adbc-78aa9a4f-7797-4bc3-bcde-671cace7cb39
-- desc: Fetch view definitions
SELECT
    table_catalog,
    table_schema,
    table_name,
    view_definition
FROM `meu-mvp-dbt`.`dbt_fin_ana`.INFORMATION_SCHEMA.VIEWS
WHERE table_name IN ('fct_daily_gmv');

-- created_at: 2026-11-13T12:39:23.811686769+00:00
-- finished_at: 2026-11-13T12:39:26.515857695+00:00
-- elapsed: 2.7s
-- outcome: success
-- dialect: bigquery
-- node_id: test.jaffle_shop.assert_gmv_is_positive
-- query_id: adbc-4c55a5ef-77a2-4108-83d4-461a2605b98b
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.jaffle_shop.assert_gmv_is_positive", "profile_name": "finance_project", "target_name": "dev"} */

    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  select
    order_date,
    gmv
from `meu-mvp-dbt`.`dbt_fin_ana`.`fct_daily_gmv`
where gmv < 0 or gmv is null
  
  
      
    ) dbt_internal_test;

-- created_at: 2026-11-13T12:39:24.297920478+00:00
-- finished_at: 2026-11-13T12:39:28.022973051+00:00
-- elapsed: 3.7s
-- outcome: success
-- dialect: bigquery
-- node_id: test.jaffle_shop.not_null_fct_daily_gmv_gmv.499dcbaf83
-- query_id: adbc-9b30144f-cd5b-4f0b-95b9-a4a5b53f240e
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.jaffle_shop.not_null_fct_daily_gmv_gmv.499dcbaf83", "profile_name": "finance_project", "target_name": "dev"} */

    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select gmv
from `meu-mvp-dbt`.`dbt_fin_ana`.`fct_daily_gmv`
where gmv is null



  
  
      
    ) dbt_internal_test;

-- created_at: 2026-11-13T12:39:24.184330487+00:00
-- finished_at: 2026-11-13T12:39:28.474203704+00:00
-- elapsed: 4.3s
-- outcome: success
-- dialect: bigquery
-- node_id: test.jaffle_shop.not_null_fct_daily_gmv_order_date.d99d78689d
-- query_id: adbc-91f99bf5-c06c-4126-b802-030e439abf91
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.jaffle_shop.not_null_fct_daily_gmv_order_date.d99d78689d", "profile_name": "finance_project", "target_name": "dev"} */

    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select order_date
from `meu-mvp-dbt`.`dbt_fin_ana`.`fct_daily_gmv`
where order_date is null



  
  
      
    ) dbt_internal_test;

-- created_at: 2026-11-13T12:39:25.242248054+00:00
-- finished_at: 2026-11-13T12:39:29.196125255+00:00
-- elapsed: 4.0s
-- outcome: success
-- dialect: bigquery
-- node_id: test.jaffle_shop.unique_fct_daily_gmv_order_date.df3dd9f029
-- query_id: adbc-a412bf4e-6f0d-4c9e-8b6d-8c8eacb44267
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.jaffle_shop.unique_fct_daily_gmv_order_date.df3dd9f029", "profile_name": "finance_project", "target_name": "dev"} */

    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with dbt_test__target as (

  select order_date as unique_field
  from `meu-mvp-dbt`.`dbt_fin_ana`.`fct_daily_gmv`
  where order_date is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1



  
  
      
    ) dbt_internal_test;


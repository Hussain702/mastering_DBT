{{config(materialized='view')}}  -- block level config

SELECT 
 *
 FROM 
      {{source('source','dim_store')}}
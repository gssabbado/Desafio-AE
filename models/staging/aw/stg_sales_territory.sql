with source as (

    select * from {{ source('adventure_works','SALES_SALESTERRITORY') }}

),

renamed as (

    select 
 
        TerritoryID as territory_id,
        Name as territory_name,
        CountryRegionCode as country_region_id, 
        "group" as territory_group, 
        SalesYTD as sales_ytd,
        SalesLastYear as sales_last_year,
        CostYTD as cost_ytd, 
        CostLastYear as cost_last_year

    from source
)

select * from renamed
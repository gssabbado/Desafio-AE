with source as (

    select * from {{ source('adventure_works','SALES_SALESTERRITORY') }}

),

renamed as (

    select 
 
        cast(TerritoryID as int) as territory_id,
        cast(Name as string) as territory_name,
        cast(CountryRegionCode as varchar(2)) as country_region_code, 
        cast("group" as string) as territory_group, 
        cast(SalesYTD as numeric(18,4)) as sales_ytd,
        cast(SalesLastYear as numeric(18, 4)) as sales_last_year,
        cast(CostYTD as numeric(18,4)) as cost_ytd, 
        cast(CostLastYear as numeric(18,4)) as cost_last_year

    from source
)

select * from renamed

/* 
    This test ensures that the gross sales for 2011 match
    the audited accounting value:
    $ 12.646.11,16
*/
with 
    sales_2011 as (
        select 
            sum(gross_total) as total_gross_sales
        from 
            {{ ref('int_sales')}}
        where 
            extract(year from order_date) = 2011
),

expected as (
    select 12646112.16 as expected_value
)

select
    sales_2011.total_gross_sales,
    expected.expected_value
from
    sales_2011, expected
where
    round(sales_2011.total_gross_sales, 2) != expected.expected_value
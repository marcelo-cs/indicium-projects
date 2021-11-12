with
    selected as (
        select
            productid               /* Primary Key */
            , productsubcategoryid  /* Foreign Key */
            , productmodelid        /* Foreign Key */

            , product_name
            , product_color
            , standardcost
            , listprice
            , product_size
            , product_weight
            , productline
   
        from {{ ref('stg_product')}}
    )
    , transformed as (
        select
        /* create new surrogate key*/
            row_number() over (order by productid) as product_sk
            , *
        from selected
    )

select * 
from transformed
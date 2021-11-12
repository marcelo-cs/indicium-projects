with
    source as (
        select
            /* Primary Key */
            salesorderid
            , salesorderdetailid
            
            /* Foreign Key */
            , productid
            , specialofferid
            
            , carriertrackingnumber
            , orderqty
            , unitprice
            , unitpricediscount
            , rowguid
            , modifieddate

        from {{ source('final_dw','salesorderdetail')}}
    )

select * from source
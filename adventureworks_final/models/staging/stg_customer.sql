with
    source as (
        select
            /* Primary Key */
            customerid
            
            /* Foreign Key */
            , personid
            , storeid
            , territoryid

            , rowguid
            , modifieddate
            
        from {{ source('final_dw','customer')}}
    )

select * from source
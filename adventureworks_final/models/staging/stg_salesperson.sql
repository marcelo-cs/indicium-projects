with
    source as (
        select
            /* Primary Key */
            businessentityid
            
            /* Foreign Key */
            , territoryid

            , salesquota
            , bonus
            , commissionpct
            , salesytd
            , saleslastyear
            , rowguid
            , modifieddate
            
        from {{ source('final_dw','salesperson')}}
    )

select * from source
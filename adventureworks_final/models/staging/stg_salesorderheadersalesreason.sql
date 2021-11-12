with
    source as (
        select
            /* Primary Key */
           salesorderid
           , salesreasonid
           
           , modifieddate

        from {{ source('final_dw','salesorderheadersalesreason')}}
    )

select * from source
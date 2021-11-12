with
    source as (
        select
            /* Primary Key */
            salesreasonid
	
            , salesreason.name as salesreason_name
            , reasontype
            , modifieddate

        from {{ source('final_dw','salesreason')}}
    )

select * from source
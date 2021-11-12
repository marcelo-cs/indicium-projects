with
    source as (
        select
            /* Primary Key */
            countryregioncode	
            
            , countryregion.name as countryregion_name

        from {{ source('final_dw','countryregion')}}
    )

select * from source
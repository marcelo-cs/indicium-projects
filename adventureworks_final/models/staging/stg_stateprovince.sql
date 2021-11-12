with
    source as (
        select
            /* Primary Key */
            stateprovinceid
            
            /* Foreign Key */
            , countryregioncode
            , territoryid

            , stateprovincecode
            , stateprovince.name as stateprovince_name
            , isonlystateprovinceflag
            , rowguid
            , modifieddate

        from {{ source('final_dw','stateprovince')}}
    )

select * from source
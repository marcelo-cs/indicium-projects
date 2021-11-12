with
    source as 
    (
        select
            /* Primary Key */
            territoryid
            , countryregioncode
            , salesterritory.name as salesterritory_name
            , salesterritory.group as salesterritory_region
            , salesytd
            , saleslastyear
            , costytd
            , costlastyear
            , rowguid
            , modifieddate

        from {{ source('final_dw','salesterritory')}}
    )
    
select * from source
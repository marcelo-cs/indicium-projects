with
    source as (
        select
            /* Primary Key */
            addressid
            
            /* Foreign Key */
            , stateprovinceid
            
            , addressline1
            , addressline2	
            , city	
            , postalcode		
            , spatiallocation
            , rowguid
            , modifieddate

        from {{ source('final_dw','person_address')}}
    )

select * from source
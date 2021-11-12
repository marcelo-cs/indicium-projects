with
    source as (
        select
            /* Primary Key */
            businessentityid
            
            , persontype
            , namestyle
            , title
            , firstname
            , middlename
            , lastname
            , suffix
            , emailpromotion
            , additionalcontactinfo
            , demographics
            , rowguid
            , modifieddate
            
        from {{ source('final_dw','person')}}
    )

select * from source
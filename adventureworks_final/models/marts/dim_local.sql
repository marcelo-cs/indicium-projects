with
    person_address as (
        select *
        from {{ ref('stg_person_address')}} as person_address
    )
    , state_province as (
        select *
        from {{ ref('stg_stateprovince')}} as state_province
    )
    , country as (
        select *
        from {{ ref('stg_countryregion')}} as country
    )
    , state_with_sk as (
        select
            person_address.addressid
            , person_address.city
            , state_province.stateprovince_name
            , state_province.countryregioncode
            
        from person_address
        left join state_province on person_address.stateprovinceid = state_province.stateprovinceid
    )
    , final as (
        select
            /* create new surrogate key*/
            row_number() over (order by state_with_sk.addressid) as personaddress_sk
            , state_with_sk.addressid
            , state_with_sk.city
            , state_with_sk.stateprovince_name
            , country.countryregion_name
            
        from state_with_sk
        left join country on state_with_sk.countryregioncode = country.countryregioncode
    )
select * 
from final
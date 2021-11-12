with
    customer as (
        select *
        from {{ ref('stg_customer')}} as customer
    )
    , person as (
        select *
        from {{ ref('stg_person')}} as person
    )
    , final as (
        select
            /* create new surrogate key*/
            row_number() over (order by customerid) as customer_sk
            , customer.customerid
            , customer.personid
            , customer.storeid
            , customer.territoryid
            , person.persontype
            , person.title
            , person.firstname ||" "|| ifnull(person.middlename,'') ||" "|| person.lastname as fullname

        from customer
        left join person on customer.customerid = person.businessentityid
    )
select * 
from final
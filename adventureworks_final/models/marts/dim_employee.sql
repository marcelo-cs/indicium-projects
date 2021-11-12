with
    salesperson as (
        select *
        from {{ ref('stg_salesperson')}} as salesperson
    )
    , employee as (
        select *
        from {{ ref('stg_employee')}} as employee
    )
    , person as (
        select *
        from {{ ref('stg_person')}} as person
    )
    , salesperson_with_sk as (
        select
            /* create new surrogate key*/
            row_number() over (order by salesperson.businessentityid) as salesperson_sk
            , salesperson.businessentityid
            , salesperson.territoryid
            , salesperson.salesquota
            , salesperson.salesytd
            , employee.jobtitle
            , employee.gender
            
        from salesperson
        left join employee on salesperson.businessentityid = employee.businessentityid
    )
    , final as (
        select 
            salesperson_with_sk.salesperson_sk
            , salesperson_with_sk.businessentityid
            , salesperson_with_sk.territoryid
            , salesperson_with_sk.salesquota
            , salesperson_with_sk.salesytd
            , salesperson_with_sk.jobtitle
            , salesperson_with_sk.gender
            , person.persontype
            , person.title
            , person.firstname ||" "|| ifnull(person.middlename,'') ||" "|| person.lastname as fullname

        from salesperson_with_sk
        left join person on salesperson_with_sk.businessentityid = person.businessentityid
    )
select * 
from final